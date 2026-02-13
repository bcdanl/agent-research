#!/usr/bin/env bash
set -euo pipefail

CONFIG="${1:-configs/default.yml}"
mkdir -p logs/verify

STAMP="$(date +%Y%m%d_%H%M%S)"
LOG="logs/verify/verify_${STAMP}.log"

{
  echo "[verify] config=${CONFIG}"
  echo "[verify] git status:"
  git status --porcelain || true

  echo
  echo "[verify] required artifacts checks:"
  test -f outputs/results_json/baseline.json
  test -f outputs/tables/t1_baseline.md

  # robustness optional but if present, enforce both
  if test -f outputs/results_json/robustness_grid.json; then
    test -f outputs/results_json/robustness_summary.json
  fi

  echo
  echo "[verify] smoke run: R session info"
  Rscript -e 'cat(R.version.string, "\n")'

  echo
  echo "[verify] python version"
  python3 --version

  echo
  echo "[verify] OK"
} 2>&1 | tee "${LOG}"

echo "[verify] log=${LOG}"