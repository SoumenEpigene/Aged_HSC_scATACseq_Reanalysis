# Aged_HSC_scATACseq_Reanalysis

## Overview

This repository contains a re-analysis of single-cell ATAC-seq data from young and aged hematopoietic stem cells (HSCs) using Signac and Seurat.

## Analysis workflow

1. Data loading and quality control
2. TF-IDF normalization
3. LSI dimensional reduction
4. UMAP visualization
5. Clustering
6. Differential accessibility analysis (DARs)
7. Peak annotation
8. GO enrichment analysis
9. Gene activity analysis

## Main findings

* 627 age-associated open DARs
* 499 age-associated closed DARs
* Open DARs enriched for developmental and morphogenesis programs
* Closed DARs enriched for lymphocyte differentiation and immune regulatory pathways

## Repository structure

* `figures/` : figures generated during the analysis
* `scripts/` : R scripts used in the workflow
* `results/` : differential accessibility and enrichment results
