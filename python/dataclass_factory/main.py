from dataclasses import dataclass, field


@dataclass
class Spacecraft:
    name: str
    parts: list[str] = field(default_factory=list)


sc1 = Spacecraft("Dragon")
sc2 = Spacecraft("Starliner")

sc1.parts.append("proptank")

print(sc1.parts)
print(sc2.parts)   # still empty, each object got its own list
