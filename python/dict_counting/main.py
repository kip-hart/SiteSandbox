readings = ["nominal", "nominal", "warning", "nominal", "critical", "warning"]

counts = {}
for r in readings:
    counts[r] = counts.get(r, 0) + 1

print(counts)
