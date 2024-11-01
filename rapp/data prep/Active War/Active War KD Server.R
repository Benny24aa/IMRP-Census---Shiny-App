####################### Creating a table so players can see KD's for numerous different things


data_table <- reactive({
  
  table_data <- switch(input$ref_select,
                       "Table_War_All_KD_Active_War" = Table_War_All_KD_Active_War,
                       "Table_War_Weapon_KD_Active_War" = Table_War_Weapon_KD_Active_War,
                       "Table_War_All_KD_Region_War" = Table_War_All_KD_Region_War,
                       "Active_War_Region_NonPlayer_Full_Join_DeLeon" = Active_War_Region_NonPlayer_Full_Join_DeLeon,
                       "Active_War_Region_NonPlayer_Full_Join_Navarro" = Active_War_Region_NonPlayer_Full_Join_Navarro,
                       "war_44_damage" = war_44_damage,
                       "war_44_suicides" = war_44_suicides)
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


###############################################################################################################################
# Graphs and Filters for plotly
###############################################################################################################################


##### Filter for all 3 graphs on deaths simple page ##### 

filter_imrp_death_data <- reactive({
  
  filter_imrp_death_data <- Active_War_Death_Graph_Prep[Active_War_Death_Graph_Prep$killedName == input$death_analysis_killed_name_input,]
  
  return(filter_imrp_death_data )
})

output$total_deaths_by_player_per_day_graph <- renderPlotly({
  
  plot_ly(data = filter_imrp_death_data(),
          x = ~date_killed,
          y = ~Deaths,
          type = 'bar')%>% 
    layout(xaxis = list(title = 'Date Killed'), barmode = 'stack')

  
})

output$total_percentage_by_player_per_day_graph <- renderPlotly({
  
  plot_ly(data = filter_imrp_death_data(),
          x = ~date_killed,
          y = ~War_Wide_Total_Percentage,
          type = 'bar')%>% 
    layout(xaxis = list(title = 'Date Killed'), yaxis = list(title = "Total Percentage"), barmode = 'stack')
  
  
})
