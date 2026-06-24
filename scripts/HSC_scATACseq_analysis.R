#####################################################
# Aged HSC scATAC-seq Reanalysis
# Soumen Manna
#
# Dataset:
# GSE162662 / GSE190424
#
# Note:
# This script starts from processed Seurat objects
# generated during the Signac workflow and reproduces
# downstream analyses including DAR identification,
# GO enrichment, GeneActivity analysis and visualization.
#####################################################
# Load packages
library(Signac)
library(Seurat)
library(GenomicRanges)
library(clusterProfiler)
library(org.Mm.eg.db)
library(ggplot2)

# Load processed objects
combined <- readRDS("combined_3clusters.rds")
DARs <- readRDS("DARs_20k_LR.rds")

# Differential accessibility regions
open_DARs <- subset(
  DARs,
  p_val_adj < 0.05 & avg_log2FC > 0
)

closed_DARs <- subset(
  DARs,
  p_val_adj < 0.05 & avg_log2FC < 0
)

# Save DAR tables
write.csv(open_DARs,
          "Aged_open_DAR_genes.csv",
          row.names = FALSE)

write.csv(closed_DARs,
          "Aged_closed_DAR_genes.csv",
          row.names = FALSE)

# Gene activity analysis
gene.activities <- GeneActivity(combined)

combined[["RNA"]] <- CreateAssayObject(
  counts = gene.activities
)

DefaultAssay(combined) <- "RNA"

combined <- NormalizeData(combined)

# Marker genes
genes.use <- c(
  "Runx1",
  "Flt3",
  "Lef1",
  "Tcf3",
  "Stat5b",
  "Gata3",
  "Bmp4",
  "Wnt5a"
)

combined <- ScaleData(
  combined,
  features = genes.use
)

# Heatmap
DoHeatmap(
  combined,
  features = genes.use,
  group.by = "sample"
)

# Save workspace
saveRDS(
  combined,
  "combined_with_GeneActivity.rds"
)
