from dataclasses import dataclass, field


@dataclass
class Part:
    name: str
    mass: float


@dataclass
class Spacecraft:
    name: str
    parts: list[Part] = field(default_factory=list)

    def add_part(self, part: Part) -> None:
        self.parts.append(part)

    def total_mass(self) -> float:
        return sum(part.mass for part in self.parts)


sc = Spacecraft("Orion")
sc.add_part(Part("proptank", 1200.0))
sc.add_part(Part("heat shield", 1600.0))

print(sc.total_mass())
print(sc)
