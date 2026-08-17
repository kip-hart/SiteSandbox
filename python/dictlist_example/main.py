parts = [
    {"name": "proptank", "subsystem": "propulsion", "mass": 1200.0},
    {"name": "engine", "subsystem": "propulsion", "mass": 450.0},
    {"name": "fairing", "subsystem": "structure", "mass": 900.0},
    {"name": "heat shield", "subsystem": "structure", "mass": 1600.0},
    {"name": "avionics bay", "subsystem": "avionics", "mass": 220.0},
]

mass_by_subsystem = {}
for part in parts:
    subsystem = part["subsystem"]
    mass_by_subsystem[subsystem] = mass_by_subsystem.get(subsystem, 0.0) + part["mass"]

print(mass_by_subsystem)

for subsystem, mass in sorted(mass_by_subsystem.items(), key=lambda pair: pair[1], reverse=True):
    print(f"{subsystem}: {mass} kg")
