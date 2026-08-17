component_masses = {
    "empty aircraft": 45000,
    "fuel": 18000,
    "passengers": 9500,
    "cargo": 4200,
}

total_mass = sum(component_masses.values())
print(f"Total mass: {total_mass} lb")

fractions = {name: mass / total_mass for name, mass in component_masses.items()}
for name, fraction in fractions.items():
    print(f"{name}: {fraction:.3f}")

heaviest = max(component_masses, key=component_masses.get)
print(f"Heaviest component: {heaviest}")
