number = 999

def change_num() -> None:
    number =10
    print(number)

change_num()
print(number)

#Global Variables
var = 10

def change_var() -> None:

    global var
    var =12