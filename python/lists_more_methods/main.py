altitudes = [300, 450, 800, 1200, 800]

altitudes.extend([2000, 2500])   # append multiple values at once
print(altitudes)

print(altitudes.count(800))      # how many times a value appears
print(altitudes.index(1200))     # index of the first match

altitudes.reverse()               # reverses IN PLACE
print(altitudes)
