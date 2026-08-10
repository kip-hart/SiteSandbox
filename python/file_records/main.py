def read_flights(filename):
    """Read a CSV file into a list of rows, one list per flight."""
    flights = []
    with open(filename, "r") as f:
        header = f.readline().strip().split(",")
        for line in f:
            fields = line.strip().split(",")
            fields[1] = float(fields[1])
            fields[2] = float(fields[2])
            flights.append(fields)
    return header, flights


with open("flights.txt", "w") as f:
    f.write("name,altitude_km,duration_min\n")
    f.write("Mercury-Redstone 3,187,15\n")
    f.write("Vostok 1,327,108\n")
    f.write("Freedom 7,187,15\n")

header, flights = read_flights("flights.txt")
print(header)
print(flights)
print(flights[0][0])
print(flights[0][1])
