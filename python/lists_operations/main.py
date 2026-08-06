altitudes = [1200, 300, 800, 450]

print(len(altitudes))
print(sum(altitudes))
print(max(altitudes))
print(min(altitudes))
print(sorted(altitudes))    # returns a NEW sorted list
altitudes.sort()            # sorts the list IN PLACE
print(altitudes)

print(800 in altitudes)
print(9999 in altitudes)
