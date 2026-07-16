altitude = 420  # km, starting altitude
decay_per_week = 2  # km lost to atmospheric drag each week
reboost_threshold = 400  # km, minimum safe altitude

weeks = 0
while altitude > reboost_threshold:
    altitude = altitude - decay_per_week
    weeks = weeks + 1

print("Weeks until reboost is needed:")
print(weeks)
print("Altitude at that point (km):")
print(altitude)
