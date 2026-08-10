prices = [10, 20, 30]
print(prices * 2)   # this DUPLICATES the list, it doesn't scale it!

import numpy as np

prices_arr = np.array(prices)
print(prices_arr * 2)   # this is what you actually wanted
