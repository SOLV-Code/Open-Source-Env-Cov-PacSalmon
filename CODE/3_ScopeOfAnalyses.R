# Comparing the scope of the analyses




library(tidyverse)

# currently no standard piece in the
# entries to extract this from, so generating
# a hard-wired version for now.

scope.df <- data.frame(
	DataSet = c("DFO_FraserSockeyeFC","Petermanetal2009","Chascoetal2021", "NOAA_OceanCondIndex"),
	Stocks = c(28,120,1,0.2),
	EnvCovar = c(7,3,40,8),
	UpToDate = c("Most","None","Some","All")
)

scope.df



png(filename = "OUTPUT/ScopeOfAnalyses/ScopeAndCurrentStatus.png",
		width = 480*4, height = 480*4.2, units = "px",
		pointsize = 14*5.6, bg = "white",  res = NA)
par(mai=c(5.3,5.3,4.4,2.5))

plot(log(scope.df$EnvCovar),log(scope.df$Stocks),axes = FALSE,bty="n",
		 xlab = "Environmental Covariates",xlim=c(0,4),
		 ylab = "Stocks",ylim=c(-2,5),
		 main = "Scope and Current Status\nof Datasets")

stk.ticks <- c(0.2,1,10,30,100)
stk.ticks.labels <- c("None*",1,10,30,100)
axis(2,at = log(stk.ticks),labels = stk.ticks.labels, las=1 )
abline(h=log(stk.ticks),col="darkgrey",lty=1)

covar.ticks <- c(1,3,10,40)
axis(1,at = log(covar.ticks),labels = covar.ticks, las=1 )
abline(v=log(covar.ticks),col="darkgrey",lty=1)



text(log(scope.df$EnvCovar),log(scope.df$Stocks),scope.df$DataSet,
		 adj=c(1.05,-0.4),
		 col="darkblue",cex = 0.8,xpd=NA)

legend("topright",title = "Env. covars\nup to date?",
			 legend = c("None","Some","Most","All"),
			 bty="o",cex=0.8, box.col="white",
			 pch = 21,col="darkblue", pt.cex =1.2,
			 pt.bg=c("white","lightgrey","lightblue","darkblue")

)

none.idx <- scope.df$UpToDate == "None"
some.idx <- scope.df$UpToDate == "Some"
most.idx <- scope.df$UpToDate == "Most"
all.idx <- scope.df$UpToDate == "All"


points(log(scope.df$EnvCovar[none.idx]),log(scope.df$Stocks[none.idx]),
			 pch=21,col="darkblue",bg="white",cex=2)

points(log(scope.df$EnvCovar[some.idx]),log(scope.df$Stocks[some.idx]),
			 pch=21,col="darkblue",bg="lightgrey",cex=2)

points(log(scope.df$EnvCovar[most.idx]),log(scope.df$Stocks[most.idx]),
			 pch=21,col="darkblue",bg="lightblue",cex=2)

points(log(scope.df$EnvCovar[all.idx]),log(scope.df$Stocks[all.idx]),
			 pch=21,col="darkblue",bg="darkblue",cex=2)


dev.off()
