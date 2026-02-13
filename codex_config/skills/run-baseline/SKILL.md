---
name: run-baseline
description: Use when the task involves estimating baseline causal/ML models in R and exporting tables/figures/results JSON.
---

## Required outputs
- `outputs/results_json/baseline.json`
- at least one table in `outputs/tables/` (tex or md)
- optional figures in `outputs/figures/`
- logs in `logs/models/`

## Steps
1) Run: `bash scripts/run_baseline.sh <CONFIG>`
2) Verify outputs exist.
3) If any errors, surface `logs/models/baseline.log` (tail only).