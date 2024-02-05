# Source the R codes
setwd("initialization")
source("00_CORE.R")  ##keeping for now just for tables that can be created or data references, but seems not needed###
setwd("..")

# DOCX ####

TITLE = "DRGs"

### DRG - DOCX
render("rmd/00_DOCX_HTML.Rmd", 
       output_dir    = "outputs/docx/", 
       output_file   = paste0(TITLE, ".docx")
)

### DRG - HTML
render("rmd/00_DOCX_HTML.Rmd", 
       output_format = "html_document2",
       output_dir    = "outputs/html/", 
       output_file   = paste0(TITLE, ".html")
)

