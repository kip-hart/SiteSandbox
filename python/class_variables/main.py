class SpacecraftPart:
    part_count = 0   # a CLASS variable: one copy, shared by every instance

    def __init__(self, name, mass):
        self.name = name    # instance variables: one copy per object
        self.mass = mass
        SpacecraftPart.part_count += 1


p1 = SpacecraftPart("proptank", 1200.0)
p2 = SpacecraftPart("engine", 450.0)
p3 = SpacecraftPart("fairing", 900.0)

print(SpacecraftPart.part_count)   # read from the class
print(p1.part_count)               # readable from an instance too
print(p1.mass, p2.mass)            # instance variables stayed separate
