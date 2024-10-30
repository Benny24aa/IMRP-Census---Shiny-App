####################### Creating a table so players can see KD's for numerous different things


active_war_kd_table <- reactive({
  
  table_data <- switch(input$KD_Type_Input,
                       "Table_War_All_KD_Active_War" = Table_War_All_KD_Active_War,
                       "Table_War_Weapon_KD_Active_War" = Table_War_Weapon_KD_Active_War,
                       "Table_War_All_KD_Region_War" = Table_War_All_KD_Region_War)
 
   
})

###### Render Table

output$KD_Table_Filtered <- DT::renderDataTable({
  
  # Remove the underscore from column names in the table
  table_colnames <- gsub("_", " ", colnames(active_war_kd_table()))
  
  DT::datatable(active_war_kd_table(), style = 'bootstrap',
                class = 'table-bordered table-condensed',
                rownames = FALSE,
                options = list(pageLength = 20,
                               dom = 'tip',
                               autoWidth = TRUE),
                filter = "top",
                colnames = table_colnames)
  
})

# Download Data 
output$download_table_csv_kd <- downloadHandler(
  filename = function() {
    paste(input$KD_Type_Input, "_data.csv", sep = "")
  },
  content = function(file) {
    # This downloads only the data the user has selected using the table filters
    write_csv(active_war_kd_table()[input[["KD_Table_Filtered_rows_all"]], ], file) 
  } 
)