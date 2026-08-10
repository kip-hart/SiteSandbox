with open("flights.txt", "w") as f:
    f.write("name,altitude_km,duration_min\n")
    f.write("Mercury-Redstone 3,187,15\n")

with open("flights.txt", "a") as f:
    f.write("Apollo 11,377349,11520\n")

with open("flights.txt", "r") as f:
    print(f.read())
