---
name: run-collect
description: Use when the task involves collecting data from the web/APIs using Python and writing outputs to data_raw/ with logs.
---

## Goal
Collect raw data using Python only. Write outputs to `data_raw/` and logs to `logs/collect/`.

## Steps
1) Read the config path from the user (or default to `configs/default.yml` if it exists).
2) Run: `bash scripts/run_collect.sh <CONFIG>`
3) Confirm:
   - a new file exists in `data_raw/`
   - a log exists in `logs/collect/`
4) Summarize outputs (paths only). Do NOT summarize data values unless asked.