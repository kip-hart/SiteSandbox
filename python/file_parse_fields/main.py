with open("flights.txt", "w") as f:
    f.write("name,altitude_km,duration_min\n")
    f.write("Mercury-Redstone 3,187,15\n")
    f.write("Vostok 1,327,108\n")

with open("flights.txt", "r") as f:
    header = f.readline().strip().split(",")
    print(header)
    for line in f:
        fields = line.strip().split(",")
        print(fields)
