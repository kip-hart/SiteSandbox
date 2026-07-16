import math

# Givens
delta_v = 12000  # m/s
g0 = 9.81  # m/s^2

Isp_values = [380, 450]

zeta_min = None
zeta_max = None
for Isp in Isp_values:
    m0_over_mf = math.exp(delta_v / (Isp * g0))
    zeta = 1 - 1 / m0_over_mf
    if zeta_min is None or zeta < zeta_min:
        zeta_min = zeta
    if zeta_max is None or zeta > zeta_max:
        zeta_max = zeta

print("Propellant mass fraction range:")
print(f"{zeta_min:.4f} to {zeta_max:.4f}")
