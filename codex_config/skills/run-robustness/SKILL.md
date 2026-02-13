---
name: run-robustness
description: Use when the task requires robustness checks (alt samples, SEs, controls, placebo/pretrend checks) and a machine-readable summary.
---

## Required outputs
- `outputs/results_json/robustness_grid.json`
- `outputs/results_json/robustness_summary.json`
- logs in `logs/models/`

## Steps
1) Run: `bash scripts/run_robustness.sh <CONFIG>`
2) Confirm both JSON files exist.
3) Confirm the summary was computed from the grid (not hand-written).