Factions_Active_War_UI <- tabPanel(title = "War Overview", icon = icon('hospital'),
                              h1("Number of Deaths Daily by Faction", style = "color: #336699 ; font-weight: 600"),
                              p("Number of Deaths Daily by Faction"),
                              fluidRow(
                                column(3, plotlyOutput("active_war_graph_overview", width = "300%", height = "600px"))))