import csv

with open("flights.txt", "w") as f:
    f.write("name,altitude_km,duration_min\n")
    f.write("Mercury-Redstone 3,187,15\n")
    f.write("Vostok 1,327,108\n")

with open("flights.txt", "r") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row)
