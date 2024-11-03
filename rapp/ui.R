
source("Information Page Scripts/information page ui.R")
source("data prep/Active War/Active War KD UI.R")
source("data prep/Active War/Active War Deaths Analysis UI.R")
source("data prep/Active War/active war faction graphs ui.R")
navbarPage(title = div(tags$a(img(src="", width=120, alt = ""),
                              href= "",
                              target = "_blank"),
                       style = "position: relative; top: -10px;"),
           windowTitle = "IMRP Census 2024", #title for browser tab
           header = tags$head(includeCSS("www/styles.css"), # CSS styles
                              HTML("<html lang='en'>")),
           
           ##### Tab Panels
           information, ### Information Tab being called on by UI
           navbarMenu("DeLeon vs Navarro", Factions_Active_War_UI, Active_War_Leaderboard_UI, Active_War_Deaths),
           navbarMenu("War Fun Facts"),
           navbarMenu("War Leaderboards"),
           navbarMenu("War Location Analysis"),
           navbarMenu("War Weapon Analysis"),
           navbarMenu("Weapon Licenses"),
           navbarMenu("Global Wars Analysis"),
           navbarMenu("Minesweeper and Statelot"),
           navbarMenu("Giftboxes Halloween"),
           navbarMenu("Christmas Event")
           
           
           
           
           
           
           
)#End of navbarpage