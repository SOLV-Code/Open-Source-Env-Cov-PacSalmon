## Worked Examples of Directed Acyclic Graphs (DAGs) for Causal Inference

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*

Figures created with [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/6_DAG_Explorations.R).


### Workflow Using *ggdag* and *DAGitty*

The R package *ggdag* allows you the specify complex models using standard R model syntax. The DAG can then be plotted in R, or copied into the *DAGitty* online app for easier formatting and interactive analysis. Once your DAG sketches stabilize, you can create the final plots and analyses using *ggdag* and *ggplot* for reproducible outputs without copy/pasting into a different program and without clicking through menu options. But the DAGitty app greatly simplifies the initial exploration.


### Example 1: Salmon Spawner-Recruit Model with 2 Life-History Stages

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
	
But if you paste the DAG model code into the [DAGitty Online App](https://www.dagitty.net/dags.html#), you can move and modify the nodes and arrows easily to generate:

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
	
	
	

