flights = [
    {"name": "Mercury-Redstone 3", "altitude_km": 187.0, "duration_min": 15.0},
    {"name": "Vostok 1", "altitude_km": 327.0, "duration_min": 108.0},
    {"name": "Freedom 7", "altitude_km": 187.0, "duration_min": 15.0},
]

total_duration = sum(f["duration_min"] for f in flights)
print(f"Total duration: {total_duration} min")

mean_altitude = sum(f["altitude_km"] for f in flights) / len(flights)
print(f"Mean altitude: {mean_altitude:.1f} km")

highest = max(flights, key=lambda f: f["altitude_km"])
print(f"Highest: {highest['name']}")
