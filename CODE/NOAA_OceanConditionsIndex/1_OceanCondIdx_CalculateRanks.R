# Calculate ranks, mean of ranks and mean of mean rank
# Doing alternative versions:
# - V1: all indicators
# - V2: Climate and Atmospheric Indicators only
# - v3: Local physical indicators only
# - V4: All Physical indicators
# - v5: Biological indicators only

# V1 is the one used in the official stoplight
# at https://www.fisheries.noaa.gov/west-coast/science-data/ocean-conditions-indicators-trends)


# TO DO
# - improve plots (use colour scheme from WSP status plots)


library(tidyverse)



oci.src <- read_csv("DATA/NOAA_OceanConditionsIndex/NOAAOceanCond_DATA.csv",comment = "#")

oci.src

# check ranking function
# this matches the values on the website graphic
# implies that lower value = better (lower values get higher ranks)
# how to handle ties? (especially in mean ranks?)
# the ONI variable has a tie for 1999 and 2000, and the rankings on the website correspond to
# ties.method = "minimum"
rank(oci.src$PDOSumDecToMarch,ties.method = "min",na.last = TRUE)


names(oci.src)

# keep the rank calcs separate, in case want to invert order for some of them later
oci.out <- oci.src %>% mutate(Rank.PDOSumDecToMarch = rank(PDOSumDecToMarch,ties.method = "min",na.last = TRUE),
															Rank.PDOSumMayToSep = rank(PDOSumMayToSep,ties.method = "min",na.last = TRUE),
															Rank.ONIAvgJanToJun = rank(ONIAvgJanToJun,ties.method = "min",na.last = TRUE),
															Rank.SST7BuoysMeanMayToSep = rank(SST7BuoysMeanMayToSep,ties.method = "min",na.last = TRUE),
															Rank.Upper20mTempAvgNovToMar = rank(Upper20mTempAvgNovToMar,ties.method = "min",na.last = TRUE),
															Rank.Upper20mTempAvgMayToSep = rank(Upper20mTempAvgMayToSep,ties.method = "min",na.last = TRUE),
															Rank.DeepTempAvgMayToSep = rank(DeepTempAvgMayToSep,ties.method = "min",na.last = TRUE),
															Rank.DeepSalinityAvgMayToSept = rank(-DeepSalinityAvgMayToSept,ties.method = "min",na.last = TRUE), # OTHER DIRECTION
															Rank.CopeRichAnom = rank(CopeRichAnom,ties.method = "min",na.last = TRUE),
															Rank.NthCopeMassAnom = rank(-NthCopeMassAnom,ties.method = "min",na.last = TRUE), # OTHER DIRECTION
															Rank.SthCopeMassAnom = rank(SthCopeMassAnom,ties.method = "min",na.last = TRUE),
															Rank.BiolTransition = rank(BiolTransition,ties.method = "min",na.last = TRUE), # Some are 1 off?
															Rank.NearIplanktonJantoMar = rank(-NearIplanktonJantoMar,ties.method = "min",na.last = TRUE),  # OTHER DIRECTION
															Rank.NearOffIplanktonCommIdxJanToMar = rank(NearOffIplanktonCommIdxJanToMar,ties.method = "min",na.last = TRUE),
															Rank.CkJuvCtJune = rank(-CkJuvCtJune,ties.method = "min",na.last = TRUE),  # OTHER DIRECTION
															Rank.CoJuvCtJune = rank(-CoJuvCtJune,ties.method = "min",na.last = TRUE) ) %>%  # OTHER DIRECTION
											rowwise() %>%
											mutate(MeanRank.ClimateAtmos =round(mean(c_across(Rank.PDOSumDecToMarch:Rank.ONIAvgJanToJun)),2),
														 MeanRank.RegPhys = round(mean(c_across(Rank.SST7BuoysMeanMayToSep:Rank.DeepSalinityAvgMayToSept) ),2),
														 MeanRank.AllPhys = round(mean(c_across(Rank.PDOSumDecToMarch:Rank.DeepSalinityAvgMayToSept) ),2),
														 MeanRank.Bio = round(mean(c_across(Rank.CopeRichAnom:Rank.CoJuvCtJune) ),2),
														 MeanRank.All = round(mean(c_across(Rank.PDOSumDecToMarch:Rank.CoJuvCtJune) ),2),
														 )


oci.out$RankOfMeanRank = rank(oci.out$MeanRank.All)

head(oci.out)



