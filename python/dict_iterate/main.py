part = {"name": "proptank", "subsystem": "propulsion", "mass": 1200.0}

for key in part:
    print(key)

for value in part.values():
    print(value)

for key, value in part.items():
    print(f"{key}: {value}")
