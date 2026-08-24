name = "Bob"
greeting = "Hello"

print(greeting)

name = "Bob"
greeting = f"Hello {name}"

print(greeting)

greeting = "Hello, {}"
x = greeting.format(name)

print(greeting)