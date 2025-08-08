import os
from collections import Counter

path = "mt4_ready"
for file in os.listdir(path):
    if not file.endswith(".csv"): continue

    year_count = Counter()
    with open(os.path.join(path, file), 'r') as f:
        for line in f:
            try:
                year = line.split(',')[0][:4]
                year_count[year] += 1
            except:
                continue

    print(f"\n📊 {file}:")
    for y in sorted(year_count):
        print(f"  {y}: {year_count[y]} lines")

