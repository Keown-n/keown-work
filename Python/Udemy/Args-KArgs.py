print (1,2,3,'hello', sep=":")

def add (*args:int)->int:
    print(args)

    return sum(args)

def pin_position(**kwargs:int)->None:
    print(kwargs)


pin_position(x=1,n=5)

def func(*args: str, **kwargs: int) -> None:
    print(args)
    print(kwargs)

func('a', 'b', a=1, b=2)


#Positional Argument

def func2(var_a: str, / ,var_b: str) -> None:
    print(var_a)  # Fixed variable name from var_ia to var_a

func2('a',var_b='b')

#Keyword argument


def func3(var_a: str, * ,var_b: str) -> None:
    print(var_a)  # Fixed variable name from var_ia to var_a

func3('a',var_b='b')