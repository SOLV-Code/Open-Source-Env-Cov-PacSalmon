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




#-------------------------------------------------------
# Lightstation Sea Surface Temperature and Salinity
#-------------------------------------------------------


# Need to dynamically create the file list, because the extracted csv files
# have various year ranges in the filenames, and

lightstation.files.list <- list.files("DATA/DFO_FraserSockeyeForecast/RawFiles",
																			pattern = "_-_Average_Monthly",
																			full.names = TRUE)
lightstation.files.list



entrance.island.sst.idx <- grepl("Entrance_Island",lightstation.files.list) & grepl("Temperatures",lightstation.files.list)
entrance.island.sst.src <- read.csv(lightstation.files.list[entrance.island.sst.idx],
																		comment.char = "#" ,
																		skip = 1, # skip the first line text (need this, because doesn't have a "#" to mark comment)
																		header=TRUE,
																		stringsAsFactors = FALSE,
																		blank.lines.skip=TRUE) #%>%
#na_if(999.99) # why not working?

entrance.island.sst.src[entrance.island.sst.src == 999.99] <- NA

head(entrance.island.sst.src)

entrance.island.sst.long  <- entrance.island.sst.src %>%
	pivot_longer(JAN:DEC,names_to = "Month",values_to = "EntrIslSSTMeanAprToJun") %>%
	dplyr::filter(Month %in% c("APR","MAY","JUN"))  # keep only the month used for mean

entrance.island.sst.long



pine.island.sst.idx <- grepl("Pine_Island",lightstation.files.list) & grepl("Temperatures",lightstation.files.list)
pine.island.sst.src <- read.csv(lightstation.files.list[pine.island.sst.idx],
																comment.char = "#" ,
																skip = 1, # skip the first line text (need this, because doesn't have a "#" to mark comment)
																header=TRUE,
																stringsAsFactors = FALSE,
																blank.lines.skip=TRUE) #%>%
#na_if(999.99) # why not working?

pine.island.sst.src[pine.island.sst.src == 999.99] <- NA

head(pine.island.sst.src)

pine.island.sst.long  <- pine.island.sst.src %>%
	pivot_longer(JAN:DEC,names_to = "Month",values_to = "PineIslSSTMeanAprToJun") %>%
	dplyr::filter(Month %in% c("APR","MAY","JUN"))  # keep only the month used for mean

pine.island.sst.long



dep.bay.sst.idx <- grepl("Departure_Bay",lightstation.files.list) & grepl("Temperatures",lightstation.files.list)
dep.bay.sst.src <- read.csv(lightstation.files.list[dep.bay.sst.idx],
																comment.char = "#" ,
																skip = 1, # skip the first line text (need this, because doesn't have a "#" to mark comment)
																header=TRUE,
																stringsAsFactors = FALSE,
																blank.lines.skip=TRUE) #%>%
#na_if(999.99) # why not working?

dep.bay.sst.src[dep.bay.sst.src == 999.99] <- NA

head(dep.bay.sst.src)

dep.bay.sst.long  <- dep.bay.sst.src %>%
	pivot_longer(JAN:DEC,names_to = "Month",values_to = "DeptBaySSTMeanAprToJun") %>%
	dplyr::filter(Month %in% c("APR","MAY","JUN"))  # keep only the month used for mean

dep.bay.sst.long


