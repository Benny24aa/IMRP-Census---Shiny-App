Active_War_Deaths <- tabPanel(title = "Death Analysis", icon = icon('hospital'),
                              h1("Number of Daily Deaths by Selected Player", style = "color: #336699 ; font-weight: 600"),
                              p("Number of daily deaths by selected player"),
                              fluidRow(
                                column(3, selectInput(inputId = "death_analysis_killed_name_input", label = "Select type of data you wish to see", choices = unique(Active_War_Death_Graph_Prep$killedName)))),
                                fluidRow(
                                  column(3, plotlyOutput("total_deaths_by_player_per_day_graph", width = "300%", height = "600px")))
                              # ,
                              # h1("Total Percentage of Deaths Across Entire War by Selected Player Daily", style = "color: #336699 ; font-weight: 600"),
                              # p("Total Percentage of Deaths by Selected Player Daily"),
                              # fluidRow(
                              #   column(3, plotlyOutput("total_percentage_by_player_per_day_graph", width = "300%", height = "600px"))),
                              # h1("Total Percentage of Deaths Across all Wars by Selected Player Daily", style = "color: #336699 ; font-weight: 600"),
                              # p("Total Percentage of Deaths Across all Wars by Selected Player Daily"),
                              # fluidRow(
                              #   column(3, plotlyOutput("total_percentage_all_wars_by_player_per_day_graph", width = "300%", height = "600px")))
                              # 
                              )