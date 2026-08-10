def classify_signal(rssi_dbm):
    return "Strong" if rssi_dbm > -70 else "Weak"

readings = [-52, -68, -74, -90, -61]
strengths = [classify_signal(r) for r in readings]
print(strengths)
