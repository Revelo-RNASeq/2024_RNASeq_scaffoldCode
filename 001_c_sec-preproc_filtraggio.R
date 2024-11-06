# Carica le librerie
___(DESeq2)
___(DT)

# Se non sono presenti nel tuo PC installale
# Cerca su internet come fare

# Importiamo i dati
readcounts <- readRDS("___")
coldata <- ___("___")

# Creiamo un DESeqDataSet
dds <- DESeqDataSetFromMatrix(
  countData = ___,
  colData = ___,
  design = ~infection
)

# Prova a creare un DESeqDataSet con un desing diverso
DESeqDataSetFromMatrix(
  countData = ___,
  colData = ___,
  design = ~___
)

# Rimuovi i geni con meno di 5 conte
dds <- dds[rowSums(counts(dds)) > ___, ]

# Prova a rimuovere i geni con meno di 10, 50 o 100 conte
tmp <- dds[rowSums(counts(dds)) > ___, ]

# Creiamo una tabella dei campioni: 25 osservazioni (geni) e 4 variabili (individui).'
datatable(counts(dds)[___:___, ___:___],
  options = list(
    pageLength = 5,
    autoWidth = TRUE,
    dom = "Bfrtip",
    filter = "top"
  ), rownames = TRUE
)

# Salva il dataset
___(dds, "___/dds_fitered.rds")
