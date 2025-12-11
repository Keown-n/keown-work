####################################
#Walrus Operator
# ##################################333
#
# def description(numbers: list[int]) -> dict:
#
#     # n_length: int = len(numbers)
#     # n_sum: int = sum(numbers)
#     # n_mean: float = n_sum / n_length
#
#
#     details: dict = {'length': (n_length := len(numbers)),
#                     'sum': (n_sum:= sum(numbers)),
#                     'mean': (n_mean:= n_sum / n_length)}
#
#     return details

####################################
#Lamda Function
##################################333

# p = lambda a,b: a+b
# print(p(1,2))

# from typing import Callable
#
# def use_all(f: Callable, values: list[int]) -> None:
#     for value in values:
#         f(value)
#
# use_all(lambda v: print(f'{v * "X"}'), [2, 4, 10])

####################################
#Generator
##################################333
#
# from typing import Generator
#
# def five_numbers() -> Generator[int, None, None]:  # Specify the yield type
#     for i in range(1, 6):
#         yield i
#
# numbers: Generator[int, None, None] = five_numbers()
# print(next(numbers))
# print(next(numbers))
# print(next(numbers))
#
# from typing import Generator
#
# def generate_vowels() -> Generator[str, None, None]:
#     vowels: str = 'aeiou'
#     for vowel in vowels:
#         yield vowel
#
# def main() -> None:
#     vowels: Generator[str, None, None] = generate_vowels()
#     # To actually use the generator, you might want to do something like:
#     # print(list(vowels))  # This would output: ['a', 'e', 'i', 'o', 'u']
#
#
# if __name__ == '__main__':
#     main()

####################################
#Match-Case
##################################333

# status: int = 200
#
# match status:
#     case 200:
#         print('Connected!')
#     case 403:
#         print('Forbidden...')
#     case 404:
#         print('Not found...')
#     case _:
#         print('Unknown...')
#
# while True:
#     user_input: str = input("Enter a command: ")
#     command: list[str] = user_input.split()
#
#     match command:
#         case ['find', *images]:
#             print(f'Finding: {images}...')
#         case ['enlarge', image, amount]:
#             print(f'You enlarged {image} by {amount}x')
#         case ['rename', image, new_name] if len(new_name) > 3:
#             print(f'"{image}" was renamed to "{new_name}"')
#         case _:
#             print("Unknown command")

####################################
#Decorator
##################################333
#
import time
from typing import Callable, Any
from functools import wraps
#
#
# def get_time(func: Callable) -> Callable:
#     """Times how long it takes to execute a function."""
#
#     @wraps(func)
#     def wrapper(*args: Any, **kwargs: Any) -> Any:
#         start_time: float = time.perf_counter()
#         result = func(*args, **kwargs)  # Store the result to return it
#         end_time: float = time.perf_counter()
#
#         print(f'Time: {end_time - start_time:.3f}s')
#         return result  # Return the original function's result
#
#     return wrapper
#
#
# @get_time
# def calculate() -> None:
#     """calculate() docstring"""
#     print('Calculating...')
#     for i in range(20_000_000):
#         pass
#     print('Done')
####################################
#Enum
##################################333
# from enum import Enum
#
# class State(Enum):
#     OFF: int = 0
#     ON: int = 1
#
# state: State = State.OFF
#
# if state == State.ON:
#     print('The device is turned on.')
# elif state == State.OFF:  # Fixed typo (was state.OFF)
#     print('Device is turned off...')
# else:
#     print('Unknown state')
#
# class Color(Enum):
#     RED: str = 'R'
#     GREEN: str = 'G'
#     BLUE: str = 'B'
#
# red: Color = Color.RED
# print(red)          # Prints: Color.RED
# print(red.value)    # Prints: R
# print(red.name)     # Prints: RED
# print(Color('R'))   # Prints: Color.RED (corrected from Color('Red'))


if __name__ == '__main__':


