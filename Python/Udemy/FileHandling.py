from typing import TextIO
#
# file_path: str = 'info.txt'
#
# file: TextIO = open(file_path, 'r')
# text: str = file.read()
# print(text)
# file.close()
#

# file_path: str = 'info.txt'
#
# try:
#     with open(file_path, 'r') as file:
#         text: str = file.read()
#         print(text)
# except FileNotFoundError:
#     print(f'Error: File "{file_path}" not found')  # More descriptive error

# file_path: str = 'info.txt'
#
# try:
#     with open(file_path, 'r') as file:
#
#         print(file.readline())
#        # print(file.read(5))
#        # print(file.read(5))
#
# except FileNotFoundError:
#     print(f'Error: File "{file_path}" not found')  # More descriptive error
#
# file_path: str = 'info.txt'
#
# try:
#     with open(file_path, 'a') as txt:
#         txt.write('I am some text!\n')
#         print(f"Successfully appended to {file_path}")
# except Exception as e:
#     print(f"Unexpected error: {str(e)}")

# file_path: str = 'info.txt'
# content: list[str] = ['Hello', 'Bob!']
# with open(file_path, 'w', ) as txt:
#         txt.write('\n'.join(content))
#         print(f"Successfully wrote to {file_path}")
import json
from typing import Dict, Any

file_path: str = 'data.json'

with open(file_path, 'r') as file:
        data: Dict[str, Any] = json.load(file)  # Fixed syntax and added type hints
        print("Successfully loaded JSON data:")
        print(json.dumps(data) ) # Pretty-print the JSON


