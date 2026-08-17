from dataclasses import dataclass


@dataclass
class Part:
    name: str
    mass: float

    def __post_init__(self):
        if self.mass < 0:
            raise ValueError(f"mass must be non-negative, got {self.mass}")


print(Part("proptank", 1200.0))

try:
    Part("proptank", -50.0)
except ValueError as err:
    print(f"Rejected: {err}")
