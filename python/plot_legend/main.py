import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(0, 10, 50)
measured = 50 * np.sin(0.5 * t) + 100
predicted = 50 * np.sin(0.5 * t + 0.1) + 100

plt.figure()
plt.plot(t, measured, "b-", label="Measured")
plt.plot(t, predicted, "r--", label="Predicted")
plt.xlabel("Time (s)")
plt.ylabel("Altitude (m)")
plt.title("Measured vs. Predicted Altitude")
plt.legend()
plt.grid(True)
plt.show()
