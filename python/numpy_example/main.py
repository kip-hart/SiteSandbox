import numpy as np

readings = np.array([9.79, 9.81, 9.80, 15.02, 9.78, 9.82, -1.00])

valid = readings[(readings > 9.0) & (readings < 10.5)]
print(valid)
print(np.mean(valid))
