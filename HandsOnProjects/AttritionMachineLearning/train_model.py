import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.metrics import classification_report, accuracy_score
import joblib
import json

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
print("Training model...")
model.fit(X_train, y_train)

# Evaluate the model
y_pred = model.predict(X_test)
print("Accuracy:", accuracy_score(y_test, y_pred))
print("Classification Report:\n", classification_report(y_test, y_pred))

# Save the model
print("Saving model to attrition_model.joblib...")
joblib.dump(model, 'attrition_model.joblib')

# Save unique values for categorical features to help with frontend dropdowns
print("Saving categorical options to categorical_options.json...")
categorical_options = {col: sorted(df[col].unique().tolist()) for col in categorical_features}
with open('categorical_options.json', 'w') as f:
    json.dump(categorical_options, f, indent=4)

print("Done!")
