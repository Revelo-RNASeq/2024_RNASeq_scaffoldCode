# downloading raw data in a folder called "data"
# Il primo passo è creare la cartella chiamata "data" usando il pacchetto fs (https://fs.r-lib.org/) 

# Caricare la library chiamata fs 
library(fs)

# Creare la cartella "data"
dir_create("data")


# Scaricare i file che ci serviranno per l'analisi 
# 1. GSE96870_counts.csv
# 2. GSE96870_coldata_all.csv
# I file sono tutti in un repository su github: https://github.com/Revelo-RNASeq/2024_RNASeq_scaffoldCode/raw/data/


download.file(
  url = "https://github.com/Revelo-RNASeq/2024_RNASeq_scaffoldCode/raw/data/GSE96870_counts.csv", 
  destfile = "data/GSE96870_counts.csv"
  )

download.file(
  url = "https://github.com/Revelo-RNASeq/2024_RNASeq_scaffoldCode/raw/data/GSE96870_coldata_all.csv", 
  destfile = "data/GSE96870_coldata_all.csv"
)
