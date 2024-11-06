# Importiamo il file chiamato GSE96870_counts_cerebellum.csv 
readcounts <- read.csv("", row.names = 1)
# Dal manuale cerca di capire cosa fa la l'opzione "row.names"

datanames <- colnames(readcounts)

# Importiamo il file chiamato GSE96870_coldata_all.csv

coldata_all <- read.csv("", ___)

coldata <- coldata_all[datanames,]

# Salviamo i dati
saveRDS(___, "data/readcounts.rds")
saveRDS(___, ___)
```