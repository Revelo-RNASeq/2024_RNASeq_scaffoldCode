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

#' Importa i dati
readcounts <- ___
coldata <- ___
dds <- ___
vst <- ___
dds_esf <- ___


# Modellazione statistica 

dds_stat <- estimateDispersions(___, fitType = "local")
plotDispEsts(dds_stat)

# Save the data
___(dds_stat, "data/dds_stat.rds")
