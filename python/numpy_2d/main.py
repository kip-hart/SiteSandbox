import numpy as np

M = np.array([[1, 2], [3, 4]])

print(M)
print(M.shape)
print(M.T)                                 # transpose
print(M @ M)                               # matrix multiplication (NOT M * M!)
print(M * M)                               # element-wise multiplication, different from @
print(np.linalg.det(M))
print(np.linalg.norm(np.array([3, 4])))    # vector magnitude
