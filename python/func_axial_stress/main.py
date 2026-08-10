def axial_stress(force, area):
    """Return axial stress (Pa) given a force (N) and cross-sectional area (m^2)."""
    return force / area

sigma = axial_stress(5000, 0.002)
print(f"{sigma / 1e6:.2f} MPa")
