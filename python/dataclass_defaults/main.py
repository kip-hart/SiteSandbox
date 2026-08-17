from dataclasses import dataclass


@dataclass
class Part:
    name: str
    subsystem: str
    mass: float
    is_reusable: bool = False


print(Part("fairing", "structure", 900.0))
print(Part("booster", "propulsion", 25000.0, is_reusable=True))
