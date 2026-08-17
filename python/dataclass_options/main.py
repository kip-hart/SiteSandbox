from dataclasses import dataclass


@dataclass(order=True)
class Reading:
    altitude: float
    status: str = "nominal"


readings = [Reading(800.0), Reading(400.0), Reading(1200.0)]
print(sorted(readings))


@dataclass(frozen=True)
class Coordinate:
    latitude: float
    longitude: float


site = Coordinate(28.5721, -80.6480)
print(site)

try:
    site.latitude = 0.0
except Exception as err:
    print(f"Rejected: {type(err).__name__}")
