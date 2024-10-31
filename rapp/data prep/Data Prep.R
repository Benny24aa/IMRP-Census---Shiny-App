#### Loading in Data for every single war using API Feeds

library(jsonlite)
library(dplyr)
library(tidyr)
library(DT)
library(shiny)
library(DT)
library(data.table)
library(ggplot2)
library(shinydashboard)
library(readr)
library(dplyr)
library("readxl")
library("RColorBrewer")
library(rsconnect)
library(base)
library(datasets)
library(graphics)
library(grDevices)
library(methods)
library(readr)
library(readxl)
library(RColorBrewer)
library(stats)
library(utils)
library(sf)
library(writexl)
library(base64enc)
library(phsopendata)
library(plotly)
library(crosstalk)
library(lubridate)
library(kableExtra)
library(tidyverse)
####### War ID 1
war_id_1_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=1"
war_1 <- fromJSON(war_id_1_api_feed)
war_1_done <- war_1$kills %>% 
  mutate(War_ID = "War 1")

####### War ID 2
war_id_2_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=2"
war_2 <- fromJSON(war_id_2_api_feed)
war_2_done <- war_2$kills %>% 
  mutate(War_ID = "War 2")

####### War ID 4
war_id_4_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=4"
war_4 <- fromJSON(war_id_4_api_feed)
war_4_done <- war_4$kills %>% 
  mutate(War_ID = "War 4")


####### War ID 5
war_id_5_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=5"
war_5 <- fromJSON(war_id_5_api_feed)
war_5_done <- war_5$kills %>% 
  mutate(War_ID = "War 5")


####### War ID 6
war_id_6_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=6"
war_6 <- fromJSON(war_id_6_api_feed)
war_6_done <- war_6$kills %>% 
  mutate(War_ID = "War 6")

####### War ID 7
war_id_7_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=7"
war_7 <- fromJSON(war_id_7_api_feed)
war_7_done <- war_7$kills %>% 
  mutate(War_ID = "War 7")

####### War ID 8
war_id_8_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=8"
war_8 <- fromJSON(war_id_8_api_feed)
war_8_done <- war_8$kills %>% 
  mutate(War_ID = "War 8")

####### War ID 9
war_id_9_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=9"
war_9 <- fromJSON(war_id_9_api_feed)
war_9_done <- war_9$kills %>% 
  mutate(War_ID = "War 9")

####### War ID 10
war_id_10_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=10"
war_10 <- fromJSON(war_id_10_api_feed)
war_10_done <- war_10$kills %>% 
  mutate(War_ID = "War 10")

####### War ID 11
war_id_11_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=11"
war_11 <- fromJSON(war_id_11_api_feed)
war_11_done <- war_11$kills %>% 
  mutate(War_ID = "War 11")

####### War ID 12
war_id_12_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=12"
war_12 <- fromJSON(war_id_12_api_feed)
war_12_done <- war_12$kills %>% 
  mutate(War_ID = "War 12")

####### War ID 13
war_id_13_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=13"
war_13 <- fromJSON(war_id_13_api_feed)
war_13_done <- war_13$kills %>% 
  mutate(War_ID = "War 13")

####### War ID 14
war_id_14_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=14"
war_14 <- fromJSON(war_id_14_api_feed)
war_14_done <- war_14$kills %>% 
  mutate(War_ID = "War 14")

####### War ID 15
war_id_15_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=15"
war_15 <- fromJSON(war_id_15_api_feed)
war_15_done <- war_15$kills %>% 
  mutate(War_ID = "War 15")

####### War ID 16
war_id_16_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=16"
war_16 <- fromJSON(war_id_16_api_feed)
war_16_done <- war_16$kills %>% 
  mutate(War_ID = "War 16")

####### War ID 17
war_id_17_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=17"
war_17 <- fromJSON(war_id_17_api_feed)
war_17_done <- war_17$kills %>% 
  mutate(War_ID = "War 17")

####### War ID 18
war_id_18_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=18"
war_18 <- fromJSON(war_id_18_api_feed)
war_18_done <- war_18$kills %>% 
  mutate(War_ID = "War 18")

####### War ID 19
war_id_19_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=19"
war_19 <- fromJSON(war_id_19_api_feed)
war_19_done <- war_19$kills %>% 
  mutate(War_ID = "War 19")
####### War ID 20
war_id_20_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=20"
war_20 <- fromJSON(war_id_20_api_feed)
war_20_done <- war_20$kills %>% 
  mutate(War_ID = "War 20")

####### War ID 21
war_id_21_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=21"
war_21 <- fromJSON(war_id_21_api_feed)
war_21_done <- war_21$kills %>% 
  mutate(War_ID = "War 21")

####### War ID 22
war_id_22_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=22"
war_22 <- fromJSON(war_id_22_api_feed)
war_22_done <- war_22$kills %>% 
  mutate(War_ID = "War 22")

####### War ID 23
war_id_23_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=23"
war_23 <- fromJSON(war_id_23_api_feed)
war_23_done <- war_23$kills %>% 
  mutate(War_ID = "War 23")

####### War ID 24
war_id_24_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=24"
war_24 <- fromJSON(war_id_24_api_feed)
war_24_done <- war_24$kills %>% 
  mutate(War_ID = "War 24")

####### War ID 25
war_id_25_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=25"
war_25 <- fromJSON(war_id_25_api_feed)
war_25_done <- war_25$kills %>% 
  mutate(War_ID = "War 25")

####### War ID 26
war_id_26_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=26"
war_26 <- fromJSON(war_id_26_api_feed)
war_26_done <- war_26$kills %>% 
  mutate(War_ID = "War 26")

