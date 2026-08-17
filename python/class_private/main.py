class SpacecraftPart:
    def __init__(self, name, mass):
        self.name = name
        self.__mass = mass   # leading double underscore: "private" by convention

    def get_mass(self):
        return self.__mass

    def set_mass(self, new_mass):
        if new_mass < 0:
            print("Error: mass cannot be negative.")
            return
        self.__mass = new_mass


part = SpacecraftPart("proptank", 1200.0)
print(part.get_mass())

part.set_mass(1000.0)
print(part.get_mass())

part.set_mass(-50)          # rejected by the setter
print(part.get_mass())
