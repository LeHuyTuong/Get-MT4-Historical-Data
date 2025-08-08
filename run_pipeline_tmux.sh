#!/bin/bash

tmux new-session -d -s mt4_pipeline '

echo "📥 Start to download data Dukascopy"
bash download_m5_all.sh

echo "🔁 Format all data csv to MT4 "
python3 convert_all_to_mt4.py

echo "📊 Check year distribution"
python3 check_year_distribution.py

echo "✅ Done , go again tmux attach -t mt4_pipeline"
exec bash
'
echo "🟢 Pipeline is running in tmux session: mt4_pipeline"

