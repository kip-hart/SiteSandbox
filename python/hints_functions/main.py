import math


def delta_v(exhaust_velocity: float, mass_ratio: float) -> float:
    """Tsiolkovsky rocket equation."""
    return exhaust_velocity * math.log(mass_ratio)


print(delta_v(3000.0, 5.0))
