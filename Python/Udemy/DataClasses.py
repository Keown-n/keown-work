from dataclasses import dataclass, field,InitVar

@dataclass
class Coin:
    name: str
    value: float
    id: str

def main() -> None:
    bitcoin: Coin = Coin('Bitcoin', 10_000, 'BTC')
    bitcoin2: Coin = Coin('Bitcoin', 10_000, 'BTC')
    ripple: Coin = Coin('Ripple', 200, 'XRP')

  ######################################


@dataclass
class Fruit:
    name: str
    grams: float
    price_per_kg: float
    edible: bool = True
    related_fruits: list[str] = field(default_factory=list)

def main() -> None:
    apple: Fruit = Fruit('Apple', 100, 5)
    pear: Fruit = Fruit('Pear', 250, 10, related_fruits=['Apple', 'Orange'])
    print(apple)
    print(pear)
    print(pear)

########################################################

@dataclass
class Fruit:
    name: str
    grams: float
    price_per_kg: float
   # is_rare: InitVar[bool|None]= None
   # total_price: float = field(init=False)

    @property
    def total_price(self) -> float:
        return (self.grams / 1000) * self.price_per_kg

    #def __post_init__(self,is_rare: bool|None) -> None:

     #   if is_rare:
      #      self.price_per_kg*=2

       # self.total_price = (self.grams / 1000) * self.price_per_kg

    def describe(self) -> None:
        print(f'{self.grams}g of {self.name} costs ${self.total_price:.2f}')

if __name__ == '__main__':
    main()