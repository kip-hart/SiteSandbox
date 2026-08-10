import numpy as np
import matplotlib.pyplot as plt

np.random.seed(0)
sample_readings = np.random.normal(loc=9.81, scale=0.03, size=200)

plt.figure()
plt.hist(sample_readings, bins=20)
plt.xlabel("Gravity reading (m/s^2)")
plt.ylabel("Count")
plt.title("Distribution of Simulated Gravity Readings")
plt.show()
