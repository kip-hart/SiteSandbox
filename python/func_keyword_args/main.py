def describe_stage(name, mass_kg, reusable=False):
    print(f"{name}: {mass_kg} kg, reusable={reusable}")

describe_stage("Booster", 25000)                              # positional
describe_stage("Booster", 25000, True)                        # positional
describe_stage(name="Booster", mass_kg=25000, reusable=True)  # keyword
describe_stage("Booster", reusable=True, mass_kg=25000)       # mixed
