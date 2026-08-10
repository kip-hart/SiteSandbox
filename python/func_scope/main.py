x = 10   # this is a variable in the outer scope

def modify_x():
    x = 99   # this creates a NEW local variable, it does NOT touch the
             # outer x
    print(f"inside function, x = {x}")

modify_x()
print(f"outside function, x = {x}")   # still 10!
