counts = {"nominal": 3, "warning": 2, "critical": 1}

print(sorted(counts))                # sorts the keys alphabetically

by_count = sorted(counts.items(), key=lambda pair: pair[1], reverse=True)
print(by_count)

for status, n in by_count:
    print(f"{status}: {n}")