####### War ID 27
war_id_27_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=27"
war_27 <- fromJSON(war_id_27_api_feed)
war_27_done <- war_27$kills %>% 
  mutate(War_ID = "War 27")

####### War ID 28
war_id_28_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=28"
war_28 <- fromJSON(war_id_28_api_feed)
war_28_done <- war_28$kills %>% 
  mutate(War_ID = "War 29")

####### War ID 29
war_id_29_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=29"
war_29 <- fromJSON(war_id_29_api_feed)
war_29_done <- war_29$kills %>% 
  mutate(War_ID = "War 30")

####### War ID 30
war_id_30_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=30"
war_30 <- fromJSON(war_id_30_api_feed)
war_30_done <- war_30$kills %>% 
  mutate(War_ID = "War 31")

####### War ID 31
war_id_31_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=31"
war_31 <- fromJSON(war_id_31_api_feed)
war_31_done <- war_31$kills %>% 
  mutate(War_ID = "War 31")

####### War ID 32
war_id_32_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=32"
war_32 <- fromJSON(war_id_32_api_feed)
war_32_done <- war_32$kills %>% 
  mutate(War_ID = "War 32")

####### War ID 33
war_id_33_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=33"
war_33 <- fromJSON(war_id_33_api_feed)
war_33_done <- war_33$kills %>% 
  mutate(War_ID = "War 33")

####### War ID 34
war_id_34_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=34"
war_34 <- fromJSON(war_id_34_api_feed)
war_34_done <- war_34$kills %>% 
  mutate(War_ID = "War 34")

####### War ID 35
war_id_35_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=35"
war_35 <- fromJSON(war_id_35_api_feed)
war_35_done <- war_35$kills %>% 
  mutate(War_ID = "War 35")

####### War ID 36
war_id_36_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=36"
war_36 <- fromJSON(war_id_36_api_feed)
war_36_done <- war_36$kills %>% 
  mutate(War_ID = "War 36")

####### War ID 37
war_id_37_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=37"
war_37 <- fromJSON(war_id_37_api_feed)
war_37_done <- war_37$kills %>% 
  mutate(War_ID = "War 37")

####### War ID 38
war_id_38_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=38"
war_38 <- fromJSON(war_id_38_api_feed)
war_38_done <- war_38$kills %>% 
  mutate(War_ID = "War 38")

####### War ID 39
war_id_39_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=39"
war_39 <- fromJSON(war_id_39_api_feed)
war_39_done <- war_39$kills %>% 
  mutate(War_ID = "War 39")

####### War ID 40
war_id_40_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=40"
war_40 <- fromJSON(war_id_40_api_feed)
war_40_done <- war_40$kills %>% 
  mutate(War_ID = "War 40")

####### War ID 41
war_id_41_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=41"
war_41 <- fromJSON(war_id_41_api_feed)
war_41_done <- war_41$kills %>% 
  mutate(War_ID = "War 41")

####### War ID 42
war_id_42_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=42"
war_42 <- fromJSON(war_id_42_api_feed)
war_42_done <- war_42$kills %>% 
  mutate(War_ID = "War 42")

####### War ID 43
war_id_43_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=43"
war_43 <- fromJSON(war_id_43_api_feed)
war_43_done <- war_43$kills %>% 
  mutate(War_ID = "War 43")

war_id_44_api_feed <- "https://launcher-api.sa-mp.im/api/v1/misc/war-export?war_id=44"
war_44 <- fromJSON(war_id_44_api_feed)
war_44_done <- war_44$kills %>% 
  mutate(War_ID = "War 44")

rm(war_1,war_2, war_4, war_5, war_6, war_7,
   war_8, war_9, war_10, war_11, war_12, war_13,
   war_14, war_15, war_16, war_17, war_18,
   war_19, war_20, war_21, war_22, war_23, 
   war_24, war_25, war_26, war_27, war_28, 
   war_29, war_30, war_31, war_32, war_33, 
   war_34, war_35, war_36, war_37, war_38,
   war_39, war_40, war_41, war_42, war_43, war_44)

IMRP_Full_Census_File <- bind_rows(war_1_done,war_2_done, war_4_done, war_5_done, war_6_done, war_7_done,
                                   war_8_done, war_9_done, war_10_done, war_11_done, war_12_done, war_13_done,
                                   war_14_done, war_15_done, war_16_done, war_17_done, war_18_done,
                                   war_19_done, war_20_done, war_21_done, war_22_done, war_23_done, 
                                   war_24_done, war_25_done, war_26_done, war_27_done, war_28_done, 
                                   war_29_done, war_30_done, war_31_done, war_32_done, war_33_done, 
                                   war_34_done, war_35_done, war_36_done, war_37_done, war_38_done,
                                   war_39_done, war_40_done, war_41_done, war_42_done, war_43_done, war_44_done)

rm(war_1_done,war_2_done, war_4_done, war_5_done, war_6_done, war_7_done,
   war_8_done, war_9_done, war_10_done, war_11_done, war_12_done, war_13_done,
   war_14_done, war_15_done, war_16_done, war_17_done, war_18_done,
   war_19_done, war_20_done, war_21_done, war_22_done, war_23_done, 
   war_24_done, war_25_done, war_26_done, war_27_done, war_28_done, 
   war_29_done, war_30_done, war_31_done, war_32_done, war_33_done, 
   war_34_done, war_35_done, war_36_done, war_37_done, war_38_done,
   war_39_done, war_40_done, war_41_done, war_42_done, war_43_done, war_44_done)