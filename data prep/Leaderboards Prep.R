####### Kill/Death Ratios #######

# library(readxl)
# library(dplyr)
# library(fs)
# library(purrr)
# library(data.table)
# library(tidyr)
# library(janitor)
# library(stringr)
# library(readr)

IMRP_Data_Cleaned_kills <- IMRP_Full_Census_File_Cleaned %>% 
  mutate(Team_Kill = if_else(killedFactionId == killerFactionId, "Team Kill", "Not")) %>% 
  filter(Team_Kill != "Team Kill") %>% 
  group_by(killerName, War_ID, killerId) %>% 
summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killerName, Kills = count)



IMRP_Data_Cleaned_Deaths <- IMRP_Full_Census_File_Cleaned %>% 
  group_by(killedName, War_ID) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killedName, Deaths = count)

kds <- merge(IMRP_Data_Cleaned_Deaths, IMRP_Data_Cleaned_kills) %>% 
  mutate(Ratio = Kills/Deaths)


total_kds_kills <- IMRP_Full_Census_File_Cleaned %>% 
  mutate(Team_Kill = if_else(killedFactionId == killerFactionId, "Team Kill", "Not")) %>% 
  filter(Team_Kill != "Team Kill") %>% 
  group_by(killerName) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killerName, Kills = count)



totl_kds_Deaths <- IMRP_Full_Census_File_Cleaned %>% 
  group_by(killedName) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killedName, Deaths = count)

kds_total <- merge(totl_kds_Deaths, total_kds_kills) %>% 
  mutate(Ratio = Kills/Deaths)
