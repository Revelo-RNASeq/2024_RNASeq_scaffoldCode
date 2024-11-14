
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

## Grafico Media/Deviazione standard

meanSdPlot(assay(___), ranks = FALSE)

## Trasformazione

### VST

vst <- DESeq2::vst(___, blind = TRUE) # Che cosa indica il parametro blind?
saveRDS(vst, "data/vst.rds")
meanSdPlot(assay(vst), ranks = FALSE)

### rlog

rlog <- ___
meanSdPlot(___)
```
