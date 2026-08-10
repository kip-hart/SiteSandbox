def apply_twice(func, value):
    """Call func on value, then call it again on the result."""
    return func(func(value))


def add_ten(x):
    return x + 10


def square(x):
    return x ** 2


print(apply_twice(add_ten, 5))     # add_ten(add_ten(5)) = 25
print(apply_twice(square, 3))      # square(square(3)) = 81
