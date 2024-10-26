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
  ))



