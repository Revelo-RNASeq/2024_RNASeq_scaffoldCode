library(tidyverse)

#' Importiamo i dati
dds <- ___
res <- ___

# Volcano plot

# Crea un volcano plot con ggplot2
#' Assegna al Fold Change e al''adjusted p-value i valori che preferisci
FC <- ___
pv <- ___

#' Crea una tabella tibble e assegna dei colori ai geni up/down regolati
out_res <- tibble(
  gene = res@rownames,
  baseMean = res@listData$baseMean,
  log2FoldChange = res@listData$log2FoldChange,
  lfcSE = res@listData$lfcSE,
  # stat = res@listData$stat,
  pvalue = res@listData$pvalue,
  padj = res@listData$padj
)  |>
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
