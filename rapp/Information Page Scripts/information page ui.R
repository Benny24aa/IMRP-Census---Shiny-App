information <- tabPanel(title = "Information", 
                        icon = icon("info-circle"),
                        fluidRow(
                          column(6,
                                 h2("Welcome to the IMRP Census Dashboard - War ID 44 DEMO", style = "color:  #336699 ; font-weight: 600"))),
                        
                        fluidRow(
                          column(6, actionButton("new_next", tags$b("New content and future updates"),
                                                 icon = icon('calendar-alt')))),
                        
                        fluidRow(
                          column(12,
                                 h4(tags$b("What is the IMRP Census Dashboard?" , style = "color:  #336699 ; font-weight: 600")),
                                 p("More information soon"), 
                                 h4(tags$b("Type of Data Explored?", style = "color:  #336699 ; font-weight: 600" )),
                                 p("More information soon"),
                                 h4(tags$b(" Disclosure and Data Security Statement", style = "color:  #336699 ; font-weight: 600")),
                                 p("More Information soon")),
                        )#End of Fluid Row
                        
) #End of TabPanel