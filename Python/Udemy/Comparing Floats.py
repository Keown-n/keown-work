from math import isclose

a: float = 0.999
b: float = 1.000

print(f'{a} == {b}:', isclose(a, b, abs_tol=0.002))

a: float = 99.5
b: float = 100

print(f'{a} == {b}:', isclose(a, b, rel_tol=.01))