##### Data set for Full KD

Active_War <- IMRP_Full_Census_File_Cleaned %>% 
  filter(War_ID == "War 44")

Active_War_kills <- Active_War %>% 
  mutate(Team_Kill = if_else(killedFactionId == killerFactionId, "Team Kill", "Not")) %>% 
  filter(Team_Kill != "Team Kill") %>% 
  group_by(killerName, War_ID, killerId) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killerName, Kills = count)


Active_War_Deaths <- Active_War %>% 
  group_by(killedName, War_ID) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killedName, Deaths = count)

Active_War_KDs <- merge(Active_War_kills, Active_War_Deaths) %>% 
  mutate(Ratio = Kills/Deaths) %>% 
  mutate(reason = "All")

##### Dataset for reasons

Active_War_kills_reason <- Active_War %>% 
  mutate(Team_Kill = if_else(killedFactionId == killerFactionId, "Team Kill", "Not")) %>% 
  filter(Team_Kill != "Team Kill") %>% 
  group_by(killerName, War_ID, killerId, reason) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killerName, Kills = count)

Active_War_Deaths_reason <- Active_War %>% 
  group_by(killedName, War_ID, reason) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killedName, Deaths = count)

Active_War_KDs_reason <- merge(Active_War_kills_reason, Active_War_Deaths_reason) %>% 
  mutate(Ratio = Kills/Deaths) %>% 
  mutate(reason = as.character(reason))

Weapon_Based_KDs_Active_War <- bind_rows(Active_War_KDs_reason, Active_War_KDs)

Weapon_Based_KDs_Active_War <- Weapon_Based_KDs_Active_War %>% 
  mutate(KD_Type = "Weapon")

rm(Active_War_KDs_reason)

##### Dataset for Regions

Active_War_kills_Region <- Active_War %>% 
  mutate(Team_Kill = if_else(killedFactionId == killerFactionId, "Team Kill", "Not")) %>% 
  filter(Team_Kill != "Team Kill") %>% 
  group_by(killerName, War_ID, killerId, Region) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killerName, Kills = count) %>% 
  rename(reason = Region)

Active_War_Deaths_Region <- Active_War %>% 
  group_by(killedName, War_ID, Region) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killedName, Deaths = count) %>% 
  rename(reason = Region)

Active_War_KDs_Region <- merge(Active_War_kills_Region, Active_War_Deaths_Region) %>% 
  mutate(Ratio = Kills/Deaths) %>% 
  mutate(reason = as.character(reason))

Region_Based_KDs_Active_War <- bind_rows(Active_War_KDs_Region, Active_War_KDs)

Region_Based_KDs_Active_War <-Region_Based_KDs_Active_War %>% 
  mutate(KD_Type = "Region")

rm(Active_War_KDs_Region)

Main_Active_War_Data_Set <- bind_rows(Region_Based_KDs_Active_War, Weapon_Based_KDs_Active_War )

rm(Weapon_Based_KDs_Active_War, Region_Based_KDs_Active_War)

Active_War_KDs <- Active_War_KDs %>% 
  mutate(KD_Type = "All")

Main_Active_War_Data_Set <- bind_rows(Main_Active_War_Data_Set, Active_War_KDs) %>% 
  rename(Reason = reason)

Table_War_Weapon_KD_Active_War <- Main_Active_War_Data_Set %>% 
  filter(KD_Type == "Weapon")

Table_War_All_KD_Active_War <- Main_Active_War_Data_Set %>% 
  filter(KD_Type == "All")

Table_War_All_KD_Region_War <- Main_Active_War_Data_Set %>% 
  filter(KD_Type == "Region")

Table_KD_List <- c("All Kill Death Ratios" = "Table_War_All_KD_Active_War",
                   "All Weapon Based Kill Death Ratios" = "Table_War_Weapon_KD_Active_War",
                   "All Region Based Kill Death Ratios" = "Table_War_All_KD_Region_War")