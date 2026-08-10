with open("flights.txt", "w") as f:
    f.write("name,altitude_km,duration_min\n")
    f.write("Mercury-Redstone 3,187,15\n")
    f.write("Vostok 1,327,108\n")
    f.write("Freedom 7,187,15\n")

print("Wrote flights.txt")
