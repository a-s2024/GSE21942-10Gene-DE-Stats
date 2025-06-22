# MS-DE-Analysis-10Genes-GSE21942

## Project Overview
This mini project performs differential gene expression analysis on 10 selected genes from the Multiple Sclerosis dataset GSE21942, which contains gene expression profiles from peripheral blood mononuclear cells of Multiple Sclerosis patients and healthy controls. The focus on just 10 genes allows for a simplified exploration of key bioinformatics statistical concepts without overwhelming complexity.

The main aim is to understand and demonstrate common statistical measures used in gene expression analysis — including log fold change (logFC), p-value, adjusted p-value (FDR), t-statistic, and B-statistic — and to visualize their interpretation using volcano and bar plots.

## Files

- The **R Markdown** file (.Rmd) combines code, output, and narrative in a single document, making it ideal for reproducible reports and detailed explanations.
- The **HTML** file is the rendered output of the R Markdown file, providing a user-friendly, interactive report viewable in any web browser.
- The **R Script** (.R) contains only the code for quick execution and easy integration into automated workflows or pipelines.

Including all three formats provides flexibility for different users and use cases—from reading and sharing results to re-running or modifying the analysis.

## Viewing the report
To view the report, download the `10Genes_DE_GSE21942.html` file and open it in your web browser.

## Dataset
- Source: [GSE21942](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE21942) dataset from the NCBI Gene Expression Omnibus (GEO)
- Samples: Peripheral blood mononuclear cells from 15 healthy controls and 12 Multiple Sclerosis patients
- Genes: Analysis is limited to the first 10 genes to simplify interpretation and focus on the key statistics

## Methods
- Data loading and preprocessing performed with GEOquery in R
- Differential expression analysis conducted using the limma package, which applies linear models and empirical Bayes moderation to estimate expression differences
- Visualizations (volcano plot and bar plot) generated with ggplot2 to illustrate statistical significance and fold changes for the selected genes

## 🔍 Key Statistical Measures Explained

### 🔹 logFC (Log Fold Change)
The `logFC` represents the log base 2 fold change in gene expression between groups (e.g., MS vs Control). A positive value indicates upregulation in MS, while a negative value indicates downregulation. For example, a logFC of +1 means the gene is expressed twice as much in MS compared to controls. It reflects both **direction** and **magnitude** of expression change.

### P.Value (Raw p-value)
The raw `P.Value` is the unadjusted probability that the observed gene expression difference is due to random chance. A smaller p-value (typically < 0.05) suggests stronger evidence for differential expression. It tests **statistical significance** per gene.

### adj.P.Val (Adjusted p-value)
The `adj.P.Val` accounts for multiple testing using methods like False Discovery Rate (FDR). This controls the number of false positives expected when testing thousands of genes. It's a **corrected** p-value that provides more **trustworthy significance**.

### t (Moderated t-statistic)
The `t` value is a t-statistic adjusted using information from all genes, making it more robust for small sample sizes. Larger absolute t-values indicate stronger evidence for a difference in expression. It's used to **prioritize genes** by strength of effect.

### B (Log-Odds Score)
The `B` statistic represents the log-odds that a gene is truly differentially expressed. Higher B values indicate greater **confidence** in the gene’s differential expression. It's useful for **ranking genes** by likelihood of being truly significant.

## Project Aim
This project aims to provide a clear and practical understanding of how differential expression analysis works in bioinformatics using a manageable subset of data. By focusing on 10 genes, the project simplifies complex data and highlights the interpretation of essential statistical outputs and visualizations, making it ideal for beginners and for educational purposes.

## How to Run
1. Open the R Markdown file `10Genes_DE_GSE21942.Rmd` in RStudio.
2. Ensure required packages (GEOquery, limma, ggplot2) are installed.
3. Knit the file to generate the HTML report that includes code, results, and explanations.
