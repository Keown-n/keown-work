import requests

url = 'http://127.0.0.1:8000/predict'

data = {
    'Age': 28,
    'DailyRate': 500,
    'DistanceFromHome': 15,
    'EnvironmentSatisfaction': 2,
    'JobInvolvement': 2,
    'JobLevel': 2,
    'JobSatisfaction': 2,
    'MonthlyIncome': 3000,
    'StockOptionLevel': 0,
    'TotalWorkingYears': 5,
    'TrainingTimesLastYear': 2,
    'WorkLifeBalance': 2,
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
