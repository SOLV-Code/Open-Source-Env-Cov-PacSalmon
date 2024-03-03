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
		pointsize = 14*3.9, bg = "white",  res = NA)

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

