#!/usr/bin/env bash
set -euo pipefail

CONFIG="${1:-configs/default.yml}"
mkdir -p logs/clean data_clean

STAMP="$(date +%Y%m%d_%H%M%S)"
LOG="logs/clean/clean_${STAMP}.log"

echo "[run_clean] config=${CONFIG}" | tee "${LOG}"
Rscript scripts/clean_stub.R --config "${CONFIG}" 2>&1 | tee -a "${LOG}"

echo "[run_clean] done. log=${LOG}" | tee -a "${LOG}"