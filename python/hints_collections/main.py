altitude: float = 400.0
name: str = "ISS"
is_active: bool = True

altitudes: list[float] = [400.0, 550.0, 800.0]
part_masses: dict[str, float] = {"proptank": 1200.0, "engine": 450.0}
coordinates: tuple[float, float] = (28.5721, -80.6480)

print(altitudes)
print(part_masses)
print(coordinates)
