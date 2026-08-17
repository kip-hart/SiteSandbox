class PartPlain:
    def __init__(self, name, subsystem, mass):
        self.name = name
        self.subsystem = subsystem
        self.mass = mass

    def __repr__(self):
        return f"PartPlain(name={self.name!r}, subsystem={self.subsystem!r}, mass={self.mass})"

    def __eq__(self, other):
        return (self.name, self.subsystem, self.mass) == (other.name, other.subsystem, other.mass)


p1 = PartPlain("proptank", "propulsion", 1200.0)
print(p1)
print(p1 == PartPlain("proptank", "propulsion", 1200.0))
