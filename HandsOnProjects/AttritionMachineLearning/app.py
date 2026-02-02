from fastapi import FastAPI, Request, Form
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
import joblib
import pandas as pd
import json
import uvicorn
from openai import OpenAI

app = FastAPI()

# ----------------------------------------------------------------------
# Startup event – logs model and options loading status
# ----------------------------------------------------------------------
@app.on_event("startup")
async def startup_event():
    if model is None:
        print("⚠️ Model failed to load – predictions will not work.")
    else:
        print("✅ Model is ready.")
    if not categorical_options:
        print("⚠️ Categorical options missing – dropdowns may be empty.")
    else:
        print("✅ Categorical options loaded.")
    print("✅ Startup complete.")

# Simple health‑check endpoint
@app.get("/ping", response_class=HTMLResponse)
async def ping():
    return "pong"

# Mount static files and templates
app.mount("/static", StaticFiles(directory="static"), name="static")
templates = Jinja2Templates(directory="templates")

# Load model and categorical options
try:
    model = joblib.load('attrition_model.joblib')
    print('Model loaded successfully.')
except Exception as e:
    print(f'Error loading model: {e}')
    model = None

try:
    with open('categorical_options.json', 'r') as f:
        categorical_options = json.load(f)
    print('Categorical options loaded.')
except Exception as e:
    print(f'Error loading categorical options: {e}')
    categorical_options = {}

# Lazy OpenAI client initialization
_openai_client = None
def get_openai_client():
    global _openai_client
    if _openai_client is None:
        try:
            _openai_client = OpenAI(
                base_url="https://openrouter.ai/api/v1",
                api_key="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",
            )
            print("✅ OpenRouter client created.")
        except Exception as e:
            print(f"❌ Failed to create OpenRouter client: {e}")
            raise
    return _openai_client

# Retention strategies dictionary
strategies = {
    'OverTime': {
        'condition': lambda row: row['OverTime'] == 'Yes',
        'strategy': 'Implement overtime caps, flexible scheduling, and burnout prevention programs to improve work-life balance.'
    },
    'MonthlyIncome': {
        'condition': lambda row: row['MonthlyIncome'] < 5000,
        'strategy': 'Offer competitive salary reviews, bonuses, or financial wellness programs to address compensation concerns.'
    },
    'Age': {
        'condition': lambda row: row['Age'] < 30,
        'strategy': 'Provide mentorship, career development paths, and intergenerational team-building for younger employees.'
    },
    'TotalWorkingYears': {
        'condition': lambda row: row['TotalWorkingYears'] < 10,
        'strategy': 'Introduce loyalty incentives, sabbaticals, or internal rotations to retain mid-career talent.'
    },
    'JobLevel': {
        'condition': lambda row: row['JobLevel'] < 2,
        'strategy': 'Establish clear promotion pathways and leadership training for lower-level employees.'
    },
    'YearsAtCompany': {
        'condition': lambda row: row['YearsAtCompany'] < 5,
        'strategy': 'Enhance onboarding with check-ins and anniversary perks to improve early retention.'
    },
    'YearsWithCurrManager': {
        'condition': lambda row: row['YearsWithCurrManager'] < 3,
        'strategy': 'Train managers in relationship-building and conduct team-building events.'
    },
    'StockOptionLevel': {
        'condition': lambda row: row['StockOptionLevel'] == 0,
        'strategy': 'Expand equity programs and educate on long-term benefits to increase employee investment.'
    },
    'DistanceFromHome': {
        'condition': lambda row: row['DistanceFromHome'] > 10,
        'strategy': 'Support remote/hybrid work options or relocation assistance to reduce commute stress.'
    },
    'JobSatisfaction': {
        'condition': lambda row: row['JobSatisfaction'] < 3,
        'strategy': 'Conduct satisfaction surveys and implement recognition programs to boost morale.'
    }
}

def get_strategies(row):
    suggested = []
    for feature, info in strategies.items():
        try:
            if info['condition'](row):
                suggested.append(f"{feature}: {info['strategy']}")
        except Exception as e:
            print(f"Error checking strategy for {feature}: {e}")
    if not suggested:
        suggested.append("No specific strategies needed based on thresholds.")
    return suggested

