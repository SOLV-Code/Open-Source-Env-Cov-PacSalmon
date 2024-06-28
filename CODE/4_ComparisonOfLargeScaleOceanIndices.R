# COMPARISON OF LARGE-SCALE OCEAN INDICES


library(tidyverse)

# First Set: MOnthly anomalies from PACEA data set
library(pacea)


#	AO - Arctic Oscillation
# ENSO MEI – Multivariate ENSO Index
# NPGO – North Pacific Gyre Oscillation
# NPI – North Pacific Index monthly values
# ONI – Oceanographic Niño Index
# PDO – Pacific Decadal Oscillation
ao
mei
npgo
npi_monthly
oni
pdo


if(!dir.exists("OUTPUT/LargeScaleIndex_Comparisons")){dir.create("OUTPUT/LargeScaleIndex_Comparisons")}


#################
# smoothed patterns

# running avg versions too "spiky" for 3D prints, use lowess smoothing instead

# create time-series objects for lowess plots
start.yr <- 1980
end.yr <- 2023
smoother.span <- 1/35 # f value for lowess()

# Test extraction and conversion
pdo.ts <- ts(pdo %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12)
pdo.ts
pdo.lowess <- lowess(pdo.ts,f=smoother.span)
pdo.lowess
plot(pdo.lowess, type="l", col="red", bty="n",axes=TRUE,xlab="Year", ylab="PDO Anomaly (Lowess Smoothed)")
abline(h=0,col="red")

# apply to all indices and combine into single object

# NOTE: for npi_monthly the PACEA object currently does not include anomalies, so using a modified version
# created in this script for now
# https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/DFO_PACEA_Package/1_Pacea_PackageInstallandDataExtract.R
# See issue at https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/118 for details


smoothed.indices <- data.frame(year = pdo.lowess$x,
															 pdo = pdo.lowess$y,
															 mei = lowess(ts(mei %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12),
															 						 f= smoother.span)$y,
															 ao = lowess(ts(ao %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12),
															 						 f= smoother.span)$y,
															 npgo = lowess(ts(npgo %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12),
															 						 f= smoother.span)$y,
															 npi_monthly = lowess(ts(npi_monthly_mod %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly_bymonth) ,start = c(start.yr,1),freq=12),
															 						 f= smoother.span)$y,
															 oni = lowess(ts(oni %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12),
															 						 f= smoother.span)$y
															 )

smoothed.indices



# some exploratory plots
range(smoothed.indices %>% select(-1))

plot(1:5,1:5,type="n",xlim= c(1980,2025),ylim=c(-2.5,2.5),xlab="Year",ylab="Smoothed Monthly Anomaly",
		 bty="n",main = "pdo vs mei")
abline(h=0,col="red",lwd=2)
lines(smoothed.indices$year,smoothed.indices$pdo)
lines(smoothed.indices$year,smoothed.indices$mei,col="red")


plot(1:5,1:5,type="n",xlim= c(1980,2025),ylim=c(-2.5,2.5),xlab="Year",ylab="Smoothed Monthly Anomaly",
		 bty="n",main = "pdo vs npgo")
abline(h=0,col="red",lwd=2)
lines(smoothed.indices$year,smoothed.indices$pdo)
lines(smoothed.indices$year,smoothed.indices$npgo,col="red")

plot(1:5,1:5,type="n",xlim= c(1980,2025),ylim=c(-2.5,2.5),xlab="Year",ylab="Smoothed Monthly Anomaly",
		 bty="n",main = "pdo vs npi_mothly")
abline(h=0,col="red",lwd=2)
lines(smoothed.indices$year,smoothed.indices$pdo)
lines(smoothed.indices$year,smoothed.indices$npi_monthly,col="red")


plot(1:5,1:5,type="n",xlim= c(1980,2025),ylim=c(-2.5,2.5),xlab="Year",ylab="Smoothed Monthly Anomaly",
		 bty="n",main = "pdo vs oni")
abline(h=0,col="red",lwd=2)
lines(smoothed.indices$year,smoothed.indices$pdo)
lines(smoothed.indices$year,smoothed.indices$oni,col="red")


