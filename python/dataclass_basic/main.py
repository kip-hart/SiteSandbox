from dataclasses import dataclass


@dataclass
class Part:
    name: str
    subsystem: str
    mass: float


p = Part("proptank", "propulsion", 1200.0)

print(p)                                              # __repr__ came for free
print(p == Part("proptank", "propulsion", 1200.0))    # so did __eq__
print(p.mass)
