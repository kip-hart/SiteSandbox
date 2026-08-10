names = ["booster", "second stage", "fairing"]
masses = [25000, 4500, 1900]

descriptions = [f"{name}: {mass} kg" for name, mass in zip(names, masses)]
print(descriptions)
