class Rocket:
    def __init__(self, name, thrust, mass):
        self.name = name
        self.thrust = thrust   # N
        self.mass = mass       # kg

    def thrust_to_weight(self):
        return self.thrust / (self.mass * 9.81)

    def can_lift_off(self):
        return self.thrust_to_weight() > 1.0

    def report(self):
        verdict = "yes" if self.can_lift_off() else "no"
        print(f"{self.name}: TWR = {self.thrust_to_weight():.2f}, lifts off: {verdict}")


heavy = Rocket("Heavy Lifter", 7600000, 550000)
underpowered = Rocket("Test Article", 40000, 9000)

heavy.report()
underpowered.report()
