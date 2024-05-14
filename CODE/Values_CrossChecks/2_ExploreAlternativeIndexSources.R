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

png(filename = "OUTPUT/Values_CrossCheck/ComparisonOfPDOSourceData.png",
		width = 480*3.5, height = 480*4.5, units = "px", pointsize = 14*3.5, bg = "white",  res = NA)

par(mai=c(4,4,3,3))
layout(matrix(c(1,2),ncol=1),heights = c(2,1.35))

plot(pdo.record.comp$value,pdo.record.comp$anomaly_pacea, type="p",col="darkblue",pch=21,cex=0.5,
		 main = "Comparison of PDO Source Files - All Data", axes=FALSE,
		 xlab = "PDO version OI SST v2",ylab ="PDO version ERSSt v5",xlim=c(-4,4),ylim=c(-4,4))
#rect(-5,0,0,5,col="lightblue",border="lightblue")
#rect(0,-5,5,0,col="lightblue",border="lightblue")
abline(h=0,col="darkgrey")
abline(v=0,col="darkgrey")
axis(2,las=1)
axis(1,las=1)
abline(0,1.,col="red", lwd=2)
points(pdo.record.comp$value,pdo.record.comp$anomaly_pacea, type="p",col="darkblue",pch=21,cex=0.6)


pdo.record.sub <- pdo.record.comp %>% dplyr::filter(year %in% 2005:2025)
axis.src <- pdo.record.sub %>% dplyr::filter(month==1)

par(mai=c(3,4,3,3))


plot(pdo.record.sub$plot_index,pdo.record.sub$anomaly_pacea,col="darkblue",
		 cex=0.5,ylim=c(-3,3),type="o",pch=19,axes=FALSE,ylab="pdo anomaly",xlab="",
		 main = paste("Comparison of PDO Source Files",paste(range(pdo.record.sub$year),collapse="-")) )
axis(2,las=1)
axis(1,at=axis.src$plot_index,labels= paste0("Jan\n",axis.src$year ))
abline(v=axis.src$plot_index,col="darkgrey",lty=2)

abline(h=0,col="red")
lines(pdo.record.sub$plot_index,pdo.record.sub$value,col="red",
		 cex=0.5,type="o",pch=4)

legend("topright",legend=c("OI SST v2","ERSST v5"),
			 col=c("red","darkblue"),pch=c(4,19),cex=0.8)


dev.off()








# COMPARE ONI SOURCES





# COMPARE MEI SOURCES







# COMPARE NPGO SOURCES
