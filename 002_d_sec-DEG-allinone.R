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
dds <- ___

# All in one
#' Analisi DESeq
ddsf <- DESeq(___)

#' Parametri
#' Creale le variabili sottostanti
# mynum:InfluenzaA
# mydenom:NonInfected
# mypval:0.01
# myfc:0.8
# mypadj:fdr
# mycondition:infection

#' Esportiamo i risultati
res <- results(ddsf, 
               contrast = c(mycondition, mynum, mydenom), 
               alpha = mypval, 
               pAdjustMethod = mypadj)

#' Visualizziamo i risultati
___
summary(___)

#' Salva i dati
___(___, "data/DE.rds") 
___(___, "data/res.rds") 

#' Creaiamo un oggetto tibble
out_res <- tibble(
  gene = res@rownames,
  baseMean = res@listData$baseMean,
  log2FoldChange = res@listData$log2FoldChange,
  lfcSE = res@listData$lfcSE,
  # stat = res@listData$stat,
  pvalue = res@listData$pvalue,
  padj = res@listData$padj
) |>
  mutate(across(where(is.double), ~ round(., digits = 2)))

#' Visualizziamo i dati in formato tabulare
datatable(___,
  options = list(
    pageLength = 20,
    autoWidth = TRUE,
    dom = "Bfrtip",
    filter = "top"
  ), rownames = TRUE
)
