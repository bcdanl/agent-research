#!/usr/bin/env bash
set -euo pipefail

CONFIG="${1:-configs/default.yml}"
mkdir -p logs/models outputs/results_json outputs/tables outputs/figures

STAMP="$(date +%Y%m%d_%H%M%S)"
LOG="logs/models/baseline_${STAMP}.log"

echo "[run_baseline] config=${CONFIG}" | tee "${LOG}"
Rscript scripts/baseline_stub.R --config "${CONFIG}" 2>&1 | tee -a "${LOG}"

echo "[run_baseline] done. log=${LOG}" | tee -a "${LOG}"