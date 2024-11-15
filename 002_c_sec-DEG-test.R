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
dds_stat <- ___

# Testing 

ddsf <- nbinomWaldTest(___)


