# GENERATE SHAPEFILES (*.stl) FOR 3D PRINTS

#load packages
library(tidyverse)
library(pacea) # use this as the data source
# pacea details are here https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_PACEA_Package

# get custom functions from the FigRs repo at https://github.com/SOLV-Code/FigRs
# 3D printing code and steps are summarized here: https://github.com/SOLV-Code/FigRs/tree/master/3D%20Prints
# the stl files generated here can be post-processed using Blender as per the tips there
# NOTE: Code for other series is there too (e.g., Atmospheric CO2)

source("https://raw.githubusercontent.com/SOLV-Code/FigRs/master/3D%20Prints/Time%20Series/FUNCTION_r2stlMOD.R")
source("https://raw.githubusercontent.com/SOLV-Code/FigRs/master/3D%20Prints/Time%20Series/FUNCTION_ts2persp.R")



if(!dir.exists("OUTPUT/SourcesFor3DPrints")){dir.create("OUTPUT/SourcesFor3DPrints")}


# ----------------------------------------------------------------------------------
# Smoothed PDO series
start.yr <- 1980
end.yr <- 2023
smoother.span <- 1/35 # f value for lowess()

pdo.ts <- ts(pdo %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12)
pdo.ts
pdo.lowess <- lowess(pdo.ts,f=smoother.span)
pdo.lowess
plot(pdo.lowess, type="l", col="dodgerblue", bty="n",axes=TRUE,xlab="Year", ylab="PDO Anomaly (Lowess Smoothed)")
abline(h=0,col="red")

# use only first smoothed value from each year
# to work with default dimension of generated surfaces
jan.idx <- c(TRUE,rep(FALSE,11))
lines(pdo.lowess$x[jan.idx],pdo.lowess$y[jan.idx], col="red")


# change to difference from lowest value (plus a base of 5%) and
pdo.lowess.adj <- pdo.lowess$y[jan.idx] - min(1.05* pdo.lowess$y[jan.idx])
pdo.lowess.adj

#rescale to a max height of some specified units relative to the 4 grid cells/year
pdo.lowess.adj <- pdo.lowess.adj/max(pdo.lowess.adj)*80

# convert time series to surface coordinates
pdo_persp <- ts2persp(pdo.lowess.adj)

# plot surface
persp(x=1:dim(pdo_persp)[1],y=1:dim(pdo_persp)[2],z=pdo_persp,theta=90,phi=25, zlim=c(0,max(pdo_persp)), scale=FALSE)

# scale to determine size of eventual object (2 = half of default size)
scalar <- 1

# create stl file
r2stl.mod(x=c(1:dim(pdo_persp)[1])/scalar,
					y=c(1:dim(pdo_persp)[2]), #/scalar,
					z=pdo_persp/scalar,
					filename="OUTPUT/SourcesFor3DPrints/PDO_SmoothedAnomalies_1980to2023.stl",
					show.persp=TRUE,z.expand=TRUE,
					min.height=0.008)



# ----------------------------------------------------------------------------------
# Smoothed NPGO series
start.yr <- 1980
end.yr <- 2023
smoother.span <- 1/35 # f value for lowess()

npgo.ts <- ts(npgo %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12)
npgo.ts
npgo.lowess <- lowess(npgo.ts,f=smoother.span)
npgo.lowess
plot(npgo.lowess, type="l", col="dodgerblue", bty="n",axes=TRUE,xlab="Year", ylab="NPGO Anomaly (Lowess Smoothed)")
abline(h=0,col="red")

# use only first smoothed value from each year
# to work with default dimension of generated surfaces
jan.idx <- c(TRUE,rep(FALSE,11))
lines(npgo.lowess$x[jan.idx],npgo.lowess$y[jan.idx], col="red")


# change to difference from lowest value (plus a base of 5%) and
npgo.lowess.adj <- npgo.lowess$y[jan.idx] - min(1.05* npgo.lowess$y[jan.idx])
npgo.lowess.adj

#rescale to a max height of some specified units relative to the 4 grid cells/year
npgo.lowess.adj <- npgo.lowess.adj/max(npgo.lowess.adj)*80

# convert time series to surface coordinates
npgo_persp <- ts2persp(npgo.lowess.adj)

# plot surface
persp(x=1:dim(npgo_persp)[1],y=1:dim(npgo_persp)[2],z=npgo_persp,theta=90,phi=25, zlim=c(0,max(npgo_persp)), scale=FALSE)

# scale to determine size of eventual object (2 = half of default size)
scalar <- 1

# create stl file
r2stl.mod(x=c(1:dim(npgo_persp)[1])/scalar,
					y=c(1:dim(npgo_persp)[2]), #/scalar,
					z=npgo_persp/scalar,
					filename="OUTPUT/SourcesFor3DPrints/NPGO_SmoothedAnomalies_1980to2023.stl",
					show.persp=TRUE,z.expand=TRUE,
					min.height=0.008)



# ----------------------------------------------------------------------------------
# Smoothed ONI  series
start.yr <- 1980
end.yr <- 2023
smoother.span <- 1/35 # f value for lowess()

oni.ts <- ts(oni %>% dplyr::filter(year>=start.yr, year <= end.yr) %>% select(anomaly) ,start = c(start.yr,1),freq=12)
oni.ts
oni.lowess <- lowess(oni.ts,f=smoother.span)
oni.lowess
plot(oni.lowess, type="l", col="dodgerblue", bty="n",axes=TRUE,xlab="Year", ylab="ONI Anomaly (Lowess Smoothed)")
abline(h=0,col="red")

# use only first smoothed value from each year
# to work with default dimension of generated surfaces
dec.idx <- c(rep(FALSE,11),TRUE) # do dec to pick up recent increase in 2023
lines(oni.lowess$x[dec.idx],oni.lowess$y[dec.idx], col="red")


# change to difference from lowest value (plus a base of 5%) and
oni.lowess.adj <- oni.lowess$y[dec.idx] - min(1.05* oni.lowess$y[dec.idx])
oni.lowess.adj

#rescale to a max height of some specified units relative to the 4 grid cells/year
oni.lowess.adj <- oni.lowess.adj/max(oni.lowess.adj)*80

# convert time series to surface coordinates
oni_persp <- ts2persp(oni.lowess.adj)

# plot surface
persp(x=1:dim(oni_persp)[1],y=1:dim(oni_persp)[2],z=oni_persp,theta=90,phi=25, zlim=c(0,max(oni_persp)), scale=FALSE)

# scale to determine size of eventual object (2 = half of default size)
scalar <- 1

# create stl file
r2stl.mod(x=c(1:dim(oni_persp)[1])/scalar,
					y=c(1:dim(oni_persp)[2]), #/scalar,
					z=oni_persp/scalar,
					filename="OUTPUT/SourcesFor3DPrints/ONI_SmoothedAnomalies_1980to2023.stl",
					show.persp=TRUE,z.expand=TRUE,
					min.height=0.008)








