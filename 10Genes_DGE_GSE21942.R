# ================================
# Exploring Differential Expression: GSE21942 (10 Genes)
# Author: github.com/a-s2024
# ================================

# # The R script version is provided to allow quick execution, easy modification,
# and better integration into bioinformatics pipelines or script-based workflows.

# --- Setup ---
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install(c("GEOquery", "limma"), ask = FALSE)

library(GEOquery)
library(limma)
library(ggplot2)

# --- Load and Prepare Data ---
cat("Loading GSE21942 dataset...\n")
gset <- getGEO("GSE21942", GSEMatrix = TRUE)[[1]]

# Subset to first 10 genes only
exprs_small <- exprs(gset)[1:10, ]

# Define sample groups: 15 Controls and 14 MS
group <- factor(c(rep("Control", 15), rep("MS", 14)))

# Check dimensions
stopifnot(length(group) == ncol(exprs_small))

# Design matrix
design <- model.matrix(~ group)

# --- Differential Expression Analysis ---
fit <- lmFit(exprs_small, design)
fit <- eBayes(fit)
results <- topTable(fit, coef = 2, number = Inf)

# Show key statistics
print(results[, c("logFC", "P.Value", "adj.P.Val", "t", "B")])

# --- Volcano Plot ---
volcano <- ggplot(results, aes(x = logFC, y = -log10(P.Value),
                               color = adj.P.Val < 0.05 & abs(logFC) > 1)) +
  geom_point(size = 3) +
  scale_color_manual(values = c("grey", "red")) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "blue") +
  theme_minimal() +
  ggtitle("Volcano Plot (Top 10 Genes)") +
  xlab("Log2 Fold Change") +
  ylab("-log10(P-value)")

print(volcano)

# --- Bar Plot of logFC ---
# Order genes by descending absolute logFC
top_genes <- results[order(-abs(results$logFC)), ]
top_genes$Gene <- factor(rownames(top_genes), levels = rev(rownames(top_genes)))

barplot <- ggplot(top_genes, aes(x = Gene, y = logFC)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  theme_minimal() +
  xlab("Gene") +
  ylab("Log2 Fold Change") +
  ggtitle("Top 10 Genes by Absolute logFC (Descending)")

print(barplot)

# --- Display Gene Names ---
cat("Genes analyzed:\n")
print(rownames(exprs_small))
