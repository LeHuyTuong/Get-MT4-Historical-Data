#!/bin/bash

tmux new-session -d -s mt4_pipeline '

echo "📥 Bắt đầu tải data Dukascopy..."
bash download_m5_all.sh

echo "🔁 Convert toàn bộ sang MT4..."
python3 convert_all_to_mt4.py

echo "📊 Kiểm tra phân bố dữ liệu theo năm..."
python3 check_year_distribution.py

echo "✅ Hoàn tất pipeline trong tmux. Vào lại bằng: tmux attach -t mt4_pipeline"
exec bash
'
echo "🟢 Pipeline đang chạy trong tmux session: mt4_pipeline"

