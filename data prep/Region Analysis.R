##### Region Data



IMRP_Full_Census_File_Cleaned$x <- as.numeric(IMRP_Full_Census_File_Cleaned$x )
IMRP_Full_Census_File_Cleaned$y <- as.numeric(IMRP_Full_Census_File_Cleaned$y)

IMRP_Full_Census_File_Cleaned_Region <- IMRP_Full_Census_File_Cleaned %>% 
  mutate(Region = case_when(x > -2997.47 & x < -1231.91 & y > -1115.58 & y < 1659.69 ~ "San Fierro",
                            x > -2997.47 & x < - 480.539 & y > 1659.68 & y < 2993.87 ~ "Tierra Robada",
                            x > -1213.91 & x < -480.539 & y > 596.349 & y < 1659.58
                            ~ 'Tierra Robada',
                            x > -2997.47 & x < -1213.91 & y > -2892.97 & y < -1115.58
                            ~ 'Whetstone',
                            x > 44.6147 & x < 2997.06 & y > -2892.97 & y < -768.027
                            ~ 'Los Santos',
                            x > -1213.91 & x < 2997.06 & y > -768.027 & y < 596.349
                            ~ 'Red County',
                            x > -1213.91 & x <44.6147 & y > -2892.97 & y < -768.027
                            ~ 'Flint County',
                            x > -480.539 & x < 869.461 & y >596.349 & y < 2993.87
                            ~ 'Bone County',
                            x >869.461 & x <2997.096 & y > 596.349 & y <2993.87
                            ~ 'Las Venturas'
  )) %>% 
  mutate(Sub_Region = case_when(x > 44.6147 & x < 550 & y > -2892.97 & y < -768.027
                                ~ 'Los Santos City Far West',
                                x > 550 & x < 850 & y > -2892.97 & y < -768.027
                                ~ 'Los Santos City West',
                                x > 850 & x < 1300 & y > -2892.97 & y < -768.027
                                ~ 'Los Santos City Centre West',
                                x > 1300 & x < 1600 & y > -2892.97 & y < -768.027
                                ~ 'Los Santos City Centre',
                                x > 1600 & x < 1900 & y > -2892.97 & y < -768.027
                                ~ 'Los Santos City Centre East',
                                x > 1600 & x < 1900 & y > -2892.97 & y < -768.027
                                ~ 'Los Santos City Centre East',
                                x > 1900 & x < 2200 & y > -2892.97 & y < -768.027
                                ~ 'Los Santos City East',
                                x > 2200 & x < 2500 & y > -2892.97 & y < -768.027
                                ~ 'Los Santos City Far East',
                                x > 2500 & x < 2800 & y > -2892.97 & y < -768.027
                                ~ 'Los Santos City Global Authority Region',
                                x > 2800 & x < 2997.06 & y > -2892.97 & y < -768.027
                                ~ 'Los Santos East Beach Shore',
                                x > -1213.91 & x < -400 & y > -76.027 & y < 596.349
                                ~ 'Far West Red County',
                                x > -400 & x < 400 & y > -768.027 & y < 596.349
                                ~ 'West Red County',
                                x > 400 & x <1200 & y > -768.027 & y < 596.349
                                ~ 'Red County Centre',
                                x >1200 & x < 2000 & y > -768.027 & y < 596.349
                                ~ 'Red County East',
                                x > 2000 & x < 2997.06 & y > -768.027 & y < 596.349
                                ~ 'Far East Red County',
                                x > -1213.91 & x <44.6147 & y > -1800 & y < -768.027
                                ~ 'North Flint County',
                                x > -1213.91 & x <44.6147 & y > -2892.97 & y < -1800
                                ~ 'South Flint County',
                                x > -2997.47 & x < -1213.91 & y > -2892.97 & y < -1115.58
                                ~ 'Whetstone',
                                x > -2997.47 & x < -1213.91 & y > -1115.58 & y < 300
                                ~ 'South San Fierro',
                                x > -2997.47 & x < -1213.91 & y > 300 & y < 1659.68
                                ~ 'North San Fierro',
                                x > -2997.47 & x < -480.539 & y > 1659.68 & y < 2993.87
                                ~ 'Tierra Robada North',
                                x > -1213.91 & x < -480.539 & y > 596.349 & y < 1659.58
                                ~ 'Tierra Robada South',
                                x > -480.539 & x < 869.461 & y >1800 & y < 2993.87
                                ~ 'North Bone County',
                                x > -480.539 & x < 869.461 & y >596.349 & y < 1800
                                ~ 'South Bone County',
                                x >869.461 & x <1297 & y > 596.349 & y <2993.87
                                ~ 'Far West Las Venturas',
                                x >1297 & x <1697 & y > 596.349 & y <2993.87
                                ~ 'West Las Venturas',
                                x >1697 & x <2097 & y > 596.349 & y <2993.87
                                ~ 'Central Las Venturas',
                                x >2097 & x <2497 & y > 596.349 & y <2993.87
                                ~ 'East Las Venturas',
                                x >2497 & x <2997 & y > 596.349 & y <2993.87
                                ~ 'Far East Las Venturas'
  )) %>% 
  mutate(Data_Zone = case_when( x > -1213.91 & x < -400 & y > -768.027 & y < -85
                                ~ 'Far West South Red County',
                                x > -400 & x < 400 & y > -768.027 & y < -85
                                ~ 'West South Red County',
                                x > 400 & x <1200 & y > -768.027 & y < -85
                                ~ 'Red County South Centre',
                                x >1200 & x < 2000 & y > -768.027 & y < -85
                                ~ 'Red County South East',
                                x > 2000 & x < 2997.06 & y > -768.027 & y < -85
                                ~ 'Far South East Red County',
                                x > -1213.91 & x < -400 & y > -85 & y < 596.349
                                ~ 'Far West North Red County',
                                x > -400 & x < 400 & y > -85 & y < 596.349
                                ~ 'West North Red County',
                                x > 400 & x <1200 & y > -85 & y < 596.349
                                ~ 'Red County North Centre',
                                x >1200 & x < 2000 & y > -85 & y < 596.349
                                ~ 'Red County North East',
                                x > 2000 & x < 2997.06 & y > -85 & y < 596.349
                                ~ 'Far North East Red County',
                                x > 2323.6 & x<2500 & y >  -2740.7 & y <  -2366.77
                                ~ 'SASF HQ Los Santos',
                                x > 1906.8 & x < 2323.6 & y <  -2501.5 & y >  -2808.4
                                ~ 'Trucker Run Location',
                                x > 2230.06 & x <2500 & y >  -2150 & y <  -1990.2495
                                ~ 'South Willowfield',
                                x > 2230.06 & x <2500 & y >  -1990.24925 & y <  -1830.4985
                                ~ 'North Willowfield',
                                x > 2230.06 & x <2500 & y > -2366.77 & y < -2150
                                ~ 'Bin Lorry Area',
                                x > 1900.3 & x < 2323.6 & y > -2501.5 & y < -2150
                                ~ 'Tow Truck Area & Airport',
                                x > 1900 & x < 2323.6 & y > -2150 & y< -1990.24925 
                                ~ 'El Corona East',
                                x > 1900 & x < 2323.6 & y< -1830.4985  & y> -1990.24925 
                                ~ 'Pizza Hut Area Idlwood',
                                x >  -1213.91 & x <44.6147 & y >  -1800 & y <  -768.027
                                ~ 'North Flint County',
                                x >  -1213.91 & x <44.6147 & y >  -2892.97 & y <  -1800
                                ~ 'South Flint County',
                                x >  -2997.47 & x <  -1213.91 & y >  -2892.97 & y <  -2150
                                ~ 'Whetstone & Outer Town',
                                x >  -2997.47 & x <  -1213.91 & y >  -2892.97 & y <  -1115.58
                                ~ 'Mount Chillad & Nearby',
                                x >  -2997.47 & x <  -2100 & y >  -1115.58 & y < 300
                                ~ 'South West San Fierro',
                                x >  -2100 & x <  -1213.91 & y >  -1115.58 & y < 300
                                ~ 'South East San Fierro',
                                x >  -2997.47 & x <  -2100 & y > 300 & y < 1659.68
                                ~ 'North West San Fierro',
                                x >  -2100 & x <  -1213.91  & y > 300 & y < 1659.68
                                ~ 'North East San Fierro',
                                x >  -2997.47 & x <  - 480.539 & y > 1659.68 & y < 2993.87
                                ~ 'Tierra Robada North',
                                x >  -1213.91 & x < -480.539 & y > 596.349 & y < 1659.58
                                ~ 'Tierra Robada South',
                                x >  -480.539 & x < 250 & y >1800 & y < 2993.87
                                ~ 'North West Bone County',
                                x > 250  & x < 869.461 & y >596.349 & y < 1800
                                ~ 'South East Bone County',
                                x >  250  & x < 869.461  & y >1800 & y < 2993.87
                                ~ 'North East Bone County',
                                x > -480.539 & x < 250 & y >596.349 & y < 1800
                                ~ 'South West Bone County',
                                x >869.461 & x <1297 & y > 1500 & y <2993.87
                                ~ 'North Far East Las Venturas',
                                x >1297 & x <1697 & y > 1500 & y <2993.87
                                ~ 'North East Las Venturas',
                                x >1697 & x <2097 & y > 1500 & y <2993.87
                                ~ 'North Central Las Venturas',
                                x >2097 & x <2497 & y > 1500 & y <2993.87
                                ~ 'North West Las Venturas',
                                x >2497 & x <2997 & y > 1500 & y <2993.87
                                ~ 'North Far West Las Venturas',
                                x >869.461 & x <1297 & y > 596.349 & y <1500 
                                ~ 'South Far East Las Venturas',
                                x >1297 & x <1697 & y > 596.349  & y <1500 
                                ~ 'South East Las Venturas',
                                x >1697 & x <2097 & y > 596.349 & y <1500 
                                ~ 'South Central Las Venturas',
                                x >2097 & x <2497 & y > 596.349  & y <1500 
                                ~ 'South West Las Venturas',
                                x >2497 & x <2997 & y > 596.349  & y <1500 
                                ~ 'South Far West Las Venturas'))



