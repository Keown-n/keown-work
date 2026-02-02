import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.metrics import classification_report, accuracy_score
import numpy as np
 
# Load the dataset
df = pd.read_csv('WA_Fn-UseC_-HR-Employee-Attrition.csv')
 
# Define the target variable
target = 'Attrition'
df[target] = df[target].map({'Yes': 1, 'No': 0})  # Convert to binary: 1 for Yes, 0 for No
 
# Features as specified
numerical_features = [
    'Age', 'DailyRate', 'DistanceFromHome', 'EnvironmentSatisfaction',
    'JobInvolvement', 'JobLevel', 'JobSatisfaction', 'MonthlyIncome',
    'StockOptionLevel', 'TotalWorkingYears', 'TrainingTimesLastYear',
    'WorkLifeBalance', 'YearsAtCompany', 'YearsInCurrentRole',
    'YearsWithCurrManager'
]
 
categorical_features = [
    'BusinessTravel', 'Department', 'EducationField', 'JobRole',
    'MaritalStatus', 'OverTime'
]
 
# Select features and target
X = df[numerical_features + categorical_features]
y = df[target]
 
# Preprocessing pipeline
preprocessor = ColumnTransformer(
    transformers=[
        ('num', 'passthrough', numerical_features),  # Numerical features as is
        ('cat', OneHotEncoder(handle_unknown='ignore'), categorical_features)  # One-hot encode categoricals
    ]
)
 
# Create the pipeline with Random Forest Classifier
model = Pipeline(steps=[
    ('preprocessor', preprocessor),
    ('classifier', RandomForestClassifier(n_estimators=100, random_state=42))
])
 
# Split the data into train and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
 
# Train the model
model.fit(X_train, y_train)
 
# Make predictions on the test set
y_pred = model.predict(X_test)
y_prob = model.predict_proba(X_test)[:, 1]  # Probability of Attrition=Yes (1)
 
# Evaluate the model
print("Accuracy:", accuracy_score(y_test, y_pred))
print("Classification Report:\n", classification_report(y_test, y_pred))
 
# Bin probabilities into Low, Medium, High risk
bins = [0, 0.33, 0.66, 1.0]
labels = ['Low', 'Medium', 'High']
risk_levels = pd.cut(y_prob, bins=bins, labels=labels, include_lowest=True)
 
# Create the results DataFrame
results = pd.concat([pd.DataFrame({
    'Actual': y_test.reset_index(drop=True),
    'Predicted': y_pred,
    'Probability': y_prob,
    'Risk Level': risk_levels
}), X_test.reset_index(drop=True)], axis=1)
 
# Define retention strategies with thresholds for key features
# Thresholds are based on typical dataset statistics and attrition risk factors:
# - Numerical: Using approximate medians/quartiles where low/high values increase risk (e.g., low Age < 30, high DistanceFromHome > 10)
# - Categorical: Conditions like OverTime == 'Yes'
strategies = {
    'OverTime': {
        'condition': lambda row: row['OverTime'] == 'Yes',
        'strategy': 'Implement overtime caps, flexible scheduling, and burnout prevention programs to improve work-life balance.'
    },
    'MonthlyIncome': {
        'condition': lambda row: row['MonthlyIncome'] < 5000,  # Below approximate median (~6500)
        'strategy': 'Offer competitive salary reviews, bonuses, or financial wellness programs to address compensation concerns.'
    },
    'Age': {
        'condition': lambda row: row['Age'] < 30,  # Younger employees often at higher risk
        'strategy': 'Provide mentorship, career development paths, and intergenerational team-building for younger employees.'
    },
    'TotalWorkingYears': {
        'condition': lambda row: row['TotalWorkingYears'] < 10,  # Less experience linked to higher attrition
        'strategy': 'Introduce loyalty incentives, sabbaticals, or internal rotations to retain mid-career talent.'
    },
    'JobLevel': {
        'condition': lambda row: row['JobLevel'] < 2,  # Entry-level roles at higher risk
        'strategy': 'Establish clear promotion pathways and leadership training for lower-level employees.'
    },
    'YearsAtCompany': {
        'condition': lambda row: row['YearsAtCompany'] < 5,  # Short tenure increases risk
        'strategy': 'Enhance onboarding with check-ins and anniversary perks to improve early retention.'
    },
    'YearsWithCurrManager': {
        'condition': lambda row: row['YearsWithCurrManager'] < 3,  # Instability with manager
        'strategy': 'Train managers in relationship-building and conduct team-building events.'
    },
    'StockOptionLevel': {
        'condition': lambda row: row['StockOptionLevel'] == 0,  # No options linked to lower commitment
        'strategy': 'Expand equity programs and educate on long-term benefits to increase employee investment.'
    },
    'DistanceFromHome': {
        'condition': lambda row: row['DistanceFromHome'] > 10,  # Longer commutes increase risk
        'strategy': 'Support remote/hybrid work options or relocation assistance to reduce commute stress.'
    },
    'JobSatisfaction': {
        'condition': lambda row: row['JobSatisfaction'] < 3,  # Low satisfaction (scale 1-4)
        'strategy': 'Conduct satisfaction surveys and implement recognition programs to boost morale.'
    }
}
 
# Function to determine strategies for a row
def get_strategies(row):
    suggested = []
    for feature, info in strategies.items():
        if info['condition'](row):
            suggested.append(f"{feature}: {info['strategy']}")
    if not suggested:
        suggested.append("No specific strategies needed based on thresholds.")
    return '; '.join(suggested)
 
# Add Suggested Strategies column, applying only if Risk Level is Medium or High
results['Suggested_Strategies'] = results.apply(
    lambda row: get_strategies(row) if row['Risk Level'] in ['Medium', 'High'] else 'Low risk - Monitor generally.',
    axis=1
)
 
# Example: Print some predictions with risk levels and strategies
print("\nSample Predictions with Strategies:\n", results.head(10))