




# explore alt anomaly calcs

yrs.plot <- 2010:2014

npi.alt.anomalies <- read_csv("DATA/DFO_PACEA_Package/GENERATED_pacea_NPI_MonthlyAnomaliesVariations.csv") %>%
												arrange(year, month) %>% dplyr::filter(year %in% yrs.plot)

axis.src <- npi.alt.anomalies %>% dplyr::filter(month==1)


plot(npi.alt.anomalies$plot_index,npi.alt.anomalies$anomaly,type="l",ylim=c(-12,12),
		 axes=FALSE)
axis(2,las=2)
axis(1,at=axis.src$plot_index,labels= paste0("Jan\n",axis.src$year ))
abline(v=axis.src$plot_index,col="darkgrey",lty=2)

lines(npi.alt.anomalies$plot_index,npi.alt.anomalies$anomaly_month,type="l")
lines(npi.alt.anomalies$plot_index,npi.alt.anomalies$anomaly_bymonth,type="l",col="red")
abline(h=0,col="red")




bar_col <- ifelse(obj_lub[[value]] >= 0,
									"red",
									"blue")

plot(obj_lub$date,
		 obj_lub[[value]], # [[]] returns a vector not a tibble
		 type = "h",
		 xlab = xlab,
		 ylab = ylab,
		 col = bar_col,
		 lend = 1,
		 ...)
abline(h = 0)
