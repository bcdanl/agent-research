# AGENTS.md — Econ Research Agent Protocol (R + Python, artifact-first)

## Core language split (non-negotiable)
- Python is for **data collection** only. Output must go to `data_raw/` (and logs to `logs/collect/`).
- R is for **data cleaning**, **causal inference**, **ML**, and **all visualization**. Output must go to `data_clean/`, `outputs/`, and `paper/`.

If you are about to do visualization in Python, stop and do it in R.

## Single source of truth (artifact-first writing)
Never state numerical results unless you read them from generated artifacts produced by this repo:
- JSON: `outputs/results_json/*.json`
- Tables: `outputs/tables/*`
- Figures: `outputs/figures/*`

When drafting text, always cite the artifact path in-line, e.g.:
- “As shown in Table 1 (`outputs/tables/t1_baseline.tex`) …”
- “Robustness grid summary (`outputs/results_json/robustness_summary.json`) indicates …”

If an artifact is missing, generate it. If generation fails, report the error log.

## Contractor loop (required for any task that changes code or results)
For any task involving `.R`, `.py`, `.qmd`, `.tex`, or outputs:
1) PLAN: write a short plan + list files to change.
2) IMPLEMENT: make changes.
3) VERIFY: run the repo verification script(s) and inspect logs.
4) REPORT: summarize what changed + where artifacts are.

## Folder conventions
- `collect_py/` : Python collectors. Must be deterministic (seeded where applicable).
- `analysis_r/` : R scripts for cleaning, models, robustness, figures.
- `scripts/`    : entrypoints for running steps + verification.
- `outputs/results_json/` : all model summaries (machine-readable).
- `outputs/tables/` and `outputs/figures/` : all rendered outputs.

## Reproducibility rules
- Every runnable script must:
  - print session info (R) or python version + package list (Python) to logs
  - write outputs deterministically (fixed seeds when randomness used)
  - never overwrite raw inputs unless explicitly instructed

## Standard entrypoints (preferred)
- Data collection (Python): `bash scripts/run_collect.sh <CONFIG>`
- Cleaning (R):            `bash scripts/run_clean.sh <CONFIG>`
- Baseline models (R):     `bash scripts/run_baseline.sh <CONFIG>`
- Robustness grid (R):     `bash scripts/run_robustness.sh <CONFIG>`
- Draft Results (R + LLM): `bash scripts/draft_results.sh <CONFIG>`
- Verify everything:       `bash scripts/verify.sh <CONFIG>`

## Safety + secrets
- Never print API keys. Never commit secrets.
- If a script needs a token, read it from environment variables.

## Collaboration (spouse / coauthor)
- Do not assume shared chat context.
- Everything important must be captured in repo artifacts:
  - configs, logs, results JSON, tables/figures, and `paper/sections/*.md`.