class Calculator:
    def __init__(self, version: int) -> None:
        self.version = version

    @staticmethod
    def add(*numbers: float) -> float:
        return sum(numbers)

    def get_version(self) -> int:
        return self.version


# Example usage
def main() -> None:

    calc = Calculator(2)
    print(f"Version: {calc.get_version()}")
    print(f"Instance add: {calc.add(4.2, 5.7)}")


if __name__ == '__main__':
    main()

###################################################################

class Car:
    SPEED_LIMIT: int = 200  # Class-level speed limit

    def __init__(self, brand: str, max_speed: int) -> None:
        self.brand = brand
        self.max_speed = max_speed

    @classmethod
    def change_speed_limit(cls, new_limit: int) -> None:
        cls.SPEED_LIMIT = new_limit

    def display_info(self) -> None:
        print(f'{self.brand} (Max Speed={self.max_speed}km/h, Speed Limit={self.SPEED_LIMIT}km/h)')


def main() -> None:
    car = Car("Toyota", 220)
    car2 = Car("bmw", 210)

    car.display_info()
    car2.display_info()

    Car.change_speed_limit(150)

    car.display_info()
    car2.display_info()


if __name__ == '__main__':
    main()