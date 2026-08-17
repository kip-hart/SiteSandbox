def find_part_mass(parts: dict[str, float], name: str) -> float | None:
    """Return the mass of a named part, or None if it isn't found."""
    return parts.get(name)


def scale(value: int | float, factor: float) -> float:
    return value * factor


part_masses = {"proptank": 1200.0, "engine": 450.0}

print(find_part_mass(part_masses, "engine"))
print(find_part_mass(part_masses, "nosecone"))
print(scale(10, 1.5))
