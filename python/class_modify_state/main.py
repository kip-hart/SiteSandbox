class SpacecraftPart:
    def __init__(self, name, mass):
        self.name = name
        self.mass = mass

    def burn_fuel(self, amount):
        if amount > self.mass:
            print("Error: cannot burn more than the part's mass.")
            return
        self.mass -= amount


tank = SpacecraftPart("proptank", 1200.0)
print(tank.mass)

tank.burn_fuel(300)
print(tank.mass)

tank.burn_fuel(5000)   # rejected, mass unchanged
print(tank.mass)
