##### Region Data

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
                            ))


