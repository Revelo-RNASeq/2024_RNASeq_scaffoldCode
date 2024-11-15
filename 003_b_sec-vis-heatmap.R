library(tidyverse)
library(DESeq2) # BioC
library(RColorBrewer)
library(pheatmap)
library(ggrepel)
library(cowplot)
library(DT)
library(scales)
library(vsn) # BioC
library(apeglm) # BioC
library(rmarkdown)
library(gt)

#' Importare dati
dds <- readRDS("data/DE.rds")
res <- readRDS("data/res.rds")

#' Create una funzione per visualizzare l'heatmap
hm <- function(res, pd = 0.001, lFC = 1, gene = FALSE) {
  resSubset <- subset(res, padj < pd & abs(log2FoldChange) > lFC)
  resSubset <- resSubset[order(resSubset$log2FoldChange, decreasing = TRUE), ]
  genesSelected <- rownames(resSubset)
  heatData <- assay(dds)[genesSelected, ]
  my_sample_col <- as.data.frame(cbind(rownames(colData(dds)), colData(dds)["infection"]))
  colnames(my_sample_col) <- c("name", "sampletype")
  rownames(my_sample_col) <- my_sample_col$name
  my_sample_col$name <- NULL
  pheatmap(heatData, annotation_col = my_sample_col, cellwidth = 10, scale = "row", cluster_rows = TRUE, cluster_cols = TRUE, show_rownames = gene, main = paste0("DE genes, centered (FC=", lFC, ", pajd=", pd, ")"), cutree_rows = 2, cutree_cols = 2)
}

#' Create una funzione per visualizzare diversi tipi di Volcano plot