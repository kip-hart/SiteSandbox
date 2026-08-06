fuel_readings_lb = [3000, 2550, 2120, 1710, 1315]

burns = []
for i in range(len(fuel_readings_lb) - 1):
    burns.append(fuel_readings_lb[i] - fuel_readings_lb[i + 1])

print(burns)

peak_burn = max(burns)
peak_hour = burns.index(peak_burn) + 1
print(f"Peak burn: {peak_burn} lb during hour {peak_hour}")
