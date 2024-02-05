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
  "DT"
  )

print("External R libraries loaded!")