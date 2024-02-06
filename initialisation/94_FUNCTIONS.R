# Function for displaying datasets as data.tables in HTML output
dtfunction = function(dataset){
  datatable = datatable(dataset, 
          rownames = FALSE, 
          filter = "bottom", 
#          extensions = "Buttons", 
          options = 
            list(dom = "Bfrtip", 
                 autoWidth = TRUE #, 
#                 buttons = list(
#                   list(
#                     extend = "csv", 
#                     filename = paste0(dataset)
#                   )
#                 )
            )
) %>% formatStyle(columns = 1:ncol(dataset), `text-align` = 'left')
  return(datatable)
}
