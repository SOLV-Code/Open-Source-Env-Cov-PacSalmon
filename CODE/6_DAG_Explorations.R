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
	exposure = "Spn",
	outcome = "Rec"
) %>%
	tidy_dagitty()

ggdag(dag.basic.sr) + theme_dag()

# 2 stage life-history SR
dag.2stages.sr <- dagify(
	Rec ~ Juv,
	Juv ~ Spn,
	exposure = "Spn",
	outcome = "Rec"
) %>%
	tidy_dagitty()

ggdag(dag.2stages.sr) + theme_dag()

# 2 stage life-history SR

dag.3stages.sr <- dagify(
	Rec ~ Juv,
	Juv ~ Eggs,
	Eggs ~ Spn,
	exposure = "Spn",
	outcome = "Rec"
) %>%
	tidy_dagitty()

ggdag(dag.3stages.sr) + theme_dag()



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

















