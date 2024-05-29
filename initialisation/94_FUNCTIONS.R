# Function for displaying datasets as data.tables in HTML output
# Add language as input option
dtfunction = function(dataset, output_table = OUTPUT_TABLE_FORMAT){

  INDIC_SPECIES_COLUMNN = grep("SCIENTIF", names(dataset))
    
    
  if(output_table == "DT"){
  
  datatable = datatable(dataset, 
          rownames = FALSE, 
          filter = "bottom", 
          options = 
            list(dom = "Bfrtip", 
                 autoWidth = TRUE #, 
            )
) %>% formatStyle(columns = 1:ncol(dataset), `text-align` = 'left') %>% formatStyle(columns = INDIC_SPECIES_COLUMNN, fontStyle = "italic")
  return(datatable)
}
  else {
  datatable = 
      dataset[1:16] %>% 
      flextable() %>% 
      flextable::font(part = "all", fontname = "calibri") %>% 
      flextable::fontsize(part = "all", size = 10) %>% 
      italic(j = INDIC_SPECIES_COLUMNN, italic = TRUE) %>% 
      bold(part = "header") %>% 
      bg(part = "header", bg = "grey") %>% 
      fontsize(part = "all", size = 9) %>% 
      align(align = "center", part = "header") %>% 
      align(j = 1, align = "center", part = "body") %>% 
      border_inner() %>% 
      border_outer(border = fp_border(width = 2)) %>% 
      autofit()
}
    return(datatable)
}
