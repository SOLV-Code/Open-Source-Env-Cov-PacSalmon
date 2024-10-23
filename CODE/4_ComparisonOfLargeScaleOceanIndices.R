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



raw.series <- data.frame(year = pdo %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(year) %>% unlist(),
												 month = pdo %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(month) %>% unlist(),
												 pdo = pdo %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) %>% unlist(),
												 mei = mei %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) %>% unlist() ,
												 ao = ao %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) %>% unlist(),
												 npgo = npgo %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) %>% unlist(),
												 npi = npi_monthly_mod %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) %>% unlist(),
												 oni = oni %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) %>% unlist()
)
head(raw.series)


meanJanToMarch.series <- raw.series %>% dplyr::filter(month %in% 1:3) %>%
													group_by(year) %>%
													summarise(across(pdo:oni, mean))

head(meanJanToMarch.series)



smoothed.indices <- data.frame(year = pdo.lowess$x,
															 pdo = pdo.lowess$y,
															 mei = lowess(ts(mei %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12),
															 						 f= smoother.span)$y,
															 ao = lowess(ts(ao %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12),
															 						 f= smoother.span)$y,
															 npgo = lowess(ts(npgo %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12),
															 						 f= smoother.span)$y,
															 npi = lowess(ts(npi_monthly_mod %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly_bymonth) ,start = c(start.yr,1),freq=12),
															 						 f= smoother.span)$y,
															 oni = lowess(ts(oni %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12),
															 						 f= smoother.span)$y
															 )

smoothed.indices


# as per https://stackoverflow.com/questions/72304594/added-commented-section-to-output-csv-with-write-csv
smoothed.filename <- "OUTPUT/Smoothed_LargeScaleIndices_FromPacea.csv"

comment.text1 <- paste("# SMOOTHED VERSION OF MONTHLY ANOMALIES OF LARGE-SCALE OCEAN INDICES")
comment.text2 <- paste("# Variable descriptions and source data available at https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon")
comment.text3 <- paste("# File generated on", format(Sys.time(), "%a %b %e %H:%M:%S %Y"))
comment.text4 <- paste("# Extracted monthly anomalies from the pacea package and then converted to time series with ts()")
comment.text5 <- paste("# and applied loess() smoothing with f=1/35")
comment.text6 <- paste("# Source data: https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_PACEA_Package")
comment.text7 <- paste("# Processing script:https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/4_ComparisonOfLargeScaleOceanIndices.R")

write_lines(comment.text1, smoothed.filename)
write_lines(comment.text2, smoothed.filename, append = TRUE)
write_lines(comment.text3, smoothed.filename, append = TRUE)
write_lines(comment.text4, smoothed.filename, append = TRUE)
write_lines(comment.text5, smoothed.filename, append = TRUE)
write_lines(comment.text6, smoothed.filename, append = TRUE)
write_lines(comment.text7, smoothed.filename, append = TRUE)
smoothed.indices |> colnames() |> paste0(collapse = ",") |> write_lines(smoothed.filename, append = TRUE)
write_csv(smoothed.indices, smoothed.filename, append = TRUE)


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
lines(smoothed.indices$year,smoothed.indices$npi,col="red")


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
lines(smoothed.indices$year,smoothed.indices$npi,col="red")


#----------------------------------------------------------------------------------------------------
# Plot for notes page
ylim.use <- c(-2.5,2.5)


# PLOT 1: OVERVIEW OF 6 SERIES


png(filename = "OUTPUT/LargeScaleIndex_Comparisons/OverviewOfIndicesStarting1980.png",
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

barplot(height=smoothed.indices$npi,
				col=ifelse(smoothed.indices$npi > 0, "dodgerblue", "tomato1"),
				border=ifelse(smoothed.indices$npi > 0, "dodgerblue", "tomato1"),
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


#####################################
# PLOT 2: ONI vs MEI


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



#######################################
# PLOT 3: Quick Check: does it matter which month you extract for smoothed indices -> not really

num.rows <- dim(smoothed.indices)[1]

ylim.use <- c(-2.5,1.5) #range(smoothed.indices$pdo)
xlim.use <- range(floor(smoothed.indices$year))

par(mfrow=c(3,2))

for(var.do in names(smoothed.indices)[-1]){

plot(1:5,1:5, type="n", xlim=xlim.use, ylim = ylim.use, axes=FALSE,xlab = "",ylab="", main = var.do)

for(i in 1:12){

df.use <- smoothed.indices[seq(i, num.rows, 12),c("year",var.do)] %>%
						mutate(year= floor(year))
print(head(df.use))
lines(df.use$year,df.use[,var.do] , col="darkgrey")
}


}





#####################################
# PLOT 4: OVERLAY (using smoothed values for Jan) -> tried variations, but not really clear once you have >2 series.

smoothed.jan <- smoothed.indices[seq(1, num.rows,12),]

plot(smoothed.jan$year, smoothed.jan$pdo,
		 type="n",col="darkblue", pch=19, bty="n", las=1,
		 ylim=c(-2.5,2.5),
		 xlab= "Year", ylab = "Anomaly",cex.axis=1.2,cex=1.5)
abline(h=0,col="red")
cex.use <- 0.95
lines(smoothed.jan$year, smoothed.jan$pdo,type="o",col="darkblue", bg="lightblue",pch=21,cex=cex.use)
lines(smoothed.jan$year, smoothed.jan$oni,type="o",col="darkblue", bg="white",pch=21,cex=cex.use)
lines(smoothed.jan$year, smoothed.jan$npgo,type="o",col="darkblue", bg="red",pch=21,cex=cex.use)

# Do it in panels with pdo as base

png(filename = "OUTPUT//LargeScaleIndex_Comparisons/IndexComparison_Timeline_4Panels.png",
		width = 480*5.5, height = 480*3.5, units = "px", pointsize = 14*3.5, bg = "white",  res = NA)


par(mfrow=c(2,2))

plot(smoothed.jan$year, smoothed.jan$pdo,
		 type="n",col="darkblue", pch=19, bty="n", las=1,
		 ylim=c(-2.5,2.5),
		 xlab= "Year", ylab = "Anomaly",
		 main= "Smoothed Anomalies: PDO vs. NPGO",
		 cex.axis=1.2,cex=1.5)
abline(h=0,col="red")
cex.use <- 0.95
lines(smoothed.jan$year, smoothed.jan$pdo,type="o",col="darkblue", bg="lightblue",pch=21,cex=cex.use)
lines(smoothed.jan$year, smoothed.jan$npgo,type="o",col="darkblue", bg="red",pch=21,cex=cex.use)
legend(1980,3,c("PDO","NPGO"),pch=21,col="darkblue",pt.bg=c("lightblue","red"),bty="n",ncol=2,xpd=NA)

plot(smoothed.jan$year, smoothed.jan$oni,
		 type="n",col="darkblue", pch=19, bty="n", las=1,
		 ylim=c(-2.5,2.5),
		 xlab= "Year", ylab = "Anomaly",
		 main= "Smoothed Anomalies: PDO vs. ONI",
		 cex.axis=1.2,cex=1.5)
abline(h=0,col="red")
cex.use <- 0.95
lines(smoothed.jan$year, smoothed.jan$pdo,type="o",col="darkblue", bg="lightblue",pch=21,cex=cex.use)
lines(smoothed.jan$year, smoothed.jan$oni,type="o",col="darkblue", bg="red",pch=21,cex=cex.use)
legend(1980,3,c("PDO","ONI"),pch=21,col="darkblue",pt.bg=c("lightblue","red"),bty="n",ncol=2,xpd=NA)



plot(smoothed.jan$year, smoothed.jan$mei,
		 type="n",col="darkblue", pch=19, bty="n", las=1,
		 ylim=c(-2.5,2.5),
		 xlab= "Year", ylab = "Anomaly",
		 main= "Smoothed Anomalies: PDO vs. MEI",
		 cex.axis=1.2,cex=1.5)
abline(h=0,col="red")
cex.use <- 0.95
lines(smoothed.jan$year, smoothed.jan$pdo,type="o",col="darkblue", bg="lightblue",pch=21,cex=cex.use)
lines(smoothed.jan$year, smoothed.jan$mei,type="o",col="darkblue", bg="red",pch=21,cex=cex.use)
legend(1980,3,c("PDO","MEI"),pch=21,col="darkblue",pt.bg=c("lightblue","red"),bty="n",ncol=2,xpd=NA)



# just for check
plot(smoothed.jan$year, smoothed.jan$npi,
		 type="n",col="darkblue", pch=19, bty="n", las=1,
		 ylim=c(-2.5,2.5),
		 xlab= "Year", ylab = "Anomaly",
		 main= "Smoothed Anomalies: PDO vs. NPI",
		 cex.axis=1.2,cex=1.5)
abline(h=0,col="red")
cex.use <- 0.95
lines(smoothed.jan$year, smoothed.jan$pdo,type="o",col="darkblue", bg="lightblue",pch=21,cex=cex.use)
lines(smoothed.jan$year, smoothed.jan$npi,type="o",col="darkblue", bg="red",pch=21,cex=cex.use)
legend(1980,3,c("PDO","NPI"),pch=21,col="darkblue",pt.bg=c("lightblue","red"),bty="n",ncol=2,xpd=NA)

dev.off()





#############################################################################
# SCATTERPLOT SEQUENCE FROM RAW TO LOESS SMOOTHED

# always use PDO as the base

plot.list <- list(
	NPGO = "npgo",
	ONI = "oni",
	MEI = "mei",
	NPI = "npi")


for(plot.do in names(plot.list)){

var.plot <- plot.list[plot.do] %>% unlist()

print(plot.do)
print(var.plot)


png(filename = paste0("OUTPUT//LargeScaleIndex_Comparisons/IndexComparison_Scatterplot_Sequence_PDOvs",plot.do,".png"),
		width = 480*5.5, height = 480*2.5, units = "px", pointsize = 14*3.5, bg = "white",  res = NA)


par(mfrow=c(1,3))


# Panel 1: Raw Scatter Plot

plot(raw.series$pdo, raw.series %>% select(var.plot) %>% unlist(),
		 #ylim=c(-4.5,4.5),xlim=c(-4.5,4.5),
		 main="Raw Monthly Anomalies", col.main="darkblue",
		 type="p", col="blue",pch=21,bg="white", bty="n",
		 xlab="PDO",ylab = plot.do)
abline(h=0,col="red",lty=2)
abline(v=0,col="red",lty=2)
points(raw.series$pdo, raw.series %>% select(var.plot) %>% unlist(),
 col.main="darkblue",type="p", col="blue",pch=21,bg="white")


title(main = paste("PDO vs.",plot.do,paste(range(raw.series$year),collapse="-")),
			col.main="darkblue",
			outer=TRUE,line=-1)

# Panel 2: Winter Mean ScatterPlot

plot(meanJanToMarch.series$pdo, meanJanToMarch.series %>% select(var.plot) %>% unlist(),
		 #ylim=c(-4.5,4.5),xlim=c(-4.5,4.5),
		 main="Mean Jan-Mar Anomalies", col.main="darkblue",
		 type="p", col="blue",pch=21,bg="white", bty="n",
		 xlab="PDO",ylab = plot.do)
abline(h=0,col="red",lty=2)
abline(v=0,col="red",lty=2)
points(meanJanToMarch.series$pdo, meanJanToMarch.series %>% select(var.plot) %>% unlist(),
		 type="p", col="blue",pch=21,bg="white")


# Panel 3: Smoothed Anomalies scatter

# color fade
n.obs <- dim(smoothed.indices)[1]
n.fade <- 80
bg.fade <- c(rep(0,n.obs-n.fade),seq(0.025,1, length.out=n.fade))
bg.col <- rgb(1, 0, 0,bg.fade)
bg.col <- tail(bg.col,n.obs)


plot(smoothed.indices$pdo,
		 smoothed.indices %>% select(var.plot) %>% unlist(),
		 ylim=c(-2.5,2.5),xlim=c(-2.5,2.5),
		 main="Loess Smoothed Anomalies", col.main="darkblue",
		 type="o", col="darkblue",pch=21,bg="white", bty="n",
		 xlab="PDO",ylab = plot.do)

abline(h=0,col="red",lty=2)
abline(v=0,col="red",lty=2)


points(smoothed.indices$pdo,
		 smoothed.indices %>% select(var.plot) %>% unlist(),
		 type="o", col="darkblue",pch=21,bg="white")
points(smoothed.indices$pdo,
			 smoothed.indices %>% select(var.plot) %>% unlist(),
			 type="p", col="darkblue",pch=21,bg=bg.col)

jan.idx <- seq(1,dim(smoothed.indices)[1],by=12)
jan.idx

points(smoothed.indices$pdo[jan.idx],
			 smoothed.indices[jan.idx,] %>% select(var.plot) %>% unlist(),
			 type="p", col="darkblue",pch=21,bg="darkblue")


legend(1.8,2.5,
			 legend=c("Early","Recent","Jan"),
			 pch=c(21,21,21),
			 col="darkblue",
			 pt.bg= c("white","red","darkblue"),
			 bty="n",xpd=NA)


dev.off()






}

###########################################################################
# 3 Panel Plot

plot.list <- list(
	ONI = "oni",
	MEI = "mei",
	NPI = "npi")


png(filename = paste0("OUTPUT//LargeScaleIndex_Comparisons/IndexComparison_Scatterplot_3Panels.png"),
		width = 480*5.5, height = 480*2.5, units = "px", pointsize = 14*3.5, bg = "white",  res = NA)

par(mfrow=c(1,3))


for(plot.do in names(plot.list)){

	var.plot <- plot.list[plot.do] %>% unlist()

	print(plot.do)
	print(var.plot)

	# Panel  Smoothed Anomalies scatter

	# color fade
	n.obs <- dim(smoothed.indices)[1]
	n.fade <- 80
	bg.fade <- c(rep(0,n.obs-n.fade),seq(0.025,1, length.out=n.fade))
	bg.col <- rgb(1, 0, 0,bg.fade)
	bg.col <- tail(bg.col,n.obs)


	plot(smoothed.indices$pdo,
			 smoothed.indices %>% select(var.plot) %>% unlist(),
			 ylim=c(-2.5,2.5),xlim=c(-2.5,2.5),
			 main=paste("PDO vs.",plot.do), col.main="darkblue",
			 type="o", col="darkblue",pch=21,bg="white", bty="n",
			 xlab="PDO",ylab = plot.do)

	abline(h=0,col="red",lty=2)
	abline(v=0,col="red",lty=2)


	points(smoothed.indices$pdo,
				 smoothed.indices %>% select(var.plot) %>% unlist(),
				 type="o", col="darkblue",pch=21,bg="white")
	points(smoothed.indices$pdo,
				 smoothed.indices %>% select(var.plot) %>% unlist(),
				 type="p", col="darkblue",pch=21,bg=bg.col)

	jan.idx <- seq(1,dim(smoothed.indices)[1],by=12)
	jan.idx

	points(smoothed.indices$pdo[jan.idx],
				 smoothed.indices[jan.idx,] %>% select(var.plot) %>% unlist(),
				 type="p", col="darkblue",pch=21,bg="darkblue")





}


legend(1.8,2.5,
			 legend=c("Early","Recent","Jan"),
			 pch=c(21,21,21),
			 col="darkblue",
			 pt.bg= c("white","red","darkblue"),
			 bty="n",xpd=NA)

title(main = paste("Loess Smoothed Monthly Anomalies",paste(range(raw.series$year),collapse="-")),
			col.main="darkblue",
			outer=TRUE,line=-1)

	dev.off()


###############################################################


acf(raw.series$pdo)
acf(meanJanToMarch.series$pdo)
acf(smoothed.indices$pdo[jan.idx])

pacf(raw.series$pdo)
pacf(meanJanToMarch.series$pdo)
pacf(smoothed.indices$pdo)
pacf(smoothed.indices$pdo[jan.idx])



