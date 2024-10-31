####################### Creating a table so players can see KD's for numerous different things


data_table <- reactive({
  
  table_data <- switch(input$ref_select,
                       "Table_War_All_KD_Active_War" = Table_War_All_KD_Active_War,
                       "Table_War_Weapon_KD_Active_War" = Table_War_Weapon_KD_Active_War,
                       "Table_War_All_KD_Region_War" = Table_War_All_KD_Region_War,
                       "Active_War_Region_NonPlayer_Full_Join" = Active_War_Region_NonPlayer_Full_Join)
})

# Render Data Table 

output$table_filtered <- DT::renderDataTable({
  
  # Remove the underscore from column names in the table
  table_colnames  <-  gsub("_", " ", colnames(data_table()))
  
  DT::datatable(data_table(), style = 'bootstrap',
                class = 'table-bordered table-condensed',
                rownames = FALSE,
                options = list(pageLength = 20,
                               dom = 'tip',
                               autoWidth = TRUE),
                filter = "top",
                colnames = table_colnames)
  
})


# Download Data 
output$download_table_csv <- downloadHandler(
  filename = function() {
    paste(input$ref_select, "_data.csv", sep = "")
  },
  content = function(file) {
    # This downloads only the data the user has selected using the table filters
    write_csv(data_table()[input[["table_filtered_rows_all"]], ], file) 
  } 
)