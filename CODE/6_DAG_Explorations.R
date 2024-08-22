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
	Rec ~ Juv + Mp,
	Juv ~ Spn + FWp,
	FWp ~ Spn,
	exposure = "Spn",
	outcome = "Rec"
) %>%
	tidy_dagitty()

ggdag(dag.2stages.sr) + theme_dag()


########
# dagitty code

dag {
	bb="0,0,1,1"
	ONIAnomWinterY2 [pos="0.201,0.210"]
	OceanCondY2 [latent,pos="0.300,0.271"]
	OceanCondY3 [pos="0.418,0.266"]
	PDOAnomWinterY2 [pos="0.198,0.289"]
	Prod [pos="0.377,0.388"]
	Rec [outcome,pos="0.564,0.490"]
	Spn [exposure,pos="0.217,0.499"]
	OceanCondY2 -> ONIAnomWinterY2
	OceanCondY2 -> PDOAnomWinterY2
	OceanCondY2 -> Prod
	OceanCondY3 -> Prod
	Prod -> Rec
	Spn -> Prod
	Spn -> Rec
}







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

















