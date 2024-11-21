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
pd <- 0.001
lFC = 1
gene <- FALSE

# Creiamo una variabile che contenga i geni differenzialmente expressi 
resSubset <- subset(res, padj < ___ & abs(log2FoldChange) > ___)

# Ordiniamo in base al FoldChenge
resSubset <- resSubset[order(resSubset$___, decreasing = TRUE), ]

# Creaiamo una variabile con il nome dei geni
genesSelected <- rownames(resSubset)

# Estraiamo i geni dal SummarizedExperiment
heatData <- assay(dds)[___, ]
my_sample_col <- as.data.frame(cbind(rownames(colData(dds)), colData(dds)["infection"]))
colnames(my_sample_col) <- c("name", "sampletype")
rownames(my_sample_col) <- my_sample_col$name
my_sample_col$name <- NULL

# Creaimo l'heatmap
# Cercate nell'help la descrizione delle diverse opzioni
pheatmap(___, 
         annotation_col = my_sample_col, 
         cellwidth = 10, 
         scale = "row", 
         cluster_rows = TRUE, 
         cluster_cols = TRUE, 
         show_rownames = gene, 
         main = paste0("DE genes, centered (FC=", lFC, ", pajd=", pd, ")"), 
         cutree_rows = 2, 
         cutree_cols = 2)

