# Carica le librerie
library(DESeq2)
library(DT)

# Se non sono presenti nel tuo PC installale
# Cerca su internet come fare

# Importiamo i dati
readcounts <- readRDS("data/readcounts.rds")
coldata <- readRDS("data/coldata.rds")

# Creiamo un DESeqDataSet
dds <- DESeqDataSetFromMatrix(
  countData = readcounts,
  colData = coldata,
  design = ~infection
)

# Rimuovi i geni con meno di 5 conte
dds <- dds[rowSums(counts(dds)) > 5, ]

# Prova a rimuovere i geni con meno di 10, 50 o 100 conte
tmp <- dds[rowSums(counts(dds)) > 50, ]

# Creiamo una tabella dei campioni: 25 osservazioni (geni) 
datatable(counts(dds)[1:25, ],
  options = list(
    pageLength = 5,
    autoWidth = TRUE,
    dom = "Bfrtip",
    filter = "top"
  ), rownames = TRUE
)

# Salva il dataset
saveRDS(dds, "data/dds_fitered.rds")
