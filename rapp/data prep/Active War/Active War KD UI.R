Active_War_KDs_UI <- tabPanel(title = "Kill/Death Ratios", icon = icon('table'),
                              h2("Select the KD's you wish to download", style = "color: #336699 ; font-weight: 600"),
                              p("This section allows you to view kill/death ratio data in table format. You can use the filters to select the data you're interested in and download it into a csv format using the download button."),
                              column(6, selectInput("ref_select", "Select the data you want to explore.",
                                                    choices = Table_KD_List)),
                              mainPanel(width = 12,
                                        DT::dataTableOutput("table_filtered")),
                              column(6, downloadButton('download_table_csv', 'Download data')),
) 
