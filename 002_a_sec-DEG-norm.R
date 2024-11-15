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

# Normalizzazione

dds_esf <- estimateSizeFactors(___)

colData(dds)
colData(dds_esf)

saveRDS(___, "data/dss_esf.rds")
