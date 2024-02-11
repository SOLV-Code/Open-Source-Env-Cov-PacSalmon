# Script to process the source data in
# https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast
# and replicate the covariate time series.


library(tidyverse)

#--------------------------------------------
# PDO Index Series
#--------------------------------------------


# get source data
pdo.src <- read.csv("DATA/DFO_FraserSockeyeForecast/PDOIdxSource_Data.csv",
									comment.char = "#" , header=TRUE,
									stringsAsFactors = FALSE, blank.lines.skip=TRUE)
head(pdo.src)


pdo.long <- pdo.src %>% pivot_longer(Jan:Dec,names_to = "Month") %>%
							dplyr::filter(Month %in% c("Nov","Dec","Jan","Feb","Mar"))  # keep only the month used for mean

# assign Jan-Mar to previous year ("winter of Year-1")
adj.yr.idx <- pdo.long$Month %in% c("Jan","Feb","Mar")
pdo.long$Year[adj.yr.idx] <- pdo.long$Year[adj.yr.idx] -1

pdo.winter.mean <- pdo.long %>% dplyr::filter(Year >=1900) %>% # remove partial data for first winter
										group_by(Year) %>% summarize(PDOMeanNovToMar = mean(value))
pdo.winter.mean

# https://stackoverflow.com/questions/72304594/added-commented-section-to-output-csv-with-write-csv


