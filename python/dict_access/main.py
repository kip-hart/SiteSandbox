part = {"name": "proptank", "subsystem": "propulsion", "mass": 1200.0}

print(part["name"])
print(part["mass"])

print("mass" in part)
print("cost" in part)

print(part.get("cost"))        # returns None instead of raising an error
print(part.get("cost", 0.0))   # or supply a default value
