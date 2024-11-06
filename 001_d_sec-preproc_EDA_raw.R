
params:
  mycondition: infection
  mynum: InfluenzaA
  mydenom: NonInfected
  mypval: 0.01
  myfc: 0.8
  mypadj: fdr

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

readcounts <- readRDS("___")
coldata <- ___("___")
dds <- ___



# Creaiamo un boxplot per visualizzare la dimensione delle librerie
## Prepariamo i dati
## Dobbiamo trasformare i dati per poterli usare con ggplot2
## ?pivot_longer
tmp1 <- readcounts |> 
  tibble() |> 
  pivot_longer(cols = everything(),
               names_to = "Sample",
               values_to = "Reads") 

tmp2 <- tmp1 |> 
  ggplot(aes(Sample, Reads)) +
  geom_boxplot()

tmp2 +
  labs(title = "RAW data",
       y = "Number of reads") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Creaiamo un boxplot per visualizzare la dimensione delle librerie in scala logaritmica
## Prepariamo i dati
readcounts |> 
  tibble() |> 
  pivot_longer(___, ___, ___) |> 
  ggplot(aes(___, ___)) +
  geom_boxplot() +
  ___() + # cerca la funziona per trasformare i dati in scala logasritmica
  labs(title = "___",
       y = "___") +
  theme(axis.text.x = element_text(angle = ___, hjust = 1))


# Combina i 2 grafici con il pacchetto patchwork (https://patchwork.data-imaginist.com/)
library(patchwork)
p1 <- ___
p2 <- ___

p1 + p2


# Differenze nella dimensione della libreria
## Prepariamo i dati 
tmp <- colSums(readcounts) 

tibble(Label = names(tmp),
       libSize = tmp) |>
  left_join(coldata |> select(Label = geo_accession, Group = infection)) |> 
  ggplot(aes(x = Label, y = libSize / 1e6, fill = Group)) + 
  geom_bar(stat = "identity") + 
  @theme_bw() + 
  labs(x = "Sample", y = "Total count in millions") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)) +
  scale_fill_brewer(palette = "Set1")

## Prova a fare la stessa cosa ma su 10 milioni
___


## Variabilità dell'espressione genica

### Scatterplot usando lo stesso
readcounts |> 
  ggplot(aes(x = GSM2545336, y = GSM2545336)) +
  geom_point()+
  geom_abline(slope = 1) +
  labs(title = "Stesso campione")

## Due campioni controllo
readcounts |> 
  ggplot(aes(x = ___, y = ___)) +
  geom_point()+
  geom_abline(slope = 1) +
  labs(title = "___")

## Due campioni trattato
p3 <- readcounts |> 
  ggplot(___) +
  geom_point()+
  geom_abline(___) +
  labs(title = "___")

## Confronto tra un campione trattato e uno controllo
readcounts |> 
  ___


## Principal Component Analysis)

## Prepariamo i dati
pca_res <- prcomp(readcounts, scale. = TRUE)

# Creaiamo un plot PCA con i dati grezzi
tibble(Sample = rownames(pca_res$rotation),
       PC1 = pca_res$rotation[,1],
       PC2 = pca_res$rotation[,2]) |> 
  left_join(coldata |> select(Sample = geo_accession, Group = infection)) |> 
  ggplot(aes(x = PC1, y = PC2, color = Group)) +
  geom_point(size = 3) +
  ggtitle("PCA on Raw Counts") +
  theme_bw() +
  scale_color_brewer(palette = "Set1")

# Creaiamo un plot PCA con i dati grezzi comparando PC2/PC3, PC3/PC1

