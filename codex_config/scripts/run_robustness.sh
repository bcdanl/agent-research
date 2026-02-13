#!/usr/bin/env bash
set -euo pipefail

CONFIG="${1:-configs/default.yml}"
mkdir -p logs/models outputs/results_json

STAMP="$(date +%Y%m%d_%H%M%S)"
LOG="logs/models/robustness_${STAMP}.log"

echo "[run_robustness] config=${CONFIG}" | tee "${LOG}"
Rscript scripts/robustness_stub.R --config "${CONFIG}" 2>&1 | tee -a "${LOG}"

echo "[run_robustness] done. log=${LOG}" | tee -a "${LOG}"