altitudes = [400, 20000, 35786, 100000]

labels = ["high" if h > 10000 else "low" for h in altitudes]
print(labels)
