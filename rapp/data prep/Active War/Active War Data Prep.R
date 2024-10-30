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