#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
config <- "configs/default.yml"
if (length(args) >= 2 && args[1] == "--config") config <- args[2]

dir.create("outputs/results_json", showWarnings = FALSE, recursive = TRUE)
dir.create("outputs/tables", showWarnings = FALSE, recursive = TRUE)

# Placeholder "model results"
baseline <- list(
  config_used = config,
  model = "stub_lm",
  coef = list(intercept = 0.1, x = 0.5),
  se = list(intercept = 0.01, x = 0.02),
  n = 1234
)

json_path <- "outputs/results_json/baseline.json"
writeLines(jsonlite::toJSON(baseline, pretty = TRUE, auto_unbox = TRUE), json_path)

table_path <- "outputs/tables/t1_baseline.md"
tbl <- data.frame(term = c("(Intercept)", "x"),
                  estimate = c(0.1, 0.5),
                  se = c(0.01, 0.02))
writeLines(c("# Table 1: Baseline (stub)", "", knitr::kable(tbl, format = "pipe")), table_path)

cat("Wrote:", json_path, "\n")
cat("Wrote:", table_path, "\n")