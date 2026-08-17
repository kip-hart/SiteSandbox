class SpacecraftPart:
    def __init__(self, name, mass):
        self.name = name
        self.mass = mass

    def describe(self):
        print(f"{self.name}: {self.mass} kg")

    def weight_on_earth(self):
        return self.mass * 9.81


tank = SpacecraftPart("proptank", 1200.0)

tank.describe()
print(f"{tank.weight_on_earth():.1f} N")
