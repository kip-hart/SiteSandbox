class SpacecraftPart:
    def __init__(self, name, mass):
        self.name = name
        self.mass = mass

    def burn_fuel(self, amount):
        self.mass -= amount


tank1 = SpacecraftPart("proptank", 1200.0)
tank2 = SpacecraftPart("proptank", 800.0)

tank1.burn_fuel(100)

print(tank1.mass)
print(tank2.mass)   # unaffected by the change to tank1
