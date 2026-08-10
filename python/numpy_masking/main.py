import numpy as np

h = np.array([200, 400, 800, 1500, 20000, 35786, 100000])

print(h[0])
print(h[-1])
print(h[1:4])

mask = h < 2000
print(mask)      # an array of True/False
print(h[mask])    # only the elements where mask is True

# You'll usually write this as one line:
print(h[h < 2000])
print(h[(h >= 2000) & (h < 35786)])   # use & (not 'and') for arrays!
