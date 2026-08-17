class Part:
    def __init__(self, name, mass):
        self.name = name
        self.mass = mass


class Spacecraft:
    def __init__(self, name):
        self.name = name
        self.parts = []      # each Spacecraft gets its own list

    def add_part(self, part):
        self.parts.append(part)

    def total_mass(self):
        return sum(part.mass for part in self.parts)

    def heaviest_part(self):
        if not self.parts:
            return None
        return max(self.parts, key=lambda p: p.mass)


sc = Spacecraft("Orion")
sc.add_part(Part("proptank", 1200.0))
sc.add_part(Part("engine", 450.0))
sc.add_part(Part("heat shield", 1600.0))

print(sc.total_mass())
print(sc.heaviest_part().name)
