class Part:
    def __init__(self, name, mass):
        self.name = name
        self.mass = mass

    def __repr__(self):
        return f"Part({self.name!r}, {self.mass})"

    def __eq__(self, other):
        return self.name == other.name and self.mass == other.mass

    def __lt__(self, other):
        return self.mass < other.mass


a = Part("proptank", 1200.0)
b = Part("proptank", 1200.0)
c = Part("engine", 450.0)

print(a == b)   # True, because __eq__ compares the contents
print(a == c)
print(c < a)    # uses __lt__

print(sorted([a, c, Part("fairing", 900.0)]))
