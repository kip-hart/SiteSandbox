import numpy as np

first_batch = np.array([7.2, 7.5])
second_batch = np.array([7.6, 7.7, 7.4])

all_readings = np.concatenate([first_batch, second_batch])
print(all_readings)