@app.get("/", response_class=HTMLResponse)
async def read_root(request: Request):
    return templates.TemplateResponse("index.html", {"request": request, "categorical_options": categorical_options})

@app.post("/predict")
async def predict(
    Age: int = Form(...),
    DailyRate: int = Form(...),
    DistanceFromHome: int = Form(...),
    EnvironmentSatisfaction: int = Form(...),
    JobInvolvement: int = Form(...),
    JobLevel: int = Form(...),
    JobSatisfaction: int = Form(...),
    MonthlyIncome: int = Form(...),
    StockOptionLevel: int = Form(...),
    TotalWorkingYears: int = Form(...),
    TrainingTimesLastYear: int = Form(...),
    WorkLifeBalance: int = Form(...),
    YearsAtCompany: int = Form(...),
    YearsInCurrentRole: int = Form(...),
    YearsWithCurrManager: int = Form(...),
    BusinessTravel: str = Form(...),
    Department: str = Form(...),
    EducationField: str = Form(...),
    JobRole: str = Form(...),
    MaritalStatus: str = Form(...),
    OverTime: str = Form(...)
):
    data = {
        'Age': [Age],
        'DailyRate': [DailyRate],
        'DistanceFromHome': [DistanceFromHome],
        'EnvironmentSatisfaction': [EnvironmentSatisfaction],
        'JobInvolvement': [JobInvolvement],
        'JobLevel': [JobLevel],
        'JobSatisfaction': [JobSatisfaction],
        'MonthlyIncome': [MonthlyIncome],
        'StockOptionLevel': [StockOptionLevel],
        'TotalWorkingYears': [TotalWorkingYears],
        'TrainingTimesLastYear': [TrainingTimesLastYear],
        'WorkLifeBalance': [WorkLifeBalance],
        'YearsAtCompany': [YearsAtCompany],
        'YearsInCurrentRole': [YearsInCurrentRole],
        'YearsWithCurrManager': [YearsWithCurrManager],
        'BusinessTravel': [BusinessTravel],
        'Department': [Department],
        'EducationField': [EducationField],
        'JobRole': [JobRole],
        'MaritalStatus': [MaritalStatus],
        'OverTime': [OverTime]
    }
    df_input = pd.DataFrame(data)
    prediction = model.predict(df_input)[0]
    probability = model.predict_proba(df_input)[0][1]
    if probability < 0.33:
        risk_level = "Low"
    elif probability < 0.66:
        risk_level = "Medium"
    else:
        risk_level = "High"
    strategies_list = get_strategies(df_input.iloc[0]) if risk_level in ["Medium", "High"] else ["Low risk - Monitor generally."]
    ai_analysis = "AI analysis unavailable."
    try:
        client = get_openai_client()
        prompt = f"""
You are an expert HR consultant. Analyze the following employee profile and attrition risk.

Profile:
- Age: {Age}
- Role: {JobRole}
- Department: {Department}
- Monthly Income: {MonthlyIncome}
- OverTime: {OverTime}
- Distance From Home: {DistanceFromHome}
- Years at Company: {YearsAtCompany}
- Job Satisfaction: {JobSatisfaction}/4

Model Prediction:
- Risk Level: {risk_level}
- Probability of Attrition: {probability:.2f}

Suggested Strategies (Rule-based):
{' ; '.join(strategies_list)}

Provide a concise, professional analysis of why this employee might be at risk (or not) and suggest 2-3 specific, actionable retention strategies beyond the rule-based ones. Focus on the human element.
"""
        print("Sending request to OpenRouter...")
        response = client.chat.completions.create(
            model="x-ai/grok-4.1-fast:free",
            messages=[{"role": "user", "content": prompt}],
            extra_body={"reasoning": {"enabled": True}}
        )
        print("Response received from OpenRouter.")
        ai_analysis = response.choices[0].message.content
    except Exception as e:
        print(f"AI Error: {e}")
        ai_analysis = f"Could not generate AI analysis: {str(e)}"
    return {
        "prediction": int(prediction),
        "probability": float(probability),
        "risk_level": risk_level,
        "strategies": strategies_list,
        "ai_analysis": ai_analysis
    }

if __name__ == "__main__":
    uvicorn.run("app:app", host="127.0.0.1", port=8000, reload=True)
