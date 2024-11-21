library(tidyverse)

# Importiamo il file chiamato GSE96870_counts.csv 
readcounts_all <- read.csv("data/GSE96870_counts.csv", row.names = 1)

# Importiamo il file chiamato GSE96870_coldata_all.csv
coldata_all <- read.csv("data/GSE96870_coldata_all.csv", row.names =1 )

# Dal manuale cerca di capire cosa fa la l'opzione "row.names"

# Selezioniamo solo i campioni provenienti dal Cerebellum
coldata <- coldata_all |> 
  filter(tissue == "Cerebellum")

# Creaiamo un vettore che contenga i nomi dei campioni Cerebellum
datanames <- coldata |> 
  rownames()

# Createmo un dataset che contenga le conte per i campioni Cerebellum
readcounts <- readcounts_all[, datanames]

# Salviamo i dati
saveRDS(readcounts, "data/readcounts.rds")
saveRDS(coldata, "data/coldata.rds")
