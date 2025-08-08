# 📊 Get Historical Forex Data for MT4 (Dukascopy → MT4 CSV)
![Stars](https://img.shields.io/github/stars/LeHuyTuong/Get-MT4-Historical-Data.svg?style=social)
![Forks](https://img.shields.io/github/forks/LeHuyTuong/Get-MT4-Historical-Data.svg?style=social)
![License](https://img.shields.io/github/license/LeHuyTuong/Get-MT4-Historical-Data)
![Views](https://views.whatilearened.today/views/github/LeHuyTuong/Get-MT4-Historical-Data.svg)

A fully automated tool to download historical M1/M5 forex data from **Dukascopy**, convert to **MT4-compatible format**, and verify time continuity.

> Supports disconnect-safe execution via `tmux`. Perfect for traders, quant devs, and backtesters.

---
Demo
<img width="757" height="648" alt="image" src="https://github.com/user-attachments/assets/b06cdcea-8252-47cc-8d36-0f83c8744031" />

## 🚀 Features

- ✅ Download multi-year forex data (2015–2025) for **any symbol** on Dukascopy
- ✅ Convert to **MT4-ready CSV**: `YYYY.MM.DD HH:MM,open,high,low,close,volume`
- ✅ Handles **flats/candle gaps** properly (`--flats true`)
- ✅ Automatically verifies time continuity (no missing bars)
- ✅ Supports `tmux` for auto background execution on VPS

---

## 📁 Folder Structure

```
mt4_data_pipeline/
├── symbols.txt                # 💡 List of currency pairs to download
├── download_m5_all.sh         # 🔽 Download raw CSVs from Dukascopy
├── convert_all_to_mt4.py      # 🔁 Convert to MT4 format
├── check_year_distribution.py # ✅ Validate full-year data coverage
├── run_pipeline_tmux.sh       # 🧵 Run entire flow in tmux session
├── download/                  # 📦 Raw Dukascopy files
└── mt4_ready/                 # 🟢 MT4-ready CSVs
```

---

## ⚙️ Requirements

- Linux / WSL / MacOS / VPS
- `nodejs`, `npm`, `tmux`, `python3`

### ✅ Install dependencies:

```bash
sudo apt update
sudo apt install nodejs npm python3 tmux -y
```

---

## 🔧 1. Edit Your Target Symbols

Edit `symbols.txt` to specify the currency pairs you want to download.

> **Format: One pair per line, all uppercase**, example:

```txt
EURUSD
GBPCHF
USDJPY
EURNZD
```

Only use pairs supported by Dukascopy. You can list up to 100+ pairs if needed.

---

## ▶️ 2. Run the full pipeline

```bash
./run_pipeline_tmux.sh
```

> This script will:
> - Start `tmux` session (`mt4_pipeline`)
> - Download all symbols in `M5`
> - Convert to MT4 format
> - Check for year completeness
> - Save results in `mt4_ready/`

---

## 📈 3. Output Example

Each MT4-ready file looks like:

```
2015.01.01 00:00,1.20281,1.20281,1.20281,1.20281,1
2015.01.01 00:01,1.20282,1.20286,1.20280,1.20283,1
...
```

File saved to:

```
mt4_ready/EURUSD_M5_MT4.csv
```

---

## 📥 4. Import into MT4

1. Open MT4 → `Tools` → `History Center` (F2)
2. Select Symbol (e.g. `EURUSD`, timeframe `M5`)
3. Click `Import`, select the MT4-ready CSV
4. Restart MT4 & load chart

> Or manually place the `.csv` inside:
> - **Linux/Wine**: `~/.wine/drive_c/Program Files/.../history/YourBroker/`
> - **Windows**: `C:\Users\...\AppData\Roaming\MetaQuotes\...`

---

## 🧪 5. Check Year Completeness (Optional)

```bash
python3 check_year_distribution.py
```

Sample output:

```
EURUSD_M5_MT4.csv:
  2015: 75,000 rows
  2016: 75,120 rows
  ...
  2024: 74,960 rows ✅
```

---

## 🧵 Detach & Reconnect to `tmux`

- ⏩ Detach: `Ctrl + B`, then press `D`
- 🔁 Reconnect: `tmux attach -t mt4_pipeline`
- ❌ Exit tmux permanently: `exit`

---

## 🧠 Tips

- To download **M1 timeframe**, edit `download_m5_all.sh` and change `--timeframe m5` → `m1`
- To change date range: edit `--date-from` and `--date-to`
- All `.csv` outputs are ~100–500MB per pair depending on timeframe & span

---

## 🛡 License

MIT — Use for trading, research, quant backtesting or educational projects.

---

## 👤 Author

Made with 💻 by [@LeHuyTuong](https://github.com/LeHuyTuong)

If you found this useful, ⭐ star this repo and share it with fellow traders!
