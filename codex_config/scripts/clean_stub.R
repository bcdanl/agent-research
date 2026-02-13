#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
config <- "configs/default.yml"
if (length(args) >= 2 && args[1] == "--config") config <- args[2]

dir.create("data_clean", showWarnings = FALSE, recursive = TRUE)

stamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
out <- file.path("data_clean", paste0("clean_stub_", stamp, ".csv"))

# Placeholder cleaned data
df <- data.frame(id = 1:3, x = c(1,2,3))
write.csv(df, out, row.names = FALSE)

cat("Config:", config, "\n")
cat("Wrote:", out, "\n")
cat("R version:\n")
print(R.version.string)