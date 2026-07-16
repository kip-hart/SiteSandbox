yield_strength = 300  # MPa
density = 7800  # kg/m^3

if yield_strength > 250 and density < 8000:
    print("Material is acceptable.")
elif yield_strength <= 250:
    print("Yield strength is too low.")
else:
    print("Density is too high.")
