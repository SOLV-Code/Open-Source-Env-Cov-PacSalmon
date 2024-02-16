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

pdo.src[pdo.src == -9.9] <- NA

head(pdo.src)


# assign Nov-Dec to next year ("winter of Year-1")

pdo.reorg.out <- pdo.src %>% select(Year, Oct,Nov,Dec) %>% mutate(Year = Year+1) %>%
		full_join(pdo.src %>% select(Year, Jan, Feb, Mar), by="Year") %>% arrange(Year) %>%
		rowwise() %>%
		mutate(PDOMeanOctToMar = mean(c(Oct,Nov,Dec,Jan,Feb,Mar),na.rm=TRUE),
					 PDOSumOctToMar = sum(c(Oct,Nov,Dec,Jan,Feb,Mar),na.rm=TRUE),
					 PDOMeanNovToMar = mean(c(Nov,Dec,Jan,Feb,Mar),na.rm=TRUE),
					 PDOSumNovToMar = sum(c(Nov,Dec,Jan,Feb,Mar),na.rm=TRUE),
					 PDOMeanDecToMar = mean(c(Jan,Feb,Mar),na.rm=TRUE),
					 PDOSumDecToMar = sum(c(Jan,Feb,Mar),na.rm=TRUE)
					 )

pdo.reorg.out

write_csv(pdo.reorg.out,"OUTPUT/PDO_Comparisons/PDO_Comparisons_Data.csv")


#-------------------------------------------------------
# Lightstation Sea Surface Temperature
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
	pivot_longer(JAN:DEC,names_to = "Month",values_to = "EntrIslSST") %>%
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
	pivot_longer(JAN:DEC,names_to = "Month",values_to = "PineIslSST") %>%
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
	pivot_longer(JAN:DEC,names_to = "Month",values_to = "DeptBaySST") %>%
	dplyr::filter(Month %in% c("APR","MAY","JUN"))  # keep only the month used for mean

dep.bay.sst.long

sst.merged.long <- entrance.island.sst.long %>%
									 full_join(pine.island.sst.long,by=c("YEAR","Month")) %>%
									 full_join(dep.bay.sst.long,by=c("YEAR","Month")) %>%
									# fill in missing Entrance Island records from Dept Bay records (as per pg6 of 2021 forecast report)
	                mutate(EntrIslSST = coalesce(EntrIslSST,DeptBaySST)) %>%
									arrange(YEAR)

head(sst.merged.long)

write_csv(sst.merged.long,"DATA/DFO_FraserSockeyeForecast/RawFiles/GENERATED_Merged_SST_Long.csv")

covar.sst <- sst.merged.long %>% group_by(YEAR) %>% summarize(EntrIslSSTMeanAprToJun = round(mean(EntrIslSST),3),
																								 PineIslSSTMeanAprToJun = round(mean(PineIslSST),3)) %>%
							dplyr::rename(Year = YEAR)
covar.sst



#-------------------------------------------------------
# Lightstation Sea Surface Salinity
#-------------------------------------------------------

# use the file list from previous section
lightstation.files.list



amphi.point.sss.idx <- grepl("Amphitrite_Point",lightstation.files.list) & grepl("Salinities",lightstation.files.list)
amphi.point.sss.src <- read.csv(lightstation.files.list[amphi.point.sss.idx],
																		comment.char = "#" ,
																		skip = 1, # skip the first line text (need this, because doesn't have a "#" to mark comment)
																		header=TRUE,
																		stringsAsFactors = FALSE,
																		blank.lines.skip=TRUE)

amphi.point.sss.src[amphi.point.sss.src == 999.99] <- NA

head(amphi.point.sss.src)

amphi.point.sss.src.long  <- amphi.point.sss.src %>%
	pivot_longer(JAN:DEC,names_to = "Month",values_to = "AmphiPtSSS")

amphi.point.sss.src.long



race.rocks.sss.idx <- grepl("Race_Rocks",lightstation.files.list) & grepl("Salinities",lightstation.files.list)
race.rocks.sss.src <- read.csv(lightstation.files.list[race.rocks.sss.idx],
																comment.char = "#" ,
																skip = 1, # skip the first line text (need this, because doesn't have a "#" to mark comment)
																header=TRUE,
																stringsAsFactors = FALSE,
																blank.lines.skip=TRUE)

race.rocks.sss.src[race.rocks.sss.src == 999.99] <- NA

head(race.rocks.sss.src)

race.rocks.sss.src.long  <- race.rocks.sss.src %>%
	pivot_longer(JAN:DEC,names_to = "Month",values_to = "RaceRocksSSS")

race.rocks.sss.src.long




sss.merged.long <- amphi.point.sss.src.long %>%
	full_join(race.rocks.sss.src.long,by=c("YEAR","Month")) %>%
	arrange(YEAR)

head(sss.merged.long)

write_csv(sss.merged.long,"DATA/DFO_FraserSockeyeForecast/RawFiles/GENERATED_Merged_SSS_Long.csv")


sss.JulToAug <- sss.merged.long %>% dplyr::filter(Month %in% c("JUL","AUG")) %>%
								group_by(YEAR) %>%
								summarize(AmphiPtSSSMeanJulToAug = round(mean(AmphiPtSSS,na.rm=TRUE),3) ,
													RaceRocksSSSMeanJulToAug = round(mean(RaceRocksSSS,na.rm=TRUE),3) ) %>%
								mutate_all(~ifelse(is.nan(.), NA, .)) %>%
								arrange(YEAR)

sss.JulToAug <- sss.JulToAug%>%		mutate(SSSIndexJulToAug = round(rowMeans(select(sss.JulToAug,contains("SSSMean")), na.rm = TRUE),3)) %>%
	mutate_all(~ifelse(is.nan(.), NA, .))

sss.JulToAug


sss.JulToSep <- sss.merged.long %>% dplyr::filter(Month %in% c("JUL","AUG","SEP")) %>%
	group_by(YEAR) %>%
	summarize(AmphiPtSSSMeanJulToSep = round(mean(AmphiPtSSS,na.rm=TRUE),3) ,
						RaceRocksSSSMeanJulToSep = round(mean(RaceRocksSSS,na.rm=TRUE),3) ) %>%
	mutate_all(~ifelse(is.nan(.), NA, .)) %>%
	arrange(YEAR)

sss.JulToSep <- sss.JulToSep%>%		mutate(SSSIndexJulToSep = round(rowMeans(select(sss.JulToSep,contains("SSSMean")), na.rm = TRUE),3)) %>%
	mutate_all(~ifelse(is.nan(.), NA, .))

sss.JulToSep



covar.sss <- sss.JulToAug %>% select(YEAR, SSSIndexJulToAug) %>%
							full_join(sss.JulToSep%>% select(YEAR, SSSIndexJulToSep),
												by="YEAR") %>%
	dplyr::rename(Year = YEAR)
covar.sss




#-------------------------------------------------------
# Fraser Ricer Discharge
#-------------------------------------------------------


# STILL TRACKING THIS ONE DOWN





#-------------------------------------------------------
# MERGE SERIES
#-------------------------------------------------------

fraser.fc.covars <- pdo.reorg.out %>% select(Year, PDOMeanNovToMar) %>%
										full_join(covar.sst, by="Year") %>%
										full_join(covar.sss, by="Year")

head(fraser.fc.covars)

write_csv(fraser.fc.covars,"DATA/DFO_FraserSockeyeForecast/GENERATED_COVARS_DFOFraserRiverForecasts.csv")




