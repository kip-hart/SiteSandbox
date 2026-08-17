part = {"name": "proptank", "mass": 1200.0}

part["mass"] = 1150.0         # update an existing key
part["is_reusable"] = True    # add a new key
print(part)

del part["is_reusable"]
print(part)

removed = part.pop("mass")    # remove a key and return its value
print(removed, part)
