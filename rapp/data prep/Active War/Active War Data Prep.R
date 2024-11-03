##### Data set for Full KD

Table_KD_List <- c("All Kill Death Ratios" = "Table_War_All_KD_Active_War",
                   "All Weapon Based Kill Death Ratios" = "Table_War_Weapon_KD_Active_War",
                   "All Region Based Kill Death Ratios" = "Table_War_All_KD_Region_War",
                   "Region Deaths and Kills for DeLeon" = "Active_War_Region_NonPlayer_Full_Join_DeLeon",
                   "Region Deaths and Kills for Navarro" = "Active_War_Region_NonPlayer_Full_Join_Navarro",
                   "Kill to Damage Ratios" = "war_44_damage",
                   "Suicides" = "war_44_suicides")

Active_War <- IMRP_Full_Census_File_Cleaned %>% 
  filter(War_ID == "War 44") %>% 
  mutate(killerFactionId = gsub('16', 'DeLeon', killerFactionId), killerFactionId = gsub('14', 'Navarro', killerFactionId),
         killerFactionId = gsub('0', 'Suicide', killerFactionId), killedFactionId = gsub('16', 'DeLeon', killedFactionId), killedFactionId = gsub('14', 'Navarro', killedFactionId))

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
  filter(KD_Type == "Weapon") %>% 
  filter(Reason != "All") %>% 
  select(-KD_Type, -War_ID, -killerId)

Table_War_All_KD_Active_War <- Main_Active_War_Data_Set %>% 
  filter(KD_Type == "All") %>% 
  select(-KD_Type, -War_ID, -killerId)

Table_War_All_KD_Region_War <- Main_Active_War_Data_Set %>% 
  filter(KD_Type == "Region") %>% 
  filter(Reason != "All") %>% 
  select(-KD_Type, -War_ID, -killerId)



############################################################################################################

# Location Leaderboards Section

############################################################################################################

Active_War_kills_Region_NonPlayer <- Active_War %>% 
  mutate(Team_Kill = if_else(killedFactionId == killerFactionId, "Team Kill", "Not")) %>% 
  filter(Team_Kill != "Team Kill") %>% 
  group_by(killerFactionId, Region) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename(Kills = count, Faction = killerFactionId)

Active_War_Deaths_Region_NonPlayer <- Active_War %>% 
  group_by(killedFactionId, Region) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename(Deaths = count, Faction = killedFactionId)


Active_War_Region_NonPlayer_Full_Join <- full_join(Active_War_Deaths_Region_NonPlayer, Active_War_kills_Region_NonPlayer, by =c("Faction", "Region")) %>% 
  filter(Faction != "Suicide")

Active_War_Region_NonPlayer_Full_Join$Region <- Active_War_Region_NonPlayer_Full_Join$Region %>% replace_na("The Sea") 

Active_War_Region_NonPlayer_Full_Join_DeLeon <- Active_War_Region_NonPlayer_Full_Join %>% 
  filter(Faction == "DeLeon")%>% 
  mutate(Ratio = Kills/Deaths)

Active_War_Region_NonPlayer_Full_Join_Navarro <- Active_War_Region_NonPlayer_Full_Join %>% 
  filter(Faction == "Navarro")%>% 
  mutate(Ratio = Kills/Deaths)

war_id_44_player_lookup <- Active_War %>% 
  select(killerId, killerName) %>% 
  rename(idPlayer = killerId) %>% 
  group_by(idPlayer, killerName) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  select(-count)

war_id_44_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=44"
war_44 <- fromJSON(war_id_44_api_feed)
war_44_damage <- war_44$damage %>% 
  mutate(War_ID = "War 44")

war_44_damage <- full_join(war_id_44_player_lookup, war_44_damage, by = "idPlayer") %>% 
  select(-idPlayer)

war_44_damage <- war_44_damage %>% 
  select(killerName, total_damage) %>% 
  group_by(killerName) %>% 
  summarise(total_damage = sum(total_damage), .groups = 'drop') %>% 
  rename('Player Name' = killerName)

war_44_damage <- full_join(Active_War_kills, war_44_damage, by = "Player Name") %>% 
  select(-killerId) %>% 
  mutate(Damage_Kill_Ratio = total_damage / Kills) %>% 
  rename('Total Damage' = total_damage)

war_44_suicides <- Active_War %>% 
  filter(killerFactionId == "Suicide") %>% 
  select(killedName) %>% 
  group_by(killedName) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename(Suicides = count)
  
rm(Active_War_Deaths_reason, Active_War_Deaths_Region, Active_War_Deaths_Region_NonPlayer,
   Active_War_KDs, Active_War_kills, Active_War_kills_reason, Active_War_kills_Region, Active_War_kills_Region_NonPlayer, Active_War_Region_NonPlayer_Full_Join)
rm(war_44 ) 

#######################################################################################################################################

# Preparing for graphical analysis

#######################################################################################################################################

Active_War_Deaths <- Active_War %>% 
  group_by(killedName, War_ID) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename('Player Name' = killedName, Deaths = count)
  
Active_War_Death_Graph_Prep <- Active_War %>% 
  select(killedName, date_killed) %>% 
  mutate(date_killed = gsub("T", " ", date_killed), date_killed = gsub("Z", '', date_killed)) %>% 
  mutate(date_killed = gsub(" .*","", date_killed))

Active_War_Death_Graph_Prep$date_killed <- as.Date(Active_War_Death_Graph_Prep$date_killed)

Active_War_Death_Graph_Prep <- Active_War_Death_Graph_Prep %>% 
  group_by(killedName, date_killed) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  rename( Deaths = count)

Active_War_Deaths <- Active_War_Deaths %>% 
  rename(total_deaths = Deaths) %>% 
  rename(killedName = 'Player Name')

Active_War_Death_Graph_Prep <- full_join(Active_War_Deaths, Active_War_Death_Graph_Prep, by = "killedName") 

Active_War_Death_Graph_Prep$Deaths <- as.numeric(Active_War_Death_Graph_Prep$Deaths)
Active_War_Death_Graph_Prep$total_deaths <- as.numeric(Active_War_Death_Graph_Prep$total_deaths)

Active_War_Death_Graph_Prep <- Active_War_Death_Graph_Prep %>% 
  mutate(Percent_Total_Kills = Deaths / total_deaths) %>% 
  mutate(Percent_Total_Kills = Percent_Total_Kills * 100) %>% 
  select(-total_deaths)

Active_War_Total_Deaths <- Active_War %>% 
  select(killedName) %>% 
  group_by(killedName) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  mutate(All = "All") %>% 
  select(-killedName) 

Active_War_Total_Deaths$count <- as.numeric(Active_War_Total_Deaths$count)

Active_War_Total_Deaths <- Active_War_Total_Deaths %>% 
  group_by(All) %>% 
  summarise(total_deaths = sum(count), .groups = 'drop')

Active_War_Death_Graph_Prep <- Active_War_Death_Graph_Prep %>% 
  mutate(All = "All") 
  
Active_War_Death_Graph_Prep <- full_join(Active_War_Death_Graph_Prep, Active_War_Total_Deaths, by = "All") 

Active_War_Death_Graph_Prep <- Active_War_Death_Graph_Prep %>% 
  mutate(War_Wide_Total_Percentage = Deaths/total_deaths) %>% 
  mutate(War_Wide_Total_Percentage = War_Wide_Total_Percentage * 100) %>% 
  select(-total_deaths)

Total_Deaths_All_Wars <- IMRP_Full_Census_File_Cleaned %>% 
select(killedName) %>% 
  group_by(killedName) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  mutate(All = "All") %>% 
  select(-killedName) 

Total_Deaths_All_Wars$count <- as.numeric(Total_Deaths_All_Wars$count)

Total_Deaths_All_Wars <- Total_Deaths_All_Wars %>% 
  group_by(All) %>% 
  summarise(total_deaths = sum(count), .groups = 'drop')

Active_War_Death_Graph_Prep <- full_join(Active_War_Death_Graph_Prep, Total_Deaths_All_Wars, by = "All") 

Active_War_Death_Graph_Prep <- Active_War_Death_Graph_Prep %>% 
  mutate(All_Wars_Total_Percentage = Deaths/total_deaths) %>% 
  mutate(All_Wars_Total_Percentage = All_Wars_Total_Percentage * 100) %>% 
  select(-total_deaths) 

###########################################################################################################

### Faciton vs Faction graphs #############################################################################

###########################################################################################################


Active_War_Factions_Deaths <- Active_War %>% 
  select(killedFactionId, date_killed) %>% 
  mutate(date_killed = gsub("T", " ", date_killed), date_killed = gsub("Z", '', date_killed)) %>% 
  mutate(date_killed = gsub(" .*","", date_killed))

Active_War_Factions_Deaths$date_killed <- as.Date(Active_War_Factions_Deaths$date_killed)

Active_War_Factions_Deaths <- Active_War_Factions_Deaths %>% 
  group_by(killedFactionId, date_killed) %>% 
  summarise(count=n(), .groups = 'drop')

Active_War_Factions_Deaths_Cum <- Active_War_Factions_Deaths %>% 
  group_by(killedFactionId) %>% 
  mutate(csum = cumsum(count))

Active_War_Playtime_Api <- "https://launcher-api.sa-mp.im/api/v1/misc/war-playtime?war_id=44"
Active_War_Playtime  <- fromJSON(Active_War_Playtime_Api)
Active_War_Playtime <- Active_War_Playtime$data
Active_War_Playtime <- Active_War_Playtime$info

Active_War_Playtime <- bind_rows(Active_War_Playtime)

Active_War_Playtime <- Active_War_Playtime %>% 
  mutate(date = gsub("T", " ", date), date = gsub("Z", '', date)) %>% 
  mutate(date = gsub(" .*","", date))

Active_War_Playtime$date <- as.Date(Active_War_Playtime$date) + 1
Active_War_Playtime$hours_online <- as.numeric(Active_War_Playtime$hours_online)

