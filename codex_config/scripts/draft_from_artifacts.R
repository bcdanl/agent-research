#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
config <- "configs/default.yml"
if (length(args) >= 2 && args[1] == "--config") config <- args[2]

baseline_path <- "outputs/results_json/baseline.json"
rob_sum_path  <- "outputs/results_json/robustness_summary.json"
tbl_path      <- "outputs/tables/t1_baseline.md"

if (!file.exists(baseline_path)) stop("Missing: ", baseline_path, " (run baseline first)")
if (!file.exists(tbl_path)) stop("Missing: ", tbl_path, " (run baseline first)")

baseline <- jsonlite::fromJSON(baseline_path)

rob_summary <- NULL
has_rob <- file.exists(rob_sum_path)
if (has_rob) rob_summary <- jsonlite::fromJSON(rob_sum_path)

dir.create("paper/sections", showWarnings = FALSE, recursive = TRUE)

results_md <- c(
  "# Results",
  "",
  sprintf("Baseline estimates are reported in Table 1 (`%s`).", tbl_path),
  sprintf("The main coefficient on x is %.3f with SE %.3f (from `%s`).",
          baseline$coef$x, baseline$se$x, baseline_path),
  ""
)

writeLines(results_md, "paper/sections/results.md")

rob_md <- c("# Robustness", "")
if (has_rob) {
  rob_md <- c(
    rob_md,
    sprintf("Robustness summary is computed from `%s`.", rob_sum_path),
    sprintf("Across %d specs, coef(x) ranges [%.3f, %.3f] with mean %.3f.",
            rob_summary$n_specs, rob_summary$coef_x_min, rob_summary$coef_x_max, rob_summary$coef_x_mean),
    ""
  )
} else {
  rob_md <- c(rob_md, sprintf("No robustness artifacts found. Expected `%s`.", rob_sum_path), "")
}
writeLines(rob_md, "paper/sections/robustness.md")

cat("Wrote: paper/sections/results.md\n")
cat("Wrote: paper/sections/robustness.md\n")
cat("Config:", config, "\n")