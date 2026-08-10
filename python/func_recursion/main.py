import math


def factorial(n):
    if n <= 1:
        return 1              # base case: stop recursing
    return n * factorial(n - 1)   # recursive case: smaller subproblem


print(factorial(5))        # 5 * 4 * 3 * 2 * 1
print(math.factorial(5))   # the standard library already has this
