class PlainPart:
    def __init__(self, name, mass):
        self.name = name
        self.mass = mass


class LabeledPart:
    def __init__(self, name, mass):
        self.name = name
        self.mass = mass

    def __repr__(self):
        return f"LabeledPart(name={self.name!r}, mass={self.mass})"


print(PlainPart("proptank", 1200.0))   # the default, without __repr__

labeled = LabeledPart("proptank", 1200.0)
print(labeled)
print([labeled, labeled])   # __repr__ is used inside lists too
