Factions_Active_War_UI <- tabPanel(title = "War Overview", icon = icon('hospital'),
                              h1("Number of Deaths Daily by Faction", style = "color: #336699 ; font-weight: 600"),
                              p("Number of Deaths Daily by Faction since the start of the war"),
                              fluidRow(
                                column(3, plotlyOutput("active_war_graph_overview", width = "300%", height = "600px"))),
                              h1("Total Number of Deaths by Faction", style = "color: #336699 ; font-weight: 600"),
                              p("Total number of deaths since the start of the war by faction"),
                              fluidRow(
                                column(3, plotlyOutput("active_war_graph_overview_cum", width = "300%", height = "600px"))),
                              h1("Total Number of Hours Daily by Faction", style = "color: #336699 ; font-weight: 600"),
                              p("Total number of hours played since the start of the war."),
                              fluidRow(
                                column(3, plotlyOutput("playtime_active_war_graph", width = "300%", height = "600px")))
                              
                           
                              
                              
                              
                              
                              )