class Part:
    def __init__(self, name, subsystem, mass):
        self.name = name
        self.subsystem = subsystem
        self.mass = mass

    def __repr__(self):
        return f"{self.name} ({self.mass} kg)"

    def __lt__(self, other):
        return self.mass < other.mass


class Spacecraft:
    def __init__(self, name):
        self.name = name
        self.parts = []

    def add_part(self, part):
        self.parts.append(part)

    def total_mass(self):
        return sum(part.mass for part in self.parts)

    def mass_by_subsystem(self):
        totals = {}
        for part in self.parts:
            totals[part.subsystem] = totals.get(part.subsystem, 0.0) + part.mass
        return totals

    def parts_heaviest_first(self):
        return sorted(self.parts, reverse=True)


sc = Spacecraft("Orion")
sc.add_part(Part("proptank", "propulsion", 1200.0))
sc.add_part(Part("engine", "propulsion", 450.0))
sc.add_part(Part("heat shield", "structure", 1600.0))
sc.add_part(Part("avionics bay", "avionics", 220.0))

print(f"Total mass: {sc.total_mass()} kg")
print(sc.mass_by_subsystem())
print(sc.parts_heaviest_first())
