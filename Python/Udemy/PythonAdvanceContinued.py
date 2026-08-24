####################################
#memorization
##################################333
#
# import time
# from functools import cache
#
# @cache
# def count_vowels(text: str) -> int:
#     """Count vowels in text (with caching)"""
#     print('Counting...')  # This will only show for uncached calls
#     time.sleep(3)  # Simulate expensive computation
#     return sum(text.count(vowel) for vowel in 'AEIOUaeiou')
#
# def main() -> None:
#     while True:
#         user_input: str = input('You: ').lower()
#
#         if user_input == 'exit':
#             break
#         elif user_input == 'info':
#             print(f'Bot: {count_vowels.cache_info()}')
#         elif user_input == 'clear':
#             count_vowels.cache_clear()
#             print('Bot: Cache has been cleared')
#         else:
#             print(f'Bot: That text contains {count_vowels(user_input)} vowels')
#
# if __name__ == '__main__':
#     main()
####################################
#@cached_property
##################################333
# import time
# from functools import cached_property
#
# class DataSet:
#     def __init__(self, data: list[float]) -> None:
#         self._data = data  # Fixed to use underscore prefix
#
#     def show_data(self) -> None:
#         print(self._data)  # Fixed to match attribute name
#
#     @cached_property
#     def sum(self) -> float:
#         """Calculate and cache the sum of the dataset"""
#         print('Calculating sum...')
#         time.sleep(2)  # Simulate expensive calculation
#         return sum(self._data)  # Fixed return statement
#
#     @cached_property
#     def mean(self) -> float:
#         """Calculate and cache the mean of the dataset"""
#         print('Calculating mean...')
#         time.sleep(2)  # Simulate expensive calculation
#         return sum(self._data) / len(self._data)
#
# def main() -> None:
#     ds: DataSet = DataSet([1.5, 2.5, 10, 7])
#     ds.show_data()
#
#     while True:
#         user_input: str = input('You: ').lower()
#
#         if user_input == 'exit':
#             break
#         elif user_input == 'clean sum':
#             del ds.sum  # Corrected attribute name
#             print('Sum cache cleared!')
#         elif user_input == 'clean mean':
#             del ds.mean
#             print('Mean cache cleared!')
#         elif user_input == 'sum':
#             print(f'Sum: {ds.sum}')
#         elif user_input == 'mean':
#             print(f'Mean: {ds.mean}')
#         else:
#             print('Unknown command...')
#
# if __name__ == '__main__':
#     main()
####################################
#Monkey Patching
##################################333

import time
import logging


class Internet:
    def __init__(self, provider: str) -> None:
        self.provider = provider

    def connect(self) -> None:
        """Simulate internet connection"""
        print(f'[{self.provider}] Connecting...')
        time.sleep(2)  # Simulate connection delay
        print(f'[{self.provider}] You are now connected!')


def test_connect() -> None:
    """Mock connection for testing"""
    print('[Provider] You are now connected!')


def main() -> None:
    # Original connection
    internet: Internet = Internet('Verizon')
    internet.connect()

    # Test with mocked connection
    internet.connect = test_connect  # Monkey-patch the method
    internet.connect()


if __name__ == '__main__':
    main()





