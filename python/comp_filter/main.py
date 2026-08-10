evens = [i for i in range(20) if i % 2 == 0]
print(evens)

# Same thing the "manual" way, for comparison:
evens_manual = []
for i in range(20):
    if i % 2 == 0:
        evens_manual.append(i)
print(evens_manual == evens)
