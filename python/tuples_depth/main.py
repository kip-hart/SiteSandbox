import math


def orbit_stats(mu, r):
    v = math.sqrt(mu / r)
    T = 2 * math.pi * r / v
    return v, T


velocity, period = orbit_stats(398600, 6778)
print(f"v = {velocity:.4f} km/s, T = {period:.1f} s")

result = orbit_stats(398600, 6778)
print(type(result), result)
