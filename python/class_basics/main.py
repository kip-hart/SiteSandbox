class SpacecraftPart:
    def __init__(self, name, mass):
        self.name = name
        self.mass = mass


tank = SpacecraftPart("proptank", 1200.0)
engine = SpacecraftPart("engine", 450.0)

print(tank.name, tank.mass)
print(engine.name, engine.mass)
print(type(tank))
