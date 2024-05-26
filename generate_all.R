# Source the R codes
setwd("initialisation")
source("00_CORE.R")
setwd("..")

## DRG - DOCX
OUTPUT_TABLES = "FT"

render("rmd/00_DOCX_HTML.Rmd", 
       output_dir    = "outputs/docx", 
       output_file   = paste0("IOTC_Data_Reporting_Guidelines_", Sys.Date(), ".docx")
)

## DRG - HTML ####
OUTPUT_TABLES = "DT"

### English version ####
render("rmd/00_DOCX_HTML.Rmd", 
       output_format = "html_document2",
       output_dir    = "outputs/html/", 
       output_file   = paste0("index.html")
)

### French version ####
render("rmd/00_DOCX_HTML_FR.Rmd", 
       output_format = "html_document2",
       output_dir    = "outputs/html/", 
       output_file   = paste0("index_fr.html")
)

# Upload on the server
source("./initialisation/99_UPLOAD.R")


