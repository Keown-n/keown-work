import sys

def check_age(age: int) -> bool:
    if age < 0:
        raise ValueError('Not a valid age...')
    elif age >= 21:
        print('You are old enough!')
        return True
    else:
        print('You are not old enough...')
        return False

user_input: str = input("Enter a number: ")
try:
        number: float = float(user_input)
        print(f'You entered: {number}')
except ValueError:
        print(f'The value you entered ("{user_input}") is invalid.')  
except Exception as e:
        print('Program encountered a new exception!')
        print(f'Type: {type(e)}')
        print(f'Error: {e}')