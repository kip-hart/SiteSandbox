squares = {n: n ** 2 for n in range(6)}
print(squares)

parts_by_mass = {"booster": 25000, "second stage": 4500, "fairing": 1900}
heavy_parts = {name: mass for name, mass in parts_by_mass.items() if mass > 2000}
print(heavy_parts)
