---
name: run-clean
description: Use when the task involves cleaning or transforming raw data; must be done in R and write outputs to data_clean/.
---

## Goal
Clean and transform raw data using R, producing analysis-ready datasets.

## Steps
1) Run: `bash scripts/run_clean.sh <CONFIG>`
2) Confirm outputs exist under `data_clean/`.
3) Emit a short data dictionary change note (new vars, dropped vars) in `logs/clean/`.
4) Do not run models here.