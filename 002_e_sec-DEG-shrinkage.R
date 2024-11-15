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

#' Importiamo i dati
dds <- ___
res <- ___

#' In aggiunta puoi importare i dati creati con i diversi parametri dallo script precedente


# Shrinkage in DESeq2

#' Applica lo shrinkage con la funzione lfcShrink()
resultsNames(dds)
resShrink <- lfcShrink(___, coef = "___", type = "apeglm")

#' Crea il plot MA con i dati ottenuti dopo lo Shrinkage