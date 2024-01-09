# Source the R codes
setwd("initialization")
source("00_CORE.R")
setwd("..")



# DOCX ####

#TITLE = paste0("Data reporting guidelines")
TITLE = paste0("Guidelines for the reporting of fisheries statistics to the IOTC")

load_environment(paste0("./data/RData/"))

### DRG - DOCX
render("rmd/DRG/00_DOCX_HTML.Rmd", 
       output_format = "word_document2", 
       output_dir    = "outputs/docx/", 
       output_file   = paste0(TITLE, ".docx")
)

### DRG - HTML
render("rmd/DRG/00_DOCX_HTML.Rmd", 
       output_format = "html_document2",
       output_dir    = "outputs/html/", 
       output_file   = paste0(TITLE, ".html")
)

