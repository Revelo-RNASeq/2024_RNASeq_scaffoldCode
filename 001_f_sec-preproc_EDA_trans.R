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

readcounts <- ___
coldata <- ___
dds <- ___
vst <- ___

# Esplorazione dei Dati

## Heatmap

dst <- as.matrix(dist(t(assay(___)))) |> 
  data.frame()

acol <- data.frame("Infection"= vst$infection)
arow <- data.frame("Sex"= vst$infection)
rownames(acol) <- vst$geo_accession
rownames(arow) <- vst$geo_accession

# Prima di creare l'heatmap leggi le istruzioni
pheatmap(___, 
  annotation_col = ___, 
  cluster_row = TRUE, 
  display_numbers = TRUE)

# Creiamo diverse versioni della heatmap provando a cambiare i parametri e le opzioni




@@@@@@@@@@@@@@@@@@@@ Arrivato qui

## PCA

```{r}
#| out-width: 100%
pcaData <- DESeq2::plotPCA(vst, intgroup = c("infection"), ntop = 3000)
pcaData2 <- pcaData$data

pp <- ggplot(pcaData2, aes(x = PC1, y = PC2, text = name)) +
  geom_point(aes(color = infection), size = 5) +
  theme_minimal() 

plotly::ggplotly(pp)
```

## Esplorazioni interattiva dei dati

```{r}
## Convert DESeqDataSet object to a SingleCellExperiment object, in order to
## be able to store the PCA representation
# library(SingleCellExperiment)
# sce <- as(dds, "SingleCellExperiment")

# ## Add PCA to the 'reducedDim' slot
# stopifnot(rownames(pcaData) == colnames(sce))
# reducedDim(sce, "PCA") <- as.matrix(pcaData[, c("PC1", "PC2")])

# ## Add variance-stabilized data as a new assay
# stopifnot(colnames(vst) == colnames(sce))
# assay(sce, "vst") <- assay(vst)

# app <- iSEE::iSEE(sce)
# shiny::runApp(app)
```