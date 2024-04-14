print("Loading external R libraries...")

# Install/load libraries required for analysis
pacman::p_load(
  "tidyverse", 
  "flextable", 
  "scales", 
  "openxlsx", 
  "rmarkdown", 
  "knitr", 
  "bookdown", 
  "officer", 
  "officedown", 
  "knitr", 
  "DT", 
  "dplyr"
  )

print("External R libraries loaded!")