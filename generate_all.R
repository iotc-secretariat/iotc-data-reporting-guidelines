# Source the R codes
setwd("initialisation")
source("00_CORE.R")
setwd("..")

## HTML ####
OUTPUT_TABLE_FORMAT = "DT"

### ENGLISH ####
render("rmd/00_DOCX_HTML.Rmd", 
       output_format = "html_document2",
       output_dir    = "outputs/html/", 
       output_file   = paste0("index.html")
)

### FRENCH ####
render("rmd/00_DOCX_HTML_FR.Rmd", 
       output_format = "html_document2",
       output_dir    = "outputs/html/", 
       output_file   = paste0("index_fr.html")
)

# Upload files on the server
source("./initialisation/99_UPLOAD.R")

## DOCX ####
OUTPUT_TABLE_FORMAT = "FT"

### FRENCH ####
render("rmd/00_DOCX_HTML.Rmd", 
       output_dir    = "outputs/docx", 
       output_file   = paste0("IOTC_Data_Reporting_Guidelines_", Sys.Date(), ".docx")
)

### ENGLISH ####
render("rmd/00_DOCX_HTML_FR.Rmd", 
       output_dir    = "outputs/docx", 
       output_file   = paste0("IOTC_Directions_Déclarations_Données_", Sys.Date(), ".docx")
)
