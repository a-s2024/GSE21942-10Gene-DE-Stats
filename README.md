# MS-DE-Analysis-10Genes-GSE21942

## Project Overview
This mini project performs differential gene expression analysis on 10 selected genes from the Multiple Sclerosis dataset GSE21942, which contains gene expression profiles from peripheral blood mononuclear cells of Multiple Sclerosis patients and healthy controls. The focus on just 10 genes allows for a simplified exploration of key bioinformatics statistical concepts without overwhelming complexity.

The main aim is to understand and demonstrate common statistical measures used in gene expression analysis — including log fold change (logFC), p-value, adjusted p-value (FDR), t-statistic, and B-statistic — and to visualize their interpretation using volcano and bar plots.

## Viewing the report
To view the report, download the `10Genes_DE_GSE21942.html` file and open it in your web browser.

## Dataset
- Source: GSE21942 from Gene Expression Omnibus (GEO)
- Samples: Peripheral blood mononuclear cells from 15 healthy controls and 14 Multiple Sclerosis patients
- Genes: Analysis is limited to the first 10 genes to simplify interpretation and focus on the key statistics

## Methods
- Data loading and preprocessing performed with GEOquery in R
- Differential expression analysis conducted using the limma package, which applies linear models and empirical Bayes moderation to estimate expression differences
- Visualizations (volcano plot and bar plot) generated with ggplot2 to illustrate statistical significance and fold changes for the selected genes

## Key Statistical Measures Explained
- **logFC**: Log base 2 fold change, indicating the magnitude and direction of expression difference between MS and control groups
- **P.Value**: Raw p-value from the moderated t-test assessing the likelihood that the observed difference is due to chance
- **adj.P.Val**: P-value adjusted for multiple testing (False Discovery Rate), helping control false positives in large gene sets
- **t**: Moderated t-statistic representing the strength of evidence for differential expression
- **B**: Log-odds that a gene is differentially expressed, with higher values indicating higher confidence

## Project Aim
This project aims to provide a clear and practical understanding of how differential expression analysis works in bioinformatics using a manageable subset of data. By focusing on 10 genes, the project simplifies complex data and highlights the interpretation of essential statistical outputs and visualizations, making it ideal for beginners and for educational purposes.

## How to Run
1. Open the R Markdown file `10Genes_DE_GSE21942.Rmd` in RStudio.
2. Ensure required packages (GEOquery, limma, ggplot2) are installed.
3. Knit the file to generate the HTML report that includes code, results, and explanations.
