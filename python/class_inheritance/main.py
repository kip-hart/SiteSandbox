class Part:
    def __init__(self, name, mass):
        self.name = name
        self.mass = mass

    def describe(self):
        print(f"{self.name}: {self.mass} kg")


class Engine(Part):
    def __init__(self, name, mass, thrust):
        super().__init__(name, mass)   # run the parent's __init__
        self.thrust = thrust

    def describe(self):               # override the parent's method
        print(f"{self.name}: {self.mass} kg, {self.thrust} N thrust")


bracket = Part("bracket", 5.0)
engine = Engine("RS-25", 3177.0, 1859000)

bracket.describe()
engine.describe()

print(isinstance(engine, Engine))
print(isinstance(engine, Part))   # an Engine is also a Part
