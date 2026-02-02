import requests

url = 'http://127.0.0.1:8000/predict'

data = {
    'Age': 30,
    'DailyRate': 500,
    'DistanceFromHome': 5,
    'EnvironmentSatisfaction': 3,
    'JobInvolvement': 3,
    'JobLevel': 2,
    'JobSatisfaction': 3,
    'MonthlyIncome': 4000,
    'StockOptionLevel': 1,
    'TotalWorkingYears': 5,
    'TrainingTimesLastYear': 2,
    'WorkLifeBalance': 3,
    'YearsAtCompany': 3,
    'YearsInCurrentRole': 2,
    'YearsWithCurrManager': 1,
    'BusinessTravel': 'Travel_Rarely',
    'Department': 'Research & Development',
    'EducationField': 'Life Sciences',
    'JobRole': 'Research Scientist',
    'MaritalStatus': 'Single',
    'OverTime': 'Yes'
}

response = requests.post(url, data=data)
print('Status code:', response.status_code)
print('Response JSON:', response.json())
