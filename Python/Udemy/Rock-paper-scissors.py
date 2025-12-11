import random
import sys

print("Welcome to the game")

moves = {'rock': '🪨','paper': '📃','scissor':'✂️'}

valid_moves = list(moves.keys())

while True:
    uMove = input('Rock,Paper or Scissor?').lower()

    if uMove =='exit':
        sys.exit()

    if uMove not in valid_moves:
        print('Invalid move.....')
        continue

    ai = random.choice(valid_moves)

    print('---------------')
    print(f'You: {moves[uMove]}')
    print(f'AI: {moves[ai]}')

    if uMove == ai:
        print('It is a tie!')
    elif uMove == 'rock' and ai == 'scissors':
        print('You win!')
    elif uMove == 'scissors' and ai == 'paper':
        print('You win!')
    elif uMove == 'paper' and ai == 'rock':
        print('You win!')
    else:
        print('You lose!')


