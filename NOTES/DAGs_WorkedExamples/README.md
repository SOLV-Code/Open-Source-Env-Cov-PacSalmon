## Worked Examples of Directed Acyclic Graphs (DAGs) for Causal Inference

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*

Figures created with [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/6_DAG_Explorations.R).


The [Causal Inference Wiki Page](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/wiki/Causal-Inference) has a brief introduction to DAG concepts and terminology, and links to more detailed information.

### Workflow Using *ggdag* and *DAGitty*

The R package *ggdag* allows you the specify complex models using standard R model syntax. The DAG can then be plotted in R, or copied into the *DAGitty* online app for easier formatting and interactive analysis. Once your DAG sketches stabilize, you can create the final plots and analyses using *ggdag* and *ggplot* for reproducible outputs without copy/pasting into a different program and without clicking through menu options. But the DAGitty app greatly simplifies the initial exploration.


### Sep 1: Salmon spawner-recruit model with 2 life-history stages

Start with the writing out the functional relationships as text and corresponding R model equations

```
Total adult recruits are a function of juvenile abundance and marine productivity
Rec ~ Juv + MProd  

Juvenile abundance is a function for spawner abundance and freshwater productivity
Juv ~ Spn + FWProd 

Freshwater productivity is a function of spawner abundance (i.e., density-dependence)
FWProd  ~ Spn
```

Then use the ```ggdag::dagify()``` function to generate a basic version of the DAG code. Note that in DAG terminology the main *input* you focus on is called the "exposure" (i.e., the "treatment" variable in the experiment). In this example, we want to know how recruitment (the "outcome") changes for different spawner abundances (the "exposure").


```
library(devtools)
devtools::install_github("r-causal/ggdag")

library(ggdag)
library(ggplot2)

dagify(
	Rec ~ Juv + MProd,
	Juv ~ Spn + FWProd,
	FWProd ~ Spn,
	exposure = "Spn",
	outcome = "Rec"
)
```

This gives the following DAG model code.

```
dag {
FWProd
Juv
MProd
Rec [outcome]
Spn [exposure]
FWProd -> Juv
Juv -> Rec
MProd -> Rec
Spn -> FWProd
Spn -> Juv
}
```

To create basic *ggdag* plot with default settings, use

```
dag.2stages.sr <- dagify(
	Rec ~ Juv + MProd,
	Juv ~ Spn + FWProd,
	FWProd ~ Spn,
	exposure = "Spn",
	outcome = "Rec"
) %>%
	tidy_dagitty()

ggdag(dag.2stages.sr) + theme_dag()
```

The resulting figure is


<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/DAGs_WorkedExamples/SR_2Stages_DefaultPlot.png"
	width="300">
	
