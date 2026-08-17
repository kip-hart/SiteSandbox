def orbit_description(category):
    descriptions = {
        "LEO": "Low Earth Orbit",
        "MEO": "Medium Earth Orbit",
        "GEO": "Geostationary Orbit",
        "HEO": "High Earth Orbit",
    }
    return descriptions.get(category, "Unknown category")


print(orbit_description("LEO"))
print(orbit_description("XYZ"))
