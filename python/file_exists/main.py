import os

with open("flights.txt", "w") as f:
    f.write("name,altitude_km,duration_min\n")

print(os.path.exists("flights.txt"))
print(os.path.exists("does_not_exist.txt"))