But if you paste the DAG model code into the [DAGitty Online App](https://www.dagitty.net/dags.html#), you can move and modify the nodes and arrows easily to generate a more informative diagram. In this figure, the main input (a.k.a "exposure") and main output (a.k.a "outcome") are clearly distinguished. Colour-coding of nodes and arrows also helps with interpretation:

* green arrows are causal paths
* pathways through covariates that introduce biases show up as red arrows (none in this simple DAG)
* unobserved (latent) variables (none in this simple DAG) show up as fainter nodes.


<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/DAGs_WorkedExamples/SR_2Stages_DAGittyPlot.PNG"
	width="300">

The underlying DAG model code is

```
dag {
bb="-4.219,-3.214,5.029,2.565"
FWProd [pos="-1.594,0.536"]
Juv [pos="-1.045,0.114"]
MProd [pos="-0.647,0.567"]
Rec [outcome,pos="-0.144,0.120"]
Spn [exposure,pos="-2.136,0.113"]
FWProd -> Juv
Juv -> Rec
MProd -> Rec
Spn -> FWProd
Spn -> Juv
}
```
	
### Step 2: Add some generic environmental factors

In the [DAGitty Online App](https://www.dagitty.net/dags.html#) you can start with the DAG model code from Example 1, and add unobserved (latent) variables through point-and-click menus, which makes the app very useful for brainstorming in a group setting. But it is still useful to verbally state the causal relationships you are exploring (see the [rubber duck programming technique](https://en.wikipedia.org/wiki/Rubber_duck_debugging)).

Environmental factors need to be matched up based on the life history of the stock. For this example, assume a salmon stock with juveniles rearing in a lake for 1 year with adult recruits returning predominantly at age 4.


```
Freshwater productivity is influenced by 
(1) weather conditions in the interior of BC during the first winter (i.e. after egg deposition in the fall, before emergence in the spring) 
(2) rearing lake conditions between first and second spring (from fry entering the lake to smolts leaving the lake and migrating to the ocean)
(3) river conditions during smolt outmigration in the second spring

FWProd ~ InteriorCondW0
FWProd ~ LakeCondY1
FWProd ~ RiverCondY2

Marine productivity is influenced by coastal conditions during the early ocean residence and by large-scale ocean conditions during the rest of the marine growth phase. But coastal conditions in the year of ocean entry are influenced by the larger-scale ocean conditions that year.

MProd ~ CoastalCondY2
MProd ~ OceanCondY2
MProd ~ OceanCondY3
CoastalCondY2 ~ OceanCondY2

```

Adding these general ideas to the DAG gives

<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/DAGs_WorkedExamples/SR_2Stages_DAGittyPlot2.PNG"
	width="300">

The underlying DAG model code is

```
dag {
bb="-4.219,-3.214,5.029,2.565"
CoastalCondY2 [latent,pos="0.460,1.078"]
FWProd [pos="-1.803,0.977"]
InteriorCondY0 [latent,pos="-2.923,0.450"]
Juv [pos="-0.638,0.133"]
LakeCondY1 [latent,pos="-2.989,0.892"]
MProd [pos="1.679,0.714"]
OceanCondY2 [latent,pos="0.328,0.396"]
OceanCondY3 [latent,pos="0.438,1.635"]
Rec [outcome,pos="2.393,0.125"]
RiverCondY2 [latent,pos="-2.989,1.403"]
Spn [exposure,pos="-2.136,0.113"]
CoastalCondY2 -> MProd
FWProd -> Juv
InteriorCondY0 -> FWProd
Juv -> Rec
LakeCondY1 -> FWProd
MProd -> Rec
OceanCondY2 -> CoastalCondY2
OceanCondY2 -> MProd
OceanCondY3 -> MProd
RiverCondY2 -> FWProd
Spn -> FWProd
Spn -> Juv
}
```



### Step 3: Consider how some specific environmental covariates fit into this structure


The next step is to link specific covariates for which you have data into the draft causal structure developed in Example 3. This illustrates how DAGs can grow very quickly into highly complex diagrams.


```
River conditions during smolt outmigration are influenced by ocean conditions in the preceding winter. One commonly used mesasure of North Pacific ocean conditions is the Pacific Decadal Oscillation (PDO) index. For PDO, we may want to include either anomalies, or mean values, or both.

RiverCondY2 ~ OceanCondW2
PDOAnomW2 ~ OceanCondW2
PDOMeanW2~ OceanCondW2

Similarly, the North Pacific Gyre Oscillation (NPGO) and Oceanic Niño Index (ONI) are summary indices reflecting ocean conditions. A Coastal Upwelling Index (or coastal SST index?) can be included to capture coastal conditions.

CoastalUpwellY2 ~ CoastalCondY2

```


Adding these considerations to the DAG gives

<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/DAGs_WorkedExamples/SR_2Stages_DAGittyPlot3.PNG"
	width="400">

The underlying DAG model code is

```
dag {
bb="-4.219,-3.214,5.029,2.565"
CoastalCondY2 [latent,pos="0.713,-1.657"]
CoastalUpwellY2 [pos="-0.265,-2.393"]
FWProd [pos="-0.023,0.342"]
InteriorCondW0 [latent,pos="-1.978,0.164"]
Juv [pos="0.899,-0.472"]
LakeCondY1 [latent,pos="-2.055,0.706"]
MProd [pos="1.833,-1.231"]
NPGOY2 [pos="1.273,-2.594"]
ONIY2 [pos="2.931,-2.602"]
OceanCondW2 [latent,pos="-0.836,1.488"]
OceanCondY2 [latent,pos="1.921,-1.990"]
OceanCondY3 [latent,pos="3.239,-1.626"]
PDOAnomW2 [pos="0.394,1.163"]
PDOMeanW2 [pos="0.559,1.721"]
Rec [outcome,pos="2.525,-0.448"]
RiverCondY2 [latent,pos="-2.121,1.248"]
Spn [exposure,pos="-2.429,-0.487"]
CoastalCondY2 -> CoastalUpwellY2
CoastalCondY2 -> MProd
FWProd -> Juv
InteriorCondW0 -> FWProd
Juv -> Rec
LakeCondY1 -> FWProd
MProd -> Rec
OceanCondW2 -> PDOAnomW2
OceanCondW2 -> PDOMeanW2
OceanCondW2 -> RiverCondY2
OceanCondY2 -> CoastalCondY2
OceanCondY2 -> MProd
OceanCondY2 -> NPGOY2
OceanCondY2 -> ONIY2
OceanCondY3 -> MProd
RiverCondY2 -> FWProd
Spn -> FWProd
Spn -> Juv
}

```



### Step 4: Pruning the DAG

The next step is to prune the DAG, removing any chains of latent variables and any mediators. As an illustration, assume that you want to focus on estimating the total effect of spawner abundance on recruitment. In the DAG from Step 3, that pathway is "blocked" by the ```Juv``` node (i.e., coefficients on ```Spn``` would only capture a part of the effect). If you remove the ```Juv``` node requires that you merge the freshwater and marine productivity nodes into a single total productivity (```TotProd```) parameter. Let's also assume that based on previous work, you decide to focus on two of the covariates: PDO anomalies and the coastal upwelling index.


Simplifying the DAG based on these considerations gives

<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/DAGs_WorkedExamples/SR_2Stages_DAGittyPlot4.PNG"
	width="400">

The underlying DAG model code is

```
dag {
bb="-4.219,-3.214,5.029,2.565"
CoastalCondY2 [latent,pos="1.404,-1.758"]
CoastalUpwellY2 [pos="2.701,-1.525"]
OceanCondW2 [latent,pos="-0.144,-1.750"]
PDOAnomW2 [pos="-1.440,-1.525"]
Rec [outcome,pos="2.525,-0.448"]
Spn [exposure,pos="-2.429,-0.487"]
TotProd [pos="0.065,-0.929"]
CoastalCondY2 -> CoastalUpwellY2
CoastalCondY2 -> TotProd
OceanCondW2 -> PDOAnomW2
OceanCondW2 -> TotProd
Spn -> Rec
Spn -> TotProd
TotProd -> Rec
}

```




