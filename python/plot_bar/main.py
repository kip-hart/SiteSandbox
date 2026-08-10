import matplotlib.pyplot as plt

parts = ["booster", "second stage", "fairing"]
part_masses = [25000, 4500, 1900]

plt.figure()
plt.bar(parts, part_masses)
plt.ylabel("Mass (kg)")
plt.title("Part Masses")
plt.show()
