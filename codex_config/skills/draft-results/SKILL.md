---
name: draft-results
description: Use when drafting Results/Robustness sections. Must read outputs/results_json and tables/figures; must cite artifact paths inline.
---

## Rule: no hallucinated numbers
You MUST read numbers from JSON/table artifacts. If missing, run baseline/robustness first.

## Steps
1) Run: `bash scripts/draft_results.sh <CONFIG>`
2) Output is written to:
   - `paper/sections/results.md`
   - `paper/sections/robustness.md`
3) Ensure every claim references an artifact path.