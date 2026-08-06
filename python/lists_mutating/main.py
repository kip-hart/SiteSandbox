altitudes = [450, 800, 1200]

altitudes[0] = 400
print(altitudes)

altitudes.append(1500)          # add to the end
print(altitudes)

altitudes.insert(0, 300)        # insert at a specific index
print(altitudes)

removed = altitudes.pop()       # remove and return the last element
print(removed, altitudes)

altitudes.remove(400)           # remove the first matching value
print(altitudes)
