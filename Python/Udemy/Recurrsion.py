#recurrsion
import time

def func() -> None:
     print('recurring')
     func()

func()

def connect_to_internet(signal : bool , delay :int) ->None:
    if delay > 5:
        signal = True

    if signal :
        print('Connected')

    else:
        print(f'Connection failed. Trying again in: {delay} sc')

        time.sleep(delay)
        connect_to_internet(signal,delay+2)
        