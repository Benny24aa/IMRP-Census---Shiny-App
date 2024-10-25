player_quintles_death_ids <- IMRP_Full_Census_File_Cleaned %>% 
  select(killedId, killedName) %>% 
  group_by(killedId, killedName) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  select(-count) %>% 
  rename('Player ID' = killedId, 'Player Name' = killedName)

player_quintles_kills_ids <- IMRP_Full_Census_File_Cleaned %>% 
  select(killerId, killerName) %>% 
  group_by(killerId, killerName) %>%  
  summarise(count=n(), .groups = 'drop') %>% 
  select(-count) %>% 
  rename('Player ID' = killerId, 'Player Name' = killerName)

merged_quintles <- bind_rows(player_quintles_death_ids, player_quintles_kills_ids) %>% 
  unique() %>% 
  na.omit() %>% 
  arrange(merged_quintles$`Player ID`)


merged_quintles <- merged_quintles %>% 
  mutate(row_number = row_number())

quintle_test <- max(merged_quintles$row_number)/5

merged_quintles <- merged_quintles %>% 
  mutate(group_1 = row_number < quintle_test+1,
         group_2 = row_number < quintle_test*2+1,
         group_3 = row_number < quintle_test*3+1,
         group_4 = row_number < quintle_test*4+1,
         group_5 = row_number < quintle_test*5+1) %>% 
  mutate(quintle = case_when( group_1 == TRUE & group_2 == TRUE & group_3 == TRUE & group_4 == TRUE & group_5 == TRUE ~ "Group 1",
                              group_1 == FALSE & group_2 == TRUE & group_3 == TRUE & group_4 == TRUE & group_5 == TRUE ~ "Group 2", 
                              group_1 == FALSE & group_2 == FALSE & group_3 == TRUE & group_4 == TRUE & group_5 == TRUE ~ "Group 3",
                              group_1 == FALSE & group_2 == FALSE & group_3 == FALSE & group_4 == TRUE & group_5 == TRUE ~ "Group 4", 
                              group_1 == FALSE & group_2 == FALSE & group_3 == FALSE & group_4 == FALSE & group_5 == TRUE ~ "Group 5"  )
         )
                            
  