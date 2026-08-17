import csv

with open("flights.txt", "w") as f:
    f.write("name,altitude_km,duration_min\n")
    f.write("Mercury-Redstone 3,187,15\n")
    f.write("Vostok 1,327,108\n")

flights = []
with open("flights.txt", "r") as f:
    for row in csv.DictReader(f):
        row["altitude_km"] = float(row["altitude_km"])
        row["duration_min"] = float(row["duration_min"])
        flights.append(row)

print(flights)
print(flights[0]["altitude_km"] + flights[1]["altitude_km"])
