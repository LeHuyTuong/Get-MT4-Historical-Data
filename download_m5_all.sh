#!/bin/bash

mkdir -p download

while read symbol; do
  echo "⬇️ Đang tải: $symbol M5 với flats..."

  npx dukascopy-node@1.43.0 download \
    --instrument "$symbol" \
    --date-from 2015-01-01 \
    --date-to 2025-08-08 \
    --timeframe m5 \
    --format csv \
    --flats true \
    "./download/${symbol}_m5/"

  echo "✅ Xong: $symbol"
  echo "---------------------------"
done < symbols.txt