write_csv(oci.out,"DATA/NOAA_OceanConditionsIndex/NOAAOceanCond_DATAwithRanks.csv")



##############################
# Comparison plots

ranks.range <- range(oci.out$RankOfMeanRank)
ranks.range

rank.ticks <- (ranks.range[2]-ranks.range[1]) * c(1/3,2/3)
rank.ticks

png(filename = "OUTPUT/NOAA_OceanConditionsIndex/MeanRankComparison.png",
		width = 480*4, height = 480*4.2, units = "px",
		pointsize = 14*3.4, bg = "white",  res = NA)


plot(oci.out$Year,oci.out$RankOfMeanRank,type="o", pch=19,col="darkblue",bty="n",
		 ylim = rev(ranks.range),las=1,xlab="Year",ylab = "Rank",lwd=3,main =
		 	"Mean Rank Comparisons")
abline(h=rank.ticks[1],col="green",lwd=2)
abline(h=rank.ticks[2],col="red",lwd=2)


lines(oci.out$Year,oci.out$MeanRank.ClimateAtmos,type="o",col="darkblue",pch=3)
lines(oci.out$Year,oci.out$MeanRank.RegPhys ,type="o",col="darkblue",pch=4)
lines(oci.out$Year,oci.out$MeanRank.Bio ,type="o",col="darkblue",pch=8)

lines(oci.out$Year,oci.out$RankOfMeanRank,type="o", pch=19,col="darkblue",lwd=3)

legend(2015,0,legend = c("All","Climate","Physical", "Biol" ),
			 pch = c(19,3,4,8),col="darkblue",bty="n",cex=0.8)

dev.off()



####################################


plot(oci.out$MeanRank.Bio,oci.out$MeanRank.ClimateAtmos,
		 type="p",col="darkblue",pch=19)
abline(0,1)

plot(oci.out$MeanRank.Bio,oci.out$MeanRank.RegPhys,
		 type="p",col="darkblue",pch=19)
abline(0,1)

plot(oci.out$MeanRank.ClimateAtmos,oci.out$MeanRank.RegPhys,
		 type="p",col="darkblue",pch=19)
abline(0,1)



# color fade

n.obs <- length(oci.out$Year)
n.obs
bg.fade <- c(rep(0,8),seq(0,1, length.out=n.obs-8))
bg.fade
bg.col <- rgb(1, 0,0,bg.fade) #
bg.col
#bg.col <- tail(bg.col,n.obs)


png(filename = "OUTPUT/NOAA_OceanConditionsIndex/MeanRankScatterplot.png",
		width = 480*4, height = 480*4.2, units = "px",
		pointsize = 14*3.9, bg = "white",  res = NA)
par(mfrow=c(2,2))
par(mai=c(5,5,4,2))


plot(oci.out$MeanRank.Bio,oci.out$MeanRank.ClimateAtmos,
		 xlab = "Biological Indicators\n(Mean Rank)",
		 ylab = "Climate/Atmosphere Indicators\n(Mean Rank)",
		 bty="n",axes=TRUE,pch=21,col="darkblue",bg="lightblue",
		 cex=1.3, #xlim = c(-3,3),ylim = c(-3,3),
		 xpd=NA,
		 main="Bio vs. Climate/Atmos")

abline(0,1,col="red",lty=2)
points(oci.out$MeanRank.Bio,oci.out$MeanRank.ClimateAtmos,type = "p",
			 pch=21,col="darkblue",bg="white",cex=1.2)
points(oci.out$MeanRank.Bio,oci.out$MeanRank.ClimateAtmos,type = "p",
			 pch=21,col="darkblue",bg=bg.col,cex=1.2)
mtext("Best",side=3,at = par("usr")[1],adj=0)
mtext("Worst",side=3,at = par("usr")[2],adj=0,xpd=NA)
mtext("Best",side=4,at = par("usr")[3],adj=c(0),las=1)

idx.2022 <- oci.out$Year == 2022
pt.2022 <- c(oci.out$MeanRank.Bio[idx.2022],
						 oci.out$MeanRank.ClimateAtmos[idx.2022])
points(pt.2022[1],pt.2022[2], pch=19,col="red",cex=1.8)
text(pt.2022[1],pt.2022[2],labels = "2022",col="red",cex=1,adj=-0.3,xpd=NA)



