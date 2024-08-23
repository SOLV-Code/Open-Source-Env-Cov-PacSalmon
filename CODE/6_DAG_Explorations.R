# Some light explorations of DAGs (causal inference diagrams)
# Background: https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/wiki/Causal-Inference


# install.packages("devtools")
library(devtools)
devtools::install_github("r-causal/ggdag")

library(ggdag)
library(ggplot2)


# Basic SR
dag.basic.sr <- dagify(
	Rec ~ Spn,
	Rec ~ Prod,
	Prod ~ Spn,
	exposure = "Spn",
	outcome = "Rec"
) %>%
	tidy_dagitty()

ggdag(dag.basic.sr) + theme_dag()


# 2 stage life-history SR
dag.2stages.sr <- dagify(
	Rec ~ Juv + MProd,
	Juv ~ Spn + FWProd,
	FWProd ~ Spn,
	exposure = "Spn",
	outcome = "Rec"
) %>%
	tidy_dagitty()

ggdag(dag.2stages.sr) + theme_dag()

png(filename = "OUTPUT/DAGs_WorkedExamples/SR_2Stages_DefaultPlot.png",
		width = 300, height = 300, units = "px", pointsize = 50, bg = "white",  res = NA)

ggdag(dag.2stages.sr) + theme_dag()

dev.off()




dag.2stages.sr %>%
	ggplot(aes(x = x, y = y, xend = xend, yend = yend)) +
	geom_dag_point(color = "orange") +
	geom_dag_edges_arc(edge_color = "blue", curvature = 0) +
	geom_dag_text(color = "black") +
	theme_dag()


# https://stackoverflow.com/questions/76653868/use-labels-with-ggdag-and-ggplot
#https://stackoverflow.com/questions/71441472/change-color-for-specific-nodes-in-ggdag/71441773#71441773


# 2 stage life-history SR



# Basic SR with latent and observed env. covars
# LCC1 = latent variable for coastal ocean condition in first year of ocean residence (i.e. ocean entry year)
# cc1a =  coastal sea surface temperature in spring
# cc1b =  coastal upwelling index in spring
# LIC0 =



dag.test<- dagify(
	Rec ~ Juv,
	Juv ~ Spn,
	Rec ~ LCC1,
	cc1a ~ LCC1,
	cc1b ~ LCC1,
	exposure = "Spn",
	outcome = "Rec"
) %>%
	tidy_dagitty()

ggdag(dag.test ) + theme_dag()


####################################
# Run Recon

if(FALSE){

#*Yukon River Chinook Run Reconstruction*

#[Connors et al. 2022](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41117347.pdf) developed an integrated run reconstruction and spawner-recruit model for Yukon River Chinook salmon.  Their Figure 4 shows a schematic of the run reconstruction component, which almost follows the DAG conventions:

* Unobserved quantities (dashed boxes) are clearly distinguished from observed variables (solid boxes).  Unobserved quantities include total run entering the lower river, run passing the border, and spawner abundance in each surveyed tributary. Observed quantities include estimates from sonar lower river sonar,  estimates from border mark-recapture, and visual estimates from tributary overflights.
* Some, but not all, of the arrows follow the direction of causal effect (e.g., run size determines passage estimate)


**build corresponding DAG in ggdag**


### Worked Examples of full Workflow: From DAG sketches to Bayesian Model

* Basic DAG (analysis of fundamental statistical pitfalls, "reversal" example)
* Refined DAG
* Models with adjustment sets determined based on the DAG
* "Full luxury Bayesian models" that model the entire DAG using joint likelihoods and then use posterior simulations to get the causal estimates.



}