IF  x > 850 & x < 1300 & y > -2892.97 & y < -1830.4985
then "East Verona Beach & Verdant Bluffs"
 x > 1300 & x < 1600 & y > -2892.97 & y < -1830.4985
then 'East Verdant Bluffs, Los Santos Airport & El Corona'
 x > 1600 & x < 1900 & y > -2892.97 & y < -1830.4985
then 'East Verdant Bluffs, Los Santos Airport & El Corona'
 x > 1600 & x < 1900 & y > -2892.97 & y < -1830.4985
then "East Verdant Bluffs, Los Santos Airport & El Corona"
 x > 2500 & x < 2800 & y > -2892.97 & y < -1830.4985
then 'Playa Del Seville & Ocean Docks'
 x > 2800 & x < 2997.06 & y > -2892.97 & y < -1830.4985
then 'Playa Del Seville & Ocean Docks'
 x > 44.6147 & x < 550 & y > -2892.97 & y < -768.027
then 'Richman, Rodeo, & Santa Maria Beach'
 x > 550 & x < 850 & y > -2892.97 & y < -768.027
then 'Verona Beach, West Market, Vinewood, & West Mullholl&'
 x > 850 & x < 1300 & y > -1830.4985 & y < -768.027
then 'Market & Temple'
 x > 1300 & x < 1600 & y > -1830.4985 & y < -768.027
then 'Market Far East, Commerce, & Downtown Los Santos'
 x > 1600 & x < 1900 & y > -1830.4985 & y < -768.027
then 'Mulholl& Intersection & West Glen Park'
 x > 1600 & x < 1900 & y > -1830.4985 & y < -768.027
then 'Mulholl& Intersection & West Glen Park'
 x > 1900 & x < 2200 & y > -1830.4985 & y < -768.027
then "Idlewood & Glen Park"
 x > 2200 & x < 2500 & y > -1830.4985 & y < -768.027
then 'Jefferson, West Las Colinas & East Idlewood'
 x > 2500 & x < 2800 & y > -1830.4985 & y < -768.027
then "East Los Santos & Ganton"
 x > 2800 & x < 2997.06 & y > -1830.4985 & y < -768.027
then "East Beach"

