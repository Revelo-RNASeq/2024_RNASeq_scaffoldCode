
library(tidyverse)
library(DESeq2) # BioC

#' Importa i dati
readcounts <- readRDS("data/readcounts.rds")
dds <- readRDS("data/dds_fitered.rds")

# Creaiamo un boxplot per visualizzare la dimensione delle librerie
# Combina i 2 grafici con il pacchetto patchwork (https://patchwork.data-imaginist.com/)
library(patchwork)

p1 <- readcounts |>
  tibble() |>
  pivot_longer(
    cols = everything(),
    names_to = "Sample",
    values_to = "Reads"
  ) |>
  ggplot(aes(Sample, Reads)) +
  geom_boxplot() +
  labs(
    title = "RAW data",
    y = "Number of reads"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Creaiamo un boxplot per visualizzare la dimensione delle librerie in scala logaritmica
p2 <- readcounts |>
  tibble() |>
  pivot_longer(
    cols = everything(),
    names_to = "Sample",
    values_to = "Reads"
  ) |>
  ggplot(aes(Sample, Reads)) +
  geom_boxplot() +
  scale_y_log10() +
  labs(
    title = "Data in log scale",
    y = "Number of reads"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

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
  geom_point() +
  geom_abline(slope = 1) +
  labs(title = "Stesso campione")

readcounts |>
  ggplot(aes(x = GSM2545337, y = GSM2545338)) +
  geom_point() +
  geom_abline(slope = 1) +
  labs(title = "Due campioni controllo")

readcounts |>
  ggplot(aes(x = GSM2545339, y = GSM2545341)) +
  geom_point() +
  geom_abline(slope = 1) +
  labs(title = "Due campioni trattato")

readcounts |>
  ggplot(aes(x = GSM2545338, y = GSM2545342)) +
  geom_point() +
  geom_abline(slope = 1) +
  labs(title = "Confronto tra un campione trattato e uno controllo")



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
tibble(
  Sample = rownames(pca_res$rotation),
  PC2 = pca_res$rotation[, 2],
  PC3 = pca_res$rotation[, 3]
) |>
  left_join(coldata |> select(Sample = geo_accession, Group = infection)) |>
  ggplot(aes(x = PC2, y = PC3, color = Group)) +
  geom_point(size = 3) +
  ggtitle("PCA on Raw Counts") +
  theme_bw() +
  scale_color_brewer(palette = "Set1")

tibble(
  Sample = rownames(pca_res$rotation),
  PC3 = pca_res$rotation[, 3],
  PC4 = pca_res$rotation[, 4]
) |>
  left_join(coldata |> select(Sample = geo_accession, Group = infection)) |>
  ggplot(aes(x = PC3, y = PC4, color = Group)) +
  geom_point(size = 3) +
  ggtitle("PCA on Raw Counts") +
  theme_bw() +
  scale_color_brewer(palette = "Set1")


