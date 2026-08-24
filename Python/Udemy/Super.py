class Shape:
    def __init__(self, name: str, sides: int) -> None:
        self.name = name
        self.sides = sides

    def describe(self) -> None:
        print(f'{self.name} ({self.sides} sides)')  # Added missing parenthesis

    def shape_method(self) -> None:
        print(f'{self.name}: shape_method()')
class Square(Shape):
    def __init__(self, size: float) -> None:
        super().__init__('Square', 4)
        self.size = size

    def describe(self) -> None:
        print(f'I am a {self.name} with size of {self.size} units')

class Rectangle(Shape):
    def __init__(self, length: float, height: float) -> None:
        super().__init__('Rectangle', 4)
        self.length = length
        self.height = height

    def describe(self) -> None:
        print(f'{self.name} (height: {self.height}, length: {self.length})')

def main() -> None:
    square = Square(5.0)
    square.describe()
    square.shape_method()
    rect = Rectangle(5.0, 3.0)
    rect.describe()
    rect.shape_method()

if __name__ == '__main__':
    main()