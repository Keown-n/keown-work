# Employee Attrition Predictor and Retention Application

A hackathon project that uses a Random Forest model to estimate employee
attrition risk and provide rule-based retention recommendations through a web
interface.

The repository contains the training workflow, a saved scikit-learn pipeline,
a FastAPI application and supporting frontend files. An optional OpenRouter
integration adds a concise AI-generated analysis when a key is configured.

## Features

- Accepts employee profile and workplace inputs through a browser form
- Applies the saved preprocessing and Random Forest pipeline
- Returns a predicted attrition outcome and probability
- Groups the probability into low, medium or high risk
- Generates rule-based retention recommendations
- Optionally requests additional analysis through OpenRouter
- Provides a `/ping` endpoint for a basic health check

## Technology

- Python
- pandas and NumPy
- scikit-learn
- FastAPI and Uvicorn
- Jinja2, HTML, CSS and JavaScript
- Jupyter Notebook
- joblib
- OpenRouter API integration
- Power BI was used for the accompanying analysis work

## Project structure

```text
AttritionMachineLearning/
├── AttritionML.ipynb          Notebook workflow
├── train_model.py             Model training and export
├── app.py                     FastAPI application
├── attrition_model.joblib     Saved preprocessing and model pipeline
├── categorical_options.json   Dropdown values used by the interface
├── templates/index.html       Application page
├── static/                    CSS and JavaScript
├── test_endpoint.py           Example endpoint request
├── test_medium.py             Medium-risk example request
└── requirements.txt           Python dependencies
```

## Local setup

### 1. Create and activate a virtual environment

PowerShell:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

### 2. Install dependencies

```powershell
pip install -r requirements.txt
```

### 3. Configure the optional AI analysis

Copy `.env.example` to `.env` and add your own OpenRouter key:

```text
OPENROUTER_API_KEY=your_key_here
```

The prediction endpoint continues to return model results and rule-based
recommendations if the optional AI request cannot be completed.

### 4. Start the application

Run this command from the project directory:

```powershell
uvicorn app:app --reload
```

Open `http://127.0.0.1:8000` in a browser. The health-check endpoint is
available at `http://127.0.0.1:8000/ping`.

### 5. Exercise the endpoint

With the server running, use either example request:

```powershell
python test_endpoint.py
python test_medium.py
```

## Model training

`train_model.py` expects the training CSV referenced inside the script to be in
this directory. The dataset itself is not included in this repository.

Running the training script creates a new `attrition_model.joblib` file and
refreshes `categorical_options.json`:

```powershell
python train_model.py
```

## Important limitations

- This was created as a hackathon prototype, not an HR decision system.
- Predictions depend on the training dataset and selected features.
- Retention suggestions use fixed thresholds and are not individualized HR
  advice.
- The application should not be used to make employment decisions without
  appropriate human review, validation and governance.
- Do not submit real employee information to a third-party AI service without
  the required privacy and organizational approvals.

## Security

API keys are read from environment variables. Never commit a populated `.env`
file. If a key has previously been committed, revoke it and issue a new one.

## Status

Hackathon prototype with a local web interface. It is not described as a
deployed production application.
