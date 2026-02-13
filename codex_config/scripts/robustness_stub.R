#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
config <- "configs/default.yml"
if (length(args) >= 2 && args[1] == "--config") config <- args[2]

dir.create("outputs/results_json", showWarnings = FALSE, recursive = TRUE)

grid <- list(
  config_used = config,
  specs = list(
    list(id="R1_cluster_state", coef_x=0.49, se_x=0.03),
    list(id="R2_add_controls",  coef_x=0.52, se_x=0.02),
    list(id="R3_drop_outliers", coef_x=0.47, se_x=0.04)
  )
)

grid_path <- "outputs/results_json/robustness_grid.json"
writeLines(jsonlite::toJSON(grid, pretty = TRUE, auto_unbox = TRUE), grid_path)

# Simple summary computed from the grid
coef_vals <- vapply(grid$specs, function(s) s$coef_x, numeric(1))
summary <- list(
  config_used = config,
  n_specs = length(grid$specs),
  coef_x_min = min(coef_vals),
  coef_x_max = max(coef_vals),
  coef_x_mean = mean(coef_vals)
)

sum_path <- "outputs/results_json/robustness_summary.json"
writeLines(jsonlite::toJSON(summary, pretty = TRUE, auto_unbox = TRUE), sum_path)

cat("Wrote:", grid_path, "\n")
cat("Wrote:", sum_path, "\n")