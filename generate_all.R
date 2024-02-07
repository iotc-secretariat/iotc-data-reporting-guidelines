# Source the R codes
setwd("initialisation")
source("00_CORE.R")
setwd("..")

### DRG - HTML
render("rmd/00_HTML.Rmd", 
       output_format = "html_document2",
       output_dir    = "outputs/html/", 
       output_file   = paste0("index.html")
)

# Upload on the server
source("./initialisation/99_UPLOAD.R")
