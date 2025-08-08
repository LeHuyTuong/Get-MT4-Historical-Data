import os
import csv
from datetime import datetime

input_dir = "download"
output_dir = "mt4_ready"
os.makedirs(output_dir, exist_ok=True)

for folder in os.listdir(input_dir):
    for file in os.listdir(os.path.join(input_dir, folder)):
        if not file.endswith(".csv"):
            continue

        in_path = os.path.join(input_dir, folder, file)
        out_path = os.path.join(output_dir, file.replace(".csv", "_MT4.csv"))

        with open(in_path, 'r') as f_in, open(out_path, 'w', newline='') as f_out:
            reader = csv.DictReader(f_in)
            writer = csv.writer(f_out)

            for row in reader:
                try:
                    ts = int(row['timestamp']) // 1000
                    dt = datetime.utcfromtimestamp(ts).strftime("%Y.%m.%d %H:%M")
                    open_, high, low, close = row['open'], row['high'], row['low'], row['close']
                    writer.writerow([dt, open_, high, low, close, 1])
                except:
                    continue

        print(f"✅ Converted: {file} ➜ {out_path}")

