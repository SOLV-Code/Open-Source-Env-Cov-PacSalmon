library(tidyverse)
library(pacea)

# COMPARE PDO SOURCES

# There are different source files available online
# See issue at https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/26
# For the Fraser Forecast data set, we used this one:
# https://psl.noaa.gov/gcos_wgsp/Timeseries/Data/pdo.long.data


pdo.record.comp <-  read.csv("DATA/DFO_FraserSockeyeForecast/PDOIdxSource_Data.csv",
 comment.char = "#" , header=TRUE,
 stringsAsFactors = FALSE, blank.lines.skip=TRUE) %>%
	pivot_longer(Jan:Dec,names_to = "month_name") %>% dplyr::rename(year=Year)

month.lookup <- data.frame(month_name = substr(month.name , start = 1 , stop = 3 ),
													 month = 1:12)

pdo.record.comp <- pdo.record.comp %>% left_join(month.lookup,by= "month_name") %>%
											full_join(pacea::pdo %>% dplyr::rename(anomaly_pacea = anomaly),
																by = c("year","month")) %>% arrange(year, month)

pdo.record.comp <- pdo.record.comp %>% mutate(plot_index = 1:dim(pdo.record.comp)[1])

pdo.record.comp



pdo.record.sub <- pdo.record.comp %>% dplyr::filter(year %in% 2005:2025)
axis.src <- pdo.record.sub %>% dplyr::filter(month==1)

plot(pdo.record.sub$plot_index,pdo.record.sub$anomaly_pacea,col="darkblue",
		 cex=0.5,ylim=c(-3,3),type="o",pch=19,axes=FALSE,ylab="pdo anomaly",xlab="")
axis(2,las=1)
axis(1,at=axis.src$plot_index,labels= paste0("Jan\n",axis.src$year ))
abline(v=axis.src$plot_index,col="darkgrey",lty=2)

abline(h=0,col="red")
lines(pdo.record.sub$plot_index,pdo.record.sub$value,col="red",
		 cex=0.5,type="o",pch=4)

legend("topright",legend=c("OI SST v2","ERSSt v5"),
			 col=c("red","darkblue"),pch=c(4,19))






# COMPARE ONI SOURCES





# COMPARE MEI SOURCES







# COMPARE NPGO SOURCES
