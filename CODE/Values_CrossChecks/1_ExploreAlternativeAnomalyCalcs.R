library(tidyverse)



###########################################
# explore alt anomaly calcs for NPI

yrs.plot <- 2020:2024

npi.alt.anomalies <- read_csv("DATA/DFO_PACEA_Package/GENERATED_pacea_NPI_MonthlyAnomaliesVariations.csv") %>%
												arrange(year, month) %>% dplyr::filter(year %in% yrs.plot)

axis.src <- npi.alt.anomalies %>% dplyr::filter(month==1)


png(filename = "OUTPUT/Values_CrossCheck/ComparisonOfNPIAnomalies.png",
		width = 480*4.5, height = 480*3.5, units = "px", pointsize = 14*3.5, bg = "white",  res = NA)


plot(npi.alt.anomalies$plot_index,npi.alt.anomalies$anomaly,ylim=c(-12,12),
		 axes=FALSE,xlab = "Month",ylab = "Anomaly", main = "NPI Anomalies Relative to 3 Alternative Base Values",
		 type="o",col="darkblue", pch=19,cex= 0.6)
axis(2,las=2)
axis(1,at=axis.src$plot_index,labels= paste0("Jan\n",axis.src$year ))
abline(v=axis.src$plot_index,col="darkgrey",lty=2)

lines(npi.alt.anomalies$plot_index,npi.alt.anomalies$anomaly_month,type="l",col="darkblue",lwd=1,lty=2)
lines(npi.alt.anomalies$plot_index,npi.alt.anomalies$anomaly_bymonth,type="o",col="red",lwd=1,lty=2,pch=17,cex=0.6)
abline(h=0,col="red",lwd=3)

legend("bottom",legend = c("Mean of Monthly Index (1925-1989)",
												"Mean of Annual Index (1925-1989)",
												"Mean by Month (1925-1989)"),
			 border="white", pch = c(NA,19,17),col=c("darkblue","darkblue","red"),
			 lty = c(2,1,2), lwd=c(2,2,1),ncol=2, cex = 0.7)

dev.off()


###########################################
# explore base values used for ONI anomalies


oni.plot.df <- oni %>% mutate(BaseVal = value - anomaly)
oni.plot.df




month.plot <-8
oni.plot.df.sub <- oni.plot.df %>% dplyr::filter(month == month.plot)
plot(oni.plot.df.sub$year,oni.plot.df.sub$BaseVal,type="o",
		 ylim=c(26.2,27.2))




month.plot <- 1
oni.plot.df.sub <- oni.plot.df %>% dplyr::filter(month == month.plot)
lines(oni.plot.df.sub$year,oni.plot.df.sub$BaseVal,type="o")


