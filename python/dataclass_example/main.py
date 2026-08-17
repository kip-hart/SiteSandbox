from dataclasses import dataclass


@dataclass
class Reading:
    timestamp: float
    altitude: float
    status: str = "nominal"

    def __post_init__(self):
        if self.altitude < 0:
            raise ValueError(f"altitude must be non-negative, got {self.altitude}")

    def is_nominal(self) -> bool:
        return self.status == "nominal"


readings: list[Reading] = [
    Reading(0.0, 400.0),
    Reading(1.0, 405.0, "warning"),
    Reading(2.0, 410.0),
    Reading(3.0, 300.0, "critical"),
]

problems = [r for r in readings if not r.is_nominal()]
for r in problems:
    print(r)

mean_altitude = sum(r.altitude for r in readings) / len(readings)
print(f"Mean altitude: {mean_altitude:.1f} m")

try:
    Reading(4.0, -10.0)
except ValueError as err:
    print(f"Rejected: {err}")
