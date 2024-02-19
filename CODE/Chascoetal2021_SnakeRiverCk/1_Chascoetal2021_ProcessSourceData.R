# Extract archived data from .Rdata file


library(tidyverse)


#--------------------------------------------
# GET ARCHIVED DATA
#--------------------------------------------


# [The paper](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0246659)
# includes a link to a [github repository](https://github.com/bchasco/SAR_paper).
# The file *envData.RData* was downloaded from the repository on 2024-02-19.

# See discussion re: alternative approaches at
# https://stackoverflow.com/questions/7270544/how-to-see-data-from-rdata-file
# this extracts the object 'envdata' from the RData source
get(load("DATA/Chascoetal2021_SnakeRiverCk/RawFiles/envData.RData"))

# save as a human-readable file
write_csv(envdata,"DATA/Chascoetal2021_SnakeRiverCk/RawFiles/GENERATED_EnvCovarFromChascoetal2021.csv")

names(envdata)



#--------------------------------------------
# Multivariate ENSO Index Version 2 (MEI.v2)
#--------------------------------------------


# get source data
mei.src <- read.csv("DATA/Chascoetal2021_SnakeRiverCk/MEIv2Source_Data.csv",
										comment.char = "#" , header=TRUE,
										stringsAsFactors = FALSE, blank.lines.skip=TRUE)

mei.src[mei.src %in% c(-999,-999.00)] <- NA # doesn't catch
mei.src[mei.src == -999] <- NA # this one does. why?

head(mei.src)



mei.covar.out <- mei.src %>%	#
	mutate(n = rowSums(!is.na(select(., -Year)))) %>%
	dplyr::filter(n == 12) %>%
	rowwise() %>%
	mutate(MEIv2MeanDecToMar = round(mean(c(DJ,JF,FM),na.rm=TRUE),3),
				 MEIv2MeanMarToJun = round(mean(c(DJ,JF,FM),na.rm=TRUE),3),
				 MEIv2MeanJunToSep = round(mean(c(DJ,JF,FM),na.rm=TRUE),3),
				 MEIv2MeanSepToDec = round(mean(c(DJ,JF,FM),na.rm=TRUE),3)  ) %>%
				 full_join(
				 			envdata %>% select(year,contains("oni.")) %>% dplyr::filter(year >= 1950) %>%
									dplyr::rename(Year = year), by = "Year") %>% arrange(Year)

mei.covar.out
write_csv(mei.covar.out,"OUTPUT/MEI_Comparisons/MEI_Comparisons_Data.csv")



# crosscheck -> STILL NEEDS TO BE SORTED OUT

plot(mei.covar.out$MEIv2MeanDecToMar,mei.covar.out$oni.win)

plot(mei.covar.out$Year,mei.covar.out$MEIv2MeanDecToMar,type="o", col="darkblue", pch=19,
		 xlab="Year",ylab="index value",ylim=c(-2,3))
lines(mei.covar.out$Year,mei.covar.out$oni.win,type="o", col="darkblue", pch=21,bg="white")
legend("topleft",legend = c("MEIv2MeanDecToMar","oni.win"),lty=1,col="darkblue",pch=c(19,21))

#-------------------------------------------------------
# MERGE SERIES
#-------------------------------------------------------

# clean out the extracted object
rm(envdata)


chasco2021.covars <-  mei.covar.out %>%
				select(Year,MEIv2MeanDecToMar,MEIv2MeanMarToJun,MEIv2MeanJunToSep,MEIv2MeanSepToDec)
head(chasco2021.covars)

write_csv(chasco2021.covars,"DATA/DFO_FraserSockeyeForecast/GENERATED_COVARS_Chascoetal2021Paper.csv")



