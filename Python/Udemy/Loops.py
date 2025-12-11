text = 'hello'

for i in range(3):
    print(text)

mylist = ['bob','jphn','kve']

for item in mylist:
    print(item)

i = 5

while i>0:
    print(f"{i}. Hello")
    i-=1

#while True:
#    user_input: str = input('You: ')

#    if user_input == 'hello':
 #        print('Bot: Hey there!')
  #  else:
   #     print('Bot: Yes, that is interesting!')


total = 0

print('Welcome to Calc+! Add positive numbers, or insert "0" to exit.')
while True:
    user_input: int = int(input('Enter a number: '))

    if user_input < 0:
        print('!!!Please enter positive numbers only!!!!')
        continue

    if user_input == 0:
        print(f'Total: {total}')
        break


total += user_input

print(total)

for i in range(3):
    print(f'Iteration: {i}')
else:
    print('Success')


