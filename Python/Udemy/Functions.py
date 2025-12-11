from datetime import datetime

def show_time():

    now =datetime.now()
    print(now)

show_time()

def get_statu():
    pass

def connect():
    ...


#parameters

def greet( name):
    print(f'Hello {name}')

greet('john')

def greet(name: str, language: str = 'en', default: str = 'Hello'):
    if language == 'it':
        print(f'Ciao, {name}!')
    else:
        print(f'{default}, {name}!')
greet('Manio', 'it')
greet('John')

#return

def get_length(text) -> int:
    print(f'gettimg the length {text}')
    return len(text)



