import math


def delta_v(exhaust_velocity: float, mass_ratio: float) -> float:
    return exhaust_velocity * math.log(mass_ratio)


try:
    print(delta_v("3000", "5"))
except TypeError as err:
    print(f"Ran anyway, then crashed: {err}")
