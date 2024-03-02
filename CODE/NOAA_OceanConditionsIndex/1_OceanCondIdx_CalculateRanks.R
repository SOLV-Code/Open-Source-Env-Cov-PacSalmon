# Calculate ranks, mean of ranks and mean of mean rank
# Doing alternative versions:
# - V1: all indicators
# - V2: Climate and Atmospheric Indicators only
# - v3: Local physical indicators only
# - V4: All Physical indicators
# - v5: Biological indicators only

# V1 is the one used in the official stoplight
# at https://www.fisheries.noaa.gov/west-coast/science-data/ocean-conditions-indicators-trends)


# TO DO
# - add the biol indicators to the extracted data set (but filter them before merging into overall dataset)
# - figure out directionality of ranking for each indicator (are they all the same?)

library(tidyverse)



oci.src <- read_csv("DATA/NOAA_OceanConditionsIndex/NOAAOceanCond_DATA.csv",comment = "#")

oci.src

# check ranking function
# this matches the values on the website graphic
# implies that lower value = better (lower values get higher ranks)
# how to handle ties? (especially in mean ranks?)
rank(oci.src$PDOSumDecToMarch)


names(oci.src)

# keep the rank calcs separate, in case want to invert order for some of them later
oci.out <- oci.src %>% mutate(Rank.PDOSumDecToMarch = rank(PDOSumDecToMarch),
															RankPDOSumMayToSep = rank(PDOSumMayToSep),
															Rank.ONIAvgJanToJun = rank(ONIAvgJanToJun)) %>%
											rowwise() %>%
											mutate(MeanRank.ClimateAtmos =mean(c(Rank.PDOSumDecToMarch,RankPDOSumMayToSep,Rank.ONIAvgJanToJun) ))

head(oci.out)



write_csv(oci.out,"DATA/NOAA_OceanConditionsIndex/NOAAOceanCond_DATAwithRanks.csv")
