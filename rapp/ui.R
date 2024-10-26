
source("Information Page Scripts/information page ui.R")

navbarPage(title = div(tags$a(img(src="", width=120, alt = ""),
                              href= "",
                              target = "_blank"),
                       style = "position: relative; top: -10px;"),
           windowTitle = "IMRP Census 2024", #title for browser tab
           header = tags$head(includeCSS("www/styles.css"), # CSS styles
                              HTML("<html lang='en'>")),
           
           ##### Tab Panels
           information, ### Information Tab being called on by UI
           navbarMenu("Leaderboards"),# Leaderboards
           navbarMenu("Location Analysis") # Location Analysis
           
           
           
           
           
           
           
)#End of navbarpage