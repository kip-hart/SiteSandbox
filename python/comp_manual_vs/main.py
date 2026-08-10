# The "manual" way, using a for loop
squares = []
for i in range(10):
    squares.append(i ** 2)
print(squares)

# The same thing with a list comprehension
squares = [i ** 2 for i in range(10)]
print(squares)
