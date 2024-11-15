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

# Volcano plot

# Crea un volcano plot con ggplot2
#' Assegna al Fold Change e al''adjusted p-value i valori che preferisci
FC <- ___
pv <- ___

#' Crea una tabella tibble e assegna dei colori ai geni up/down regolati
out_res <- tibble(
  gene = ___,
  baseMean = ___,
  log2FoldChange = ___,
  lfcSE = ___,
  pvalue = ___,
  padj = ___
) |>
  mutate(colore = case_when(
    log2FoldChange > FC & padj < pv ~ "___", # scegli il colore che preferisci per gli up regolati
    log2FoldChange < -FC & padj < pv ~ "___", # scegli il colore che preferisci per i down regolati
    TRUE ~ "___" # scegli il colore che preferisci per i non regolati
  ))

#' Crea il grafico ggplot

ggplot(___) +
  ___

#' Salvare il grafico in una variabile e visualizzarlo con plotly in maniera interattiva
plotly::ggplotly(___)


#' Create Volcano plots con altre soglie
