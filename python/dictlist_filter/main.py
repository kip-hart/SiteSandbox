flights = [
    {"name": "Mercury-Redstone 3", "altitude_km": 187.0, "duration_min": 15.0},
    {"name": "Vostok 1", "altitude_km": 327.0, "duration_min": 108.0},
    {"name": "Freedom 7", "altitude_km": 187.0, "duration_min": 15.0},
]

high_flights = [f for f in flights if f["altitude_km"] > 200]
print(high_flights)

for f in high_flights:
    print(f["name"])
