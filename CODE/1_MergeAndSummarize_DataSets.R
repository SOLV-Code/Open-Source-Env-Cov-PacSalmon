# MERGE AND SUMMARIZE DATA SETS


library(tidyverse)

# -------------------------------------------
# Create merged data set
# -------------------------------------------

merged.data <- read_csv("DATA/DFO_FraserSockeyeForecast/GENERATED_COVARS_DFOFraserRiverForecasts.csv") %>%
							full_join(read_csv("DATA/NOAA_OceanConditionsIndex/NOAAOceanCond_DATA.csv",comment = "#"),
												by="Year") %>%
							full_join(read_csv("DATA/Chascoetal2021_SnakeRiverCk/GENERATED_COVARS_Chascoetal2021Paper.csv",comment = "#"),
												by="Year")


head(merged.data)



# as per https://stackoverflow.com/questions/72304594/added-commented-section-to-output-csv-with-write-csv
merged.filename <- "OUTPUT/Merged_CovariateSet.csv"

comment.text1 <- paste("# Merged set of all available records in the OSEC-PS repository")
comment.text2 <- paste("# Variable descriptions and source data available at https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon")
comment.text3 <- paste("# File generated on", format(Sys.time(), "%a %b %e %H:%M:%S %Y"))


write_lines(comment.text1, merged.filename)
write_lines(comment.text2, merged.filename, append = TRUE)
write_lines(comment.text3, merged.filename, append = TRUE)
merged.data |> colnames() |> paste0(collapse = ",") |> write_lines(merged.filename, append = TRUE)
write_csv(merged.data, merged.filename, append = TRUE)



# -------------------------------------------
# Create Summary Table
# -------------------------------------------


var.lookup <- read_csv("DATA/LookUp_VariableDescriptions.csv",comment = "#") %>% select(-Description)
head(var.lookup)


num.obs <- merged.data %>% summarize(across(-Year, ~ sum(!is.na(.x))) ) %>% t() %>% as.data.frame() %>%
	rownames_to_column("Variable") %>% dplyr::rename(NumObs = V1)


var.summary.out <- var.lookup %>% left_join(num.obs, by="Variable")
write_csv(var.summary.out,"OUTPUT/SummaryOfVariables.csv")


# -------------------------------------------
# Create Overview Plot: Timeline of Available Data
# -------------------------------------------

datasets.list <- unique(var.lookup$DataSet)

yr.range <- c(1900,2030)
yr.ticks <- seq(1900,2030, by=20)

n.datasets <- length(datasets.list)
n.var.all <- dim(var.lookup)[1]
n.extrarows <- 2


png(filename = "OUTPUT/DataOverview_ALL.png",
		width = 480*4, height = 480*4.5, units = "px", pointsize = 14*3.5, bg = "white",  res = NA)
par(mai=c(0.3,8.5,1.5,1))


plot(1:5,1:5,type="n",xlim = yr.range, ylim=c(2*n.datasets + n.var.all + n.extrarows ,0.7),
		 xlab="",ylab="",axes=FALSE)
axis(3,at=yr.ticks)
#title(main = "Availability of Spawner-Recruit Data",cex.main=1)
abline(v=yr.ticks,col="darkgrey",lty=1)
abline(v=2023,col="red",lty =2, lwd=3)

y.idx <- 2


for(set.plot in datasets.list ){


	print("------------")
	print(set.plot)

	var.out.sub  <- var.summary.out  %>% dplyr::filter(DataSet == set.plot) %>%
		mutate(Label = paste0(Variable," (",NumObs,")"))

	var.list <- var.out.sub %>% select(Variable) %>% unlist()
	var.labels <- var.out.sub %>% select(Label) %>% unlist()


	print(var.list)
	print(var.labels)

	n.var <- length(var.list)


	text(par("usr")[1]-25,y.idx-1.5,labels = set.plot, font =2, adj=0,xpd =NA)
	axis(2,at=y.idx:(y.idx + n.var - 1),labels = var.labels,las=2,cex.axis =0.6,lwd=3)

	abline(h=(y.idx:(y.idx + n.var -1)),col="darkgrey")



	for(i in 1:n.var){ #

print("------------------------------------------")

		print(var.list[i])
		data.sub <- merged.data %>% select(all_of(c("Year",var.list[i])))

		names(data.sub)[2] <- "Value"

		print(data.sub)

		data.yrs.f <- data.sub %>% dplyr::filter( !is.na(Value)) %>% select(Year) %>% unlist()
		data.yrs.f

	  if(length(data.yrs.f)>0){points(data.yrs.f,rep(y.idx+ i -1 ,length(data.yrs.f)),
	  																col="darkblue", pch=21,bg="lightblue",cex=0.7)}

		# add the start year
		# if(length(data.yrs.o)>0 | length(data.yrs.f)>0){
		#        segments(x0 = stk.strtyr-0.5,
		#                 y0 = y.idx + i - 0.5 ,
		#                 x1 = stk.strtyr -0.5,
		#                 y1 = y.idx + i - 1.5,
		#                 col="red",lwd=2)
		#    }

	} # end looping through variables

	y.idx <- y.idx + n.var +2



} # end looping through datasets




dev.off()

