plot(1:5,1:5,type="n",xlim= c(1980,2025),ylim=c(-2.5,2.5),xlab="Year",ylab="Smoothed Monthly Anomaly",
		 bty="n",main = "pdo vs ao")
abline(h=0,col="red",lwd=2)
lines(smoothed.indices$year,smoothed.indices$pdo)
lines(smoothed.indices$year,smoothed.indices$ao,col="red")


plot(1:5,1:5,type="n",xlim= c(1980,2025),ylim=c(-2.5,2.5),xlab="Year",ylab="Smoothed Monthly Anomaly",
		 bty="n",main = "mei vs oni")
abline(h=0,col="red",lwd=2)
lines(smoothed.indices$year,smoothed.indices$mei)
lines(smoothed.indices$year,smoothed.indices$oni,col="red")

plot(1:5,1:5,type="n",xlim= c(1980,2025),ylim=c(-2.5,2.5),xlab="Year",ylab="Smoothed Monthly Anomaly",
		 bty="n",main = "mei vs npi")
abline(h=0,col="red",lwd=2)
lines(smoothed.indices$year,smoothed.indices$mei)
lines(smoothed.indices$year,smoothed.indices$npi_monthly,col="red")


#----------------------------------------------------------------------------------------------------
# Plot for notes page
ylim.use <- c(-2.5,2.5)


png(filename = "OUTPUT//LargeScaleIndex_Comparisons/OverviewOfIndicesStarting1980.png",
		width = 480*4.5, height = 480*4.5, units = "px", pointsize = 14*3.5, bg = "white",  res = NA)




layout(matrix(1:6,ncol=2,byrow=FALSE))

bar.ticks.src <- barplot(height=smoothed.indices$pdo,
												 col=ifelse(smoothed.indices$pdo > 0, "dodgerblue", "tomato1"),
												 border=ifelse(smoothed.indices$pdo > 0, "dodgerblue", "tomato1"),
												 axes=FALSE, ylim=ylim.use, main= "Pacific Decadal Oscillation (PDO)",col.main = "darkblue" )
# https://stackoverflow.com/a/5238099
bar.ticks <- data.frame(x.tick = unlist(bar.ticks.src)[c(TRUE,rep(FALSE,119))],
												year = smoothed.indices$year[c(TRUE,rep(FALSE,119))])
bar.ticks
abline(v=bar.ticks$x.tick,col="darkblue",lty=2)
abline(h=0,col="darkblue")
text(bar.ticks$x.tick,rep(par("usr")[3],dim(bar.ticks)[1]),bar.ticks$year,xpd=NA,col="darkblue", cex = 1,adj=c(0.5,1))
axis(2,cex.axis=1,col.axis="darkblue",las=1)
mtext("Smoothed Monthly Anomaly", side=2, line=2.2, cex=0.8,col="darkblue")



barplot(height=smoothed.indices$mei,
				col=ifelse(smoothed.indices$mei > 0, "dodgerblue", "tomato1"),
				border=ifelse(smoothed.indices$mei > 0, "dodgerblue", "tomato1"),
				axes=FALSE,
				ylim=ylim.use, main= "Multivariate El Niño/Southern Oscillation\n(ENSO) Index (MEI)",col.main = "darkblue" )
abline(v=bar.ticks$x.tick,col="darkblue",lty=2)
abline(h=0,col="darkblue")
text(bar.ticks$x.tick,rep(par("usr")[3],dim(bar.ticks)[1]),bar.ticks$year,xpd=NA,col="darkblue", cex = 1,adj=c(0.5,1))
axis(2,cex.axis=1,col.axis="darkblue",las=1)
mtext("Smoothed Monthly Anomaly", side=2, line=2.2, cex=0.8,col="darkblue")


barplot(height=smoothed.indices$oni,
				col=ifelse(smoothed.indices$oni > 0, "dodgerblue", "tomato1"),
				border=ifelse(smoothed.indices$oni > 0, "dodgerblue", "tomato1"),
				axes=FALSE, ylim=ylim.use, main= "Oceanographic Niño Index (ONI)",col.main = "darkblue" )
