try:
    with open("does_not_exist.txt", "r") as f:
        f.read()
except FileNotFoundError:
    print("That file doesn't exist - check the filename and path.")
