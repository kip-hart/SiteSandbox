rows = [
    "name,altitude_km,duration_min\n",
    "Mercury-Redstone 3,187,15\n",
    "Vostok 1,327,108\n",
]
with open("flights.txt", "w") as f:
    f.writelines(rows)   # note: writelines does NOT add '\n' for you

with open("flights.txt", "r") as f:
    print(f.read())
