import sys

try:
    result = 10/0

    print(result)
except Exception as e:
    print(e)

while True:
    try:
        user_input: str = input('Enter a number: ')
        print(f'10 / {user_input} = {10 / float(user_input)}')
    except ZeroDivisionError:
        print('You cannot divide by 0')
    except ValueError:
        print('Please enter a valid number...')
    except Exception as e:
        print(f'Something went wrong : {e}')
    else:
        print("Code ran successfully")

    finally:
        print("Finally: I am always excuted")





total: float = 0
while True:
    user_input: str = input('Enter a number: ')

    if user_input == '0':
        print(f'Total: {total}')
        sys.exit()

    try:
        total += float(user_input)
    except ValueError:
        print('Please enter a valid number...')