plot(oci.out$MeanRank.Bio,oci.out$MeanRank.RegPhys,
		 xlab = "Biological Indicators\n(Mean Rank)",
		 ylab = "Regional Physical Indicators\n(Mean Rank)",
		 bty="n",axes=TRUE,pch=21,col="darkblue",bg="lightblue",
		 cex=1.3, #xlim = c(-3,3),ylim = c(-3,3),
		 xpd=NA,
		 main="Bio vs. Regional Physical")

abline(0,1,col="red",lty=2)
points(oci.out$MeanRank.Bio,oci.out$MeanRank.RegPhys,type = "p",
			 pch=21,col="darkblue",bg="white",cex=1.2)
points(oci.out$MeanRank.Bio,oci.out$MeanRank.RegPhys,type = "p",
			 pch=21,col="darkblue",bg=bg.col,cex=1.2)
mtext("Best",side=3,at = par("usr")[1],adj=0)
mtext("Worst",side=3,at = par("usr")[2],adj=0,xpd=NA)
mtext("Best",side=4,at = par("usr")[3],adj=c(0),las=1)

idx.2022 <- oci.out$Year == 2022
pt.2022 <- c(oci.out$MeanRank.Bio[idx.2022],
						 oci.out$MeanRank.RegPhys[idx.2022])
points(pt.2022[1],pt.2022[2], pch=19,col="red",cex=1.8)
text(pt.2022[1],pt.2022[2],labels = "2022",col="red",cex=1,adj=1.3,xpd=NA)



plot(oci.out$MeanRank.Bio,oci.out$MeanRank.AllPhys,
		 xlab = "Biological Indicators\n(Mean Rank)",
		 ylab = "All Physical Indicators\n(Mean Rank)",
		 bty="n",axes=TRUE,pch=21,col="darkblue",bg="lightblue",
		 cex=1.3, #xlim = c(-3,3),ylim = c(-3,3),
		 xpd=NA,
		 main="Bio vs. All Physical")

abline(0,1,col="red",lty=2)
points(oci.out$MeanRank.Bio,oci.out$MeanRank.AllPhys,type = "p",
			 pch=21,col="darkblue",bg="white",cex=1.2)
points(oci.out$MeanRank.Bio,oci.out$MeanRank.AllPhys,type = "p",
			 pch=21,col="darkblue",bg=bg.col,cex=1.2)
mtext("Best",side=3,at = par("usr")[1],adj=0)
mtext("Worst",side=3,at = par("usr")[2],adj=0,xpd=NA)
mtext("Best",side=4,at = par("usr")[3],adj=c(0),las=1)

idx.2022 <- oci.out$Year == 2022
pt.2022 <- c(oci.out$MeanRank.Bio[idx.2022],
						 oci.out$MeanRank.AllPhys[idx.2022])
points(pt.2022[1],pt.2022[2], pch=19,col="red",cex=1.8)
text(pt.2022[1],pt.2022[2],labels = "2022",col="red",cex=1,adj=1.3,xpd=NA)



plot(oci.out$MeanRank.RegPhys,oci.out$MeanRank.ClimateAtmos,
		 xlab = "Regional Physical Indicators\n(Mean Rank)",
		 ylab = "Climate/Atmosphere Indicators\n(Mean Rank)",
		 bty="n",axes=TRUE,pch=21,col="darkblue",bg="lightblue",
		 cex=1.3, #xlim = c(-3,3),ylim = c(-3,3),
		 xpd=NA,
		 main="Bio vs. Climate/Atmos")

abline(0,1,col="red",lty=2)
points(oci.out$MeanRank.RegPhys,oci.out$MeanRank.ClimateAtmos,type = "p",
			 pch=21,col="darkblue",bg="white",cex=1.2)
points(oci.out$MeanRank.RegPhys,oci.out$MeanRank.ClimateAtmos,type = "p",
			 pch=21,col="darkblue",bg=bg.col,cex=1.2)
mtext("Best",side=3,at = par("usr")[1],adj=0)
mtext("Worst",side=3,at = par("usr")[2],adj=0,xpd=NA)
mtext("Best",side=4,at = par("usr")[3],adj=c(0),las=1)

idx.2022 <- oci.out$Year == 2022
pt.2022 <- c(oci.out$MeanRank.RegPhys[idx.2022],
						 oci.out$MeanRank.ClimateAtmos[idx.2022])
points(pt.2022[1],pt.2022[2], pch=19,col="red",cex=1.8)
text(pt.2022[1],pt.2022[2],labels = "2022",col="red",cex=1,adj=1.3,xpd=NA)

dev.off()




