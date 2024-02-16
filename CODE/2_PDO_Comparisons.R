# Compare alternative versions of the PDO covariate


library(tidyverse)

# -------------------------------------------
# Get PDO variations from  merged data set
# -------------------------------------------

pdo.data <- read_csv("OUTPUT/Merged_CovariateSet.csv",comment="#") %>%
							select(c(Year,contains("PDO")))

pdo.data

pdo.comp.df <- read_csv("OUTPUT/PDO_Comparisons/PDO_Comparisons_Data.csv")
pdo.comp.df

# -------------------------------------------
#  Winter PDO Comparison - Scatter / All Years
# -------------------------------------------


png(filename = "OUTPUT/PDO_Comparisons/PDO_Comparisons_Scatter_All.png",
		width = 480*4, height = 480*4.2, units = "px",
		pointsize = 14*3.9, bg = "white",  res = NA)
par(mai=c(5,5,4,2))

plot(pdo.data$PDOMeanNovToMar,pdo.data$PDOSumDecToMarch,
		 xlab = "PDO Mean Nov-Mar\n(DFO Fraser FC)",
		 ylab = "PDO Sum Dec-Mar\n(NOAA Ocean Cond Index)",
		 bty="n",axes=FALSE,pch=21,col="darkblue",bg="lightblue",
		 cex=1.3,
		 main="Comparison of Winter PDO Covariates\nAll Years")
axis(1)
axis(2,at=seq(-6,8,by =2),las=1)
abline(h=0,col="red",lty=2)
abline(v=0,col="red",lty=2)

idx.left.pts <- pdo.data$PDOMeanNovToMar <= -1.5&
									pdo.data$PDOMeanNovToMar > -3

text(pdo.data$PDOMeanNovToMar[idx.left.pts],
		 pdo.data$PDOSumDecToMarch[idx.left.pts],
		 labels = pdo.data$Year[idx.left.pts],
		 adj=1.2,col="darkblue",cex=0.8)

idx.rt.pts <- pdo.data$PDOMeanNovToMar >  1.5

text(pdo.data$PDOMeanNovToMar[idx.rt.pts],
		 pdo.data$PDOSumDecToMarch[idx.rt.pts],
		 labels = pdo.data$Year[idx.rt.pts],
		 adj=-0.2,col="darkblue",cex=0.8,xpd=NA)


idx.top.pts <- pdo.data$PDOSumDecToMarch >  3

text(pdo.data$PDOMeanNovToMar[idx.top.pts],
		 pdo.data$PDOSumDecToMarch[idx.top.pts],
		 labels = pdo.data$Year[idx.top.pts],
		 adj=-0.2,col="darkblue",cex=0.8,xpd=NA)


idx.bt.pts <- pdo.data$PDOSumDecToMarch < -4 &
	pdo.data$PDOMeanNovToMar >= -1.56

text(pdo.data$PDOMeanNovToMar[idx.bt.pts],
		 pdo.data$PDOSumDecToMarch[idx.bt.pts],
		 labels = pdo.data$Year[idx.bt.pts],
		 adj=-0.2,col="darkblue",cex=0.8,xpd=NA)



dev.off()


# quickly check variations
#
plot(pdo.comp.df$PDOMeanOctToMar,pdo.comp.df$PDOMeanNovToMar)
plot(pdo.comp.df$PDOMeanDecToMar,pdo.comp.df$PDOMeanNovToMar)

plot(pdo.comp.df$PDOMeanOctToMar,pdo.comp.df$PDOSumNovToMar)
plot(pdo.comp.df$PDOMeanDecToMar,pdo.comp.df$PDOSumNovToMar)




# -------------------------------------------
#  Winter PDO - Range in Monthly Means OCt-Mar
# -------------------------------------------

hist(pdo.comp.df$PDORangeOctToMar,las=1, breaks = seq(0.5,3.5,by=0.2))
pdo.comp.df %>% arrange(-PDORangeOctToMar) %>% select(Year,PDOMeanNovToMar,PDORangeOctToMar)
plot(pdo.comp.df$PDOMeanNovToMar,pdo.comp.df$PDORangeOctToMar)



png(filename = "OUTPUT/PDO_Comparisons/PDO_Comparisons_TimeSeriesOfRanges.png",
		width = 480*4, height = 480*3.4, units = "px",
		pointsize = 14*4.3, bg = "white",  res = NA)

plot(pdo.comp.df$Year,pdo.comp.df$PDORangeOctToMar,type="l",col="darkgrey",
		 xlab="Year",ylab="Oct-Mar Range in PDO Index", bty="n",lwd=3,las=1,
		 main ="Range")

lines(pdo.comp.df$Year,
			stats::filter(pdo.comp.df$PDORangeOctToMar,rep(1/5,5),sides = 1),
			col="red",lwd=5)
dev.off()

# -------------------------------------------
#  Winter PDO - Annual patterns (Oct to March)
# -------------------------------------------

ylim.use <- range(pdo.comp.df %>% select(Oct:Mar),na.rm=TRUE)
ylim.use


png(filename = "OUTPUT/PDO_Comparisons/PDO_Comparisons_ExampleYears.png",
		width = 480*4, height = 480*3.3, units = "px",
		pointsize = 14*4, bg = "white",  res = NA)
par(mfrow=c(2,2),mai=c(4,4,2,2))


for(yr.plot in c(2004,2011,1995,2022)){

plot(1:5,1:5,type="n",bty="n",xlim=c(0.5,6.5),ylim=ylim.use,
		 ylab= "PDO Index",axes=FALSE,xlab="Month")
axis(2,las=1)
axis(1,at=1:6,labels = c("Oct","Nov","Dec","Jan","Feb","Mar"))
abline(h=0,col="red",lwd=4)
abline(v=3.5,col="red",lty=2)
text(c(2,5),rep(2.5,2),labels = c(yr.plot-1,yr.plot),font=2, col="darkblue")

val.vec <- pdo.comp.df %>% dplyr::filter(Year== yr.plot) %>% select(Oct:Mar)
val.vec

lines(1:6,val.vec,type="o",pch=19,col="darkblue")

}


dev.off()

# -------------------------------------------
#  Winter PDO Comparison - histograms
# -------------------------------------------

# args
data.plot <- pdo.data %>% select(Year,PDOMeanNovToMar)
title.use <- "Mean (DFO Fraser Forecasting)\nAll Years"
xlab.use <- "PDO Mean Nov-Mar"

# fn content
data.vec <- data.plot[,2] %>% unlist()

hist(data.vec, breaks=seq(-10,4, by=0.5),
		 main= title.use,
		 xlab=  xlab.use, freq = TRUE, las=1)

sd(data.vec,na.rm=TRUE)/mean(data.vec,na.rm=TRUE)









