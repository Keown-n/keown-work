age: int = 30

if age >= 21:
    print('You may enter the club!')
else:
    print('You are not allowed in...')


weather: str = 'cloudy'

if weather == 'clear':
    print('It is a nice day!')
elif weather == 'cloudy':
    print('The weather could be better...')
elif weather == 'rainy':
    print('What an awful day!')
else:
    print('Unknown weather')

number: int = 10
result: str = 'Above 0' if number > 0 else '0 and below'
print(result)

condition: bool = False
var: str = 'True' if condition else 'False'

if condition:
    var: str = 'True'
else:
    var: str = 'False'

print(var)