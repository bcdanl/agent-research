#!/usr/bin/env bash
set -euo pipefail

CONFIG="${1:-configs/default.yml}"
mkdir -p logs/draft paper/sections

STAMP="$(date +%Y%m%d_%H%M%S)"
LOG="logs/draft/draft_${STAMP}.log"

echo "[draft_results] config=${CONFIG}" | tee "${LOG}"
Rscript scripts/draft_from_artifacts.R --config "${CONFIG}" 2>&1 | tee -a "${LOG}"

echo "[draft_results] done. log=${LOG}" | tee -a "${LOG}"