flights = [
    {"name": "Mercury-Redstone 3", "altitude_km": 187.0, "duration_min": 15.0},
    {"name": "Vostok 1", "altitude_km": 327.0, "duration_min": 108.0},
    {"name": "Freedom 7", "altitude_km": 187.0, "duration_min": 15.0},
]

by_duration = sorted(flights, key=lambda f: f["duration_min"], reverse=True)
for f in by_duration:
    print(f"{f['name']}: {f['duration_min']} min")
