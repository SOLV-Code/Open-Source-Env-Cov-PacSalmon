# Compare alternative versions of the PDO covariate


library(tidyverse)

# -------------------------------------------
# Get PDO variations from  merged data set
# -------------------------------------------

pdo.data <- read_csv("OUTPUT/Merged_CovariateSet.csv",comment="#") %>%
							select(c(Year,contains("PDO")))

pdo.data


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

idx.left.pts <- pdo.data$PDOMeanNovToMar <= -1.2 &
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


idx.top.pts <- pdo.data$PDOSumDecToMarch >  4

text(pdo.data$PDOMeanNovToMar[idx.top.pts],
		 pdo.data$PDOSumDecToMarch[idx.top.pts],
		 labels = pdo.data$Year[idx.top.pts],
		 adj=-0.2,col="darkblue",cex=0.8,xpd=NA)


idx.bt.pts <- pdo.data$PDOSumDecToMarch < -4

text(pdo.data$PDOMeanNovToMar[idx.bt.pts],
		 pdo.data$PDOSumDecToMarch[idx.bt.pts],
		 labels = pdo.data$Year[idx.bt.pts],
		 adj=-0.2,col="darkblue",cex=0.8,xpd=NA)



dev.off()




# -------------------------------------------
#  Winter PDO Comparison - Scatter / Excluding 2022
# -------------------------------------------


png(filename = "OUTPUT/PDO_Comparisons/PDO_Comparisons_Scatter_Excl2022.png",
		width = 480*4, height = 480*4.2, units = "px",
		pointsize = 14*3.9, bg = "white",  res = NA)
par(mai=c(5,5,4,2))

plot(pdo.data$PDOMeanNovToMar,pdo.data$PDOSumDecToMarch,
		 xlim=c(-2.5,2.5),
		 xlab = "PDO Mean Nov-Mar\n(DFO Fraser FC)",
		 ylab = "PDO Sum Dec-Mar\n(NOAA Ocean Cond Index)",
		 bty="n",axes=FALSE,pch=21,col="darkblue",bg="lightblue",
		 cex=1.3,
		 main="Comparison of Winter PDO Covariates\nExcluding 2022")
axis(1)
axis(2,at=seq(-6,8,by =2),las=1)
abline(h=0,col="red",lty=2)
abline(v=0,col="red",lty=2)

idx.left.pts <- pdo.data$PDOMeanNovToMar <= -1.2 &
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


idx.top.pts <- pdo.data$PDOSumDecToMarch >  4

text(pdo.data$PDOMeanNovToMar[idx.top.pts],
		 pdo.data$PDOSumDecToMarch[idx.top.pts],
		 labels = pdo.data$Year[idx.top.pts],
		 adj=-0.2,col="darkblue",cex=0.8,xpd=NA)


idx.bt.pts <- pdo.data$PDOSumDecToMarch < -4

text(pdo.data$PDOMeanNovToMar[idx.bt.pts],
		 pdo.data$PDOSumDecToMarch[idx.bt.pts],
		 labels = pdo.data$Year[idx.bt.pts],
		 adj=-0.2,col="darkblue",cex=0.8,xpd=NA)



dev.off()

