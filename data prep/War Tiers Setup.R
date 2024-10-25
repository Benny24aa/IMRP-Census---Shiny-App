Sniper_List_Killer <- IMRP_Full_Census_File %>% 
  select(killerName, killerId, War_ID, reason) %>% 
  filter(reason == "34") %>% 
  select(-reason) %>% 
  group_by(killerName, War_ID) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  select(-count) %>% 
  filter(killerName != is.na(killerName))
 

Sniper_List_Death <- IMRP_Full_Census_File %>% 
  select(killerName, killerId, War_ID, reason) %>% 
  filter(reason == "34") %>% 
  select(-reason) %>% 
  rename(KilledName = killerName) %>% 
group_by(KilledName, War_ID) %>% 
  summarise(count=n(), .groups = 'drop') %>% 
  select(-count)%>% 
  filter(KilledName != is.na(KilledName))