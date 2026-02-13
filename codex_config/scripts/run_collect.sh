#!/usr/bin/env bash
set -euo pipefail

CONFIG="${1:-configs/default.yml}"
mkdir -p logs/collect data_raw

STAMP="$(date +%Y%m%d_%H%M%S)"
LOG="logs/collect/collect_${STAMP}.log"

echo "[run_collect] config=${CONFIG}" | tee "${LOG}"
echo "[run_collect] python=$(python3 --version 2>&1)" | tee -a "${LOG}"

# Replace this with your real collector entrypoint:
# e.g., python3 collect_py/main.py --config "${CONFIG}"
python3 scripts/collect_stub.py --config "${CONFIG}" 2>&1 | tee -a "${LOG}"

echo "[run_collect] done. log=${LOG}" | tee -a "${LOG}"