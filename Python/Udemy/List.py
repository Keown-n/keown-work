myList =['bob','james','susy']

print(myList[0])
print(myList[1])
print(myList[2])

print(myList)

myList.append('kevin')
print(myList)
myList.remove('bob')
print(myList)
myList.pop()
print(myList)

myList[0] ='tom'
print(myList)

myList.insert(1,'tris')
print(myList)

myList.clear()

#tuple

eg = 1 , True , 'text'

mytuple = ()

print(type(mytuple))

#sets

elements = {99,True,'Bob'}
print(elements)

elements.add('john')
print(elements)

elements.remove('Bob')
print(elements)

elements.pop()

print(elements)

fSet = frozenset({1,1,1,2,2,3,3})
print(fSet)

#Dictionary

user = {1:'bob' , 2:'kev'}
print(user[1])

user[3]= "James"

weather = {"time": "12:00",
           "weather": "rain"}

print(weather["time"])