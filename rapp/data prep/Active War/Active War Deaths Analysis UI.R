Active_War_Deaths <- tabPanel(title = "Death Analysis", icon = icon('hospital'),
                              h1("Number of Daily Deaths by Selected Played", style = "color: #336699 ; font-weight: 600"),
                              p("Number of daily deaths by selected player"),
                              fluidRow(
                                column(3, selectInput(inputId = "death_analysis_killed_name_input", label = "Select type of data you wish to see", choices = unique(Active_War_Death_Graph_Prep$killedName)))),
                                fluidRow(
                                  column(3, plotlyOutput("total_deaths_by_player_per_day_graph", width = "300%", height = "600px")))
                              
                              
                              )