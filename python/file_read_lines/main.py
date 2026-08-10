with open("flights.txt", "w") as f:
    f.write("name,altitude_km,duration_min\n")
    f.write("Mercury-Redstone 3,187,15\n")
    f.write("Vostok 1,327,108\n")

with open("flights.txt", "r") as f:
    for line in f:
        print(repr(line))    # repr() shows the trailing '\n'