abline(v=bar.ticks$x.tick,col="darkblue",lty=2)
abline(h=0,col="darkblue")
text(bar.ticks$x.tick,rep(par("usr")[3],dim(bar.ticks)[1]),bar.ticks$year,xpd=NA,col="darkblue", cex = 1,adj=c(0.5,1))
axis(2,cex.axis=1,col.axis="darkblue",las=1)
mtext("Smoothed Monthly Anomaly", side=2, line=2.2, cex=0.8,col="darkblue")

barplot(height=smoothed.indices$npgo,
				col=ifelse(smoothed.indices$npgo > 0, "dodgerblue", "tomato1"),
				border=ifelse(smoothed.indices$npgo > 0, "dodgerblue", "tomato1"),
				axes=FALSE, ylim=ylim.use, main= "North Pacific Gyre Oscillation (NPGO)",col.main = "darkblue" )
abline(v=bar.ticks$x.tick,col="darkblue",lty=2)
abline(h=0,col="darkblue")
text(bar.ticks$x.tick,rep(par("usr")[3],dim(bar.ticks)[1]),bar.ticks$year,xpd=NA,col="darkblue", cex = 1,adj=c(0.5,1))
axis(2,cex.axis=1,col.axis="darkblue",las=1)
mtext("Smoothed Monthly Anomaly", side=2, line=2.2, cex=0.8,col="darkblue")

barplot(height=smoothed.indices$npi_monthly,
				col=ifelse(smoothed.indices$npi_monthly > 0, "dodgerblue", "tomato1"),
				border=ifelse(smoothed.indices$npi_monthly > 0, "dodgerblue", "tomato1"),
				axes=FALSE, ylim=ylim.use, main= "North Pacific Index (NPI)",col.main = "darkblue" )
abline(v=bar.ticks$x.tick,col="darkblue",lty=2)
abline(h=0,col="darkblue")
text(bar.ticks$x.tick,rep(par("usr")[3],dim(bar.ticks)[1]),bar.ticks$year,xpd=NA,col="darkblue", cex = 1,adj=c(0.5,1))
axis(2,cex.axis=1,col.axis="darkblue",las=1)
mtext("Smoothed Monthly Anomaly", side=2, line=2.2, cex=0.8,col="darkblue")


barplot(height=smoothed.indices$ao,
				col=ifelse(smoothed.indices$ao > 0, "dodgerblue", "tomato1"),
				border=ifelse(smoothed.indices$ao > 0, "dodgerblue", "tomato1"),
				axes=FALSE, ylim=c(-1.5,1.5), main= "Arctic Oscillation (AO)",col.main = "darkblue" )
abline(v=bar.ticks$x.tick,col="darkblue",lty=2)
abline(h=0,col="darkblue")
text(bar.ticks$x.tick,rep(par("usr")[3],dim(bar.ticks)[1]),bar.ticks$year,xpd=NA,col="darkblue", cex = 1,adj=c(0.5,1))
axis(2,cex.axis=1,col.axis="darkblue",las=1)
mtext("Smoothed Monthly Anomaly", side=2, line=2.2, cex=0.8,col="darkblue")


dev.off()



png(filename = "OUTPUT//LargeScaleIndex_Comparisons/ONIvsMEI_Starting1980.png",
		width = 480*4.5, height = 480*3.5, units = "px", pointsize = 14*3.5, bg = "white",  res = NA)

plot(1:5,1:5,type="n",xlim= c(1980,2025),ylim=c(-2.5,2.5),xlab="Year",ylab="Smoothed Monthly Anomaly",
		 bty="n",main = "Comparing Alternative Niño Indices")
abline(h=0,col="red",lwd=2)
lines(smoothed.indices$year,smoothed.indices$mei, col="darkblue",type="l",lwd=2)
lines(smoothed.indices$year,smoothed.indices$oni,col="red",type="l",lwd=2)

legend("bottom",legend=c("Multivariate El Niño/Southern Oscillation\n(ENSO) Index (MEI)",
											"Oceanographic Niño Index (ONI)"),
			 lty=1,lwd=4,col=c("darkblue","red"),bty="n")

dev.off()
