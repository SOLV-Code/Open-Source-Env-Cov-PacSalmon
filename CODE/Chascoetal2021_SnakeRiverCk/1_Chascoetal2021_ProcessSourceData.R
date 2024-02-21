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

names(mei.src)

mei.covar.out <- mei.src %>%	#
	mutate(n = rowSums(!is.na(select(., -Year)))) %>%
	dplyr::filter(n == 12) %>%
	rowwise() %>%
	mutate(MEIv2MeanDecToFeb = round(mean(c(DJ,JF),na.rm=TRUE),3),
				 MEIv2MeanMarToMay = round(mean(c(MA,AM),na.rm=TRUE),3),
				 MEIv2MeanJunToAug = round(mean(c(JJ,JA),na.rm=TRUE),3),
				 MEIv2MeanSepToNov = round(mean(c(SO,ON),na.rm=TRUE),3)  ) %>%
				 full_join(
				 			envdata %>% select(year,contains("mei.")) %>% dplyr::filter(year >= 1950) %>%
									dplyr::rename(Year = year), by = "Year") %>% arrange(Year)

mei.covar.out


write_csv(mei.covar.out,"OUTPUT/MEI_Comparisons/MEI_Comparisons_Data.csv")



# crosscheck -> STILL NEEDS TO BE SORTED OUT

plot(mei.covar.out$MEIv2MeanDecToFeb,mei.covar.out$mei.win)

plot(mei.covar.out$Year,mei.covar.out$MEIv2MeanDecToFeb,type="o", col="darkblue", pch=19,
		 xlab="Year",ylab="index value",ylim=c(-2,3))
lines(mei.covar.out$Year,mei.covar.out$mei.win,type="o", col="darkblue", pch=21,bg="white")
legend("topleft",legend = c("MEIv2MeanDecToFeb","mei.win"),lty=1,col="darkblue",pch=c(19,21))

#-------------------------------------------------------
# MERGE SERIES
#-------------------------------------------------------


# get the other variables (for now) from the paper source
# rename the variable for consistency with other data sets
names(envdata) <- gsub(".win","MeanDecToFeb",names(envdata))
names(envdata) <- gsub(".spr","MeanMarToMay",names(envdata))
names(envdata) <- gsub(".sum","MeanJunToAug",names(envdata))
names(envdata) <- gsub(".aut","MeanSepToNov",names(envdata))

names(envdata) <- gsub("CRflow","ColumbiaRFlow",names(envdata))
names(envdata) <- gsub("CRtemp","ColumbiaRTemp",names(envdata))

names(envdata) <- gsub("cui","CoastUpIdx",names(envdata))
names(envdata) <- gsub("npgo","NPacGyreOsc",names(envdata))
names(envdata) <- gsub("oni","OcNinoIdx",names(envdata))
names(envdata) <- gsub("transport","WashTransp",names(envdata))
names(envdata) <- gsub("pdo","PDO",names(envdata))

names(envdata)[1]<-"Year"



# combine extracted and recreated variables




chasco2021.covars <- envdata %>% select(contains(c("Year","ColumbiaRFlow","ColumbiaRTemp","CoastUpIdx",
																									 "NPacGyreOsc","OcNinoIdx","WashTransp","PDO"))) %>%
				full_join(mei.covar.out %>%
							select(Year,MEIv2MeanDecToFeb,MEIv2MeanMarToMay,MEIv2MeanJunToAug,MEIv2MeanSepToNov),
							by="Year")

names(chasco2021.covars)

head(chasco2021.covars)

write_csv(chasco2021.covars,"DATA/Chascoetal2021_SnakeRiverCk/GENERATED_COVARS_Chascoetal2021Paper.csv")



# clean out the extracted object
rm(envdata)


