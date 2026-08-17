flights = [
    {"name": "Mercury-Redstone 3", "altitude_km": 187.0, "duration_min": 15.0},
    {"name": "Vostok 1", "altitude_km": 327.0, "duration_min": 108.0},
    {"name": "Freedom 7", "altitude_km": 187.0, "duration_min": 15.0},
]

for flight in flights:
    print(f"{flight['name']}: {flight['altitude_km']} km")
