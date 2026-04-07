# Source the R codes
setwd("initialisation")
source("00_CORE.R")
setwd("..")

## HTML ####
OUTPUT_TABLE_FORMAT = "DT"

# FISHERY STATISTICS REPORTING GUIDELINES ####

#### ENGLISH ####
render("rmd/statrg/00_DOCX_HTML.Rmd", 
       output_format = "html_document2",
       output_dir    = "outputs/statrg/html/", 
       output_file   = paste0("index.html")
)

# #### FRENCH ####
# render("rmd/00_DOCX_HTML_FR.Rmd", 
#        output_format = "html_document2",
#        output_dir    = "outputs/html/", 
#        output_file   = paste0("index_fr.html")
# )

# Upload files on the server
source("./initialisation/99_UPLOAD.R")

# ## DOCX ####
# OUTPUT_TABLE_FORMAT = "FT"
# 
# ### FRENCH ####
# render("rmd/00_DOCX_HTML.Rmd", 
#        output_dir    = "outputs/docx", 
#        output_file   = paste0("IOTC_Data_Reporting_Guidelines_", Sys.Date(), ".docx")
# )
# 
# ### ENGLISH ####
# render("rmd/00_DOCX_HTML_FR.Rmd", 
#        output_dir    = "outputs/docx", 
#        output_file   = paste0("IOTC_Directions_Déclarations_Données_", Sys.Date(), ".docx")
# )

# ROS REPORTING GUIDELINES ####

render("rmd/rosrg/00_DOCX_HTML.Rmd", 
       output_format = "html_document2",
       output_dir    = "outputs/rosrg/html/", 
       output_file   = paste0("index.html")
)

