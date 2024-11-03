information <- tabPanel(title = "Information", 
                        icon = icon("info-circle"),
                        fluidRow(
                          column(6,
                                 h2("Navarro vs DeLeon", style = "color:  #336699 ; font-weight: 600"))),
                        
                        fluidRow(
                          column(6, actionButton("new_next", tags$b("New content and future updates"),
                                                 icon = icon('calendar-alt')))),
                        
                        fluidRow(
                          column(12,
                                 h4(tags$b("What is the IMRP Census Dashboard?" , style = "color:  #336699 ; font-weight: 600")),
                                 p("There is currently a faction war going on. Navarro is fighting against DeLeon. The prize for the winner is $500.000.000. 
                                   If you are part of warring faction, you should carefully read and understand some war-specific server rules."), 
                                 h4(tags$b("Type of Data Explored?", style = "color:  #336699 ; font-weight: 600" )),
                                 p("More information soon"),
                                 h4(tags$b(" Disclosure and Data Security Statement", style = "color:  #336699 ; font-weight: 600")),
                                 p("More Information soon")),
                        )#End of Fluid Row
                        
) #End of TabPanel