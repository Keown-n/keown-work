print('A','B','C', sep='-', end=",")

#################################
elements: list[str] = ['A', 'B', 'C']

for i, element in enumerate(elements):
    print(f'{i}: {element}')

###################################

a: float = 200.31288
b: float = 18.12155
c: float = 47.1231284

result: float = a + b + c
rounded: float = round(result, 2)
print(rounded)

##################################
my_range: range = range(0, 15)
print(my_range)
print(list(my_range))

my_range: range = range(0, 10, 2)
print(my_range)
print(list(my_range))

my_range: range = range(0, -5, -1)
print(my_range)
print(list(my_range))

#######################################

text: str = "Hello, world!"

first_three: slice = slice(0, 3)
print(text[first_three])  # Output: Hel

reverse_slice: slice = slice(None, None, -1)
print(text[reverse_slice])  # Output: !dlrow ,olleH

####################################################

wifi_enabled: bool = True
has_electricity: bool = True
has_subscription: bool = True

requirements: list[bool] = [wifi_enabled, has_electricity, has_subscription]

if all(requirements):
    print('Connected to internet!')

######################################################

wifi_enabled: bool = True
has_electricity: bool = False
has_subscription: bool = True

requirements: list[bool] = [wifi_enabled, has_electricity, has_subscription]

if any(requirements):
    print('Connected to internet!')

##########################################################33

number: int = 10
pi: float = 3.14
text: str = 'banana'
my_list: list[int] = [1, 2, 3]

print(isinstance(text, int))

#################################################################

fruit : str = 'apple'
num:int=10

def func()->None:
    ...

print(f'callable(): {callable(fruit)}')
print(f'callable(): {callable(num)}')
print(f'callable(): {callable(func)}')

##############################################################
numbers: list[int] = list(range(1, 21))
print(numbers)

even_numbers: filter = filter(lambda n: n % 2 == 0, numbers)
print(even_numbers)
print(list(even_numbers))

#################################################################

numbers: list[int] = [1, 2, 3, 4, 5]

def double(number: int) -> int:
    return number * 2

doubled: map = map(double, numbers)
print(doubled)
print(list(doubled))

#######################################
numbers: list[int] = [1, 2, 3, 4, 5]
letters: list[str] = ['a', 'b', 'c']

def combine_elements(n: int, l: str) -> tuple[int, str]:
    return n, l

combined: map = map(lambda n, l: (n, l), numbers, letters)
print(list(combined))

################################################################

people: list[str] = ['Mario', 'James', 'Anna', 'Tom']
sorted_names: list[str] = sorted(people, key=lambda x: len(x))
print(sorted_names)


#############################################

while True:
    user_input: str = input('Enter math expression: ')

    result = eval(user_input)
    print(f"Result: {result}")
