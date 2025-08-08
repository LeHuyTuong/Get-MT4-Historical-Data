# 📈 MT4 Data Pipeline (Dukascopy to MT4 CSV)

Automated end-to-end pipeline to download high-quality historical forex data from Dukascopy, convert it to MT4-compatible CSV format, and verify its integrity — with full `tmux` support for VPS/disconnect-safe operation.

---

## ⚙️ Features

- ⬇ Download multiple forex pairs (M1/M5) from Dukascopy
- 🔁 Auto convert to MT4 `.csv` format (ready to import)
- ✅ Include flat candles (`flats = true`)
- 📊 Validate year-wise completeness (2015–2025)
- 🧵 Run safely in `tmux`, survive SSH disconnect
- 📁 Organized output folders: `download/`, `mt4_ready/`

---

## 📦 Folder Structure

```bash
mt4_data_pipeline/
├── download_m5_all.sh            # Download all pairs with `flats`
├── convert_all_to_mt4.py         # Convert to MT4 format
├── check_year_distribution.py    # Validate yearly completeness
├── run_pipeline_tmux.sh          # Run everything inside tmux
├── symbols.txt                   # Forex pairs list (uppercase)
├── download/                     # Raw Dukascopy data
└── mt4_ready/                    # Converted MT4-ready CSVs
