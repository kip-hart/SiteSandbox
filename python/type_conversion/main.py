fuel_lb_text = "500"  # imagine this string came from input()
fuel_lb = float(fuel_lb_text)
fuel_kg = fuel_lb * 0.4536

print(type(fuel_lb_text))
print(type(fuel_lb))
print(f"{fuel_kg:.1f} kg")
