numbers: list[int] = [1, 2, 3]

doubled: list[int] = []

for number in numbers:
    doubled.append(number * 2)

doubled_lc: list[int] = [number * 2 for number in numbers]
print(doubled_lc)

names: list[str] = ['Mario', 'James', 'Luigi', 'John']
j_names: list[str] = []

for name in names:
    if name.startswith('J'):
        j_names.append(name)

j_names: list[str] = [name for name in names if name.startswith('J')]