## Chasco  et al (2021) Paper on environmental covariates for Snake River Chinook

**Status**: In Progress

**Maintained by**: This entry maintained by [@SOLV-Code](https://github.com/SOLV-Code). The official version of the data set used in the paper is available via the lead author's [github repository](https://github.com/bchasco/SAR_paper), but there is currently no up-to-date source for these covariates.

**Last Data Update**: 2014-02-19

### Introduction

The paper focuses on 1 specific group of salmon, spring/summer Chinook from the Snake River basin on the Columbia, and analyzes the complex correlations and interactions of large-scale and more local environmental covariates. They worked with a rich dataset of over 285,000 individually-tagged fish between 2000 and 2015.

They describe the context as follows:

* *"Evaluating drivers of survival for migrating animals is difficult because the interaction between physical processes at local, regional, and basin scales commonly results in correlated
conditions across nearby habitat types."*

* *"This correlation has the potential to amplify (or dampen) anomalous conditions in multiple habitats simultaneously, thus complicating our ability to identify causative mechanisms of variability in salmon survival."*

* *"Because early ocean experiences are thought to have a large influence on salmon ocean survival, we focused environmental correlates on marine conditions spanning the winter prior to
when fish out-migrated to the fall after outmigration.*"



### Status of Data Set

The covariate series used in the paper are available in a [github repository](https://github.com/bchasco/SAR_paper).

[Table 2](https://journals.plos.org/plosone/article/figure?id=10.1371/journal.pone.0246659.t002) of the paper defines the covariates and provides links to source data. In the [pdf version](https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0246659&type=printable) of the paper these links are clickable. 

With this information it should be possible to replicate the calculations, generate an up-to-date version of the data set, and cross-check the earlier years against the archived data set from the paper. *This is a work in progress and some challenges came up, which are being tracked at [this thread](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/74)*

Note that the data file includes additional covariates not listed in Table 2 of the paper , but found to have a strong effect on survival (e.g., pdo.sum). These will also be included here.


### Open Questions 

* [Challenges with recreating some covariates](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/74)

### Highlights from the paper

The best-fit model for smolt-to-adult survival (SAR) of *wild* Snake River Chinook included two environmental covariates:

* Summer PDO (pdo.sum) had a negative effect on SAR (i.e., more positive PDO index from Jun-Aug linked to lower SAR)

* Coastal upwelling index for the spring (cui.spr) had a positive effect on SAR (i.e., more positive upwelling index from Mar-May linked to higher SAR)

The best-fit model for smolt-to-adult survival (SAR) of *hatchery-origin* Snake River Chinook included two environmental covariates:

* Seasonal North Pacific Gyre Oscillation index for the summer (npgo.sum) had a positive effect on SAR (i.e., more positive NPGO index from Jun-Aug linked to higher SAR)

* Seasonal measure of Sverdrup transport along the Washington coast for the summer (transport.sum) had a positive effect on SAR (i.e., more positive transport index from Jun-Aug linked to higher SAR)


### References

Chasco B, Burke B, Crozier L, Zabel R (2021) Differential impacts of freshwater and marine covariates on wild and hatchery Chinook salmon marine survival. PLOS ONE 16(2): e0246659. https://doi.org/10.1371/journal.pone.0246659

* [Full paper - read online](https://doi.org/10.1371/journal.pone.0246659)

* [Full paper - pdf download](https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0246659&type=printable)

* [github repository with archived data](https://github.com/bchasco/SAR_paper).


### Details

The paper defines the following seasons:

Period |Label | Months
-- | -- |  --
Winter | *.win | Dec/Jan/Feb
Spring | *.spr | Mar/Apr/May
Summer | *.sum  | Jun/Jul/Aug
Autumn | *.aut  | Sep/Oct/Nov


For now, most covariates are just being extracted from the archived data set. 

* Columbia River flow and temperature (CRflow.spr,CRflow.sum,CRtemp.spr,CRtemp.sum): source data available online, but complex
* Seasonal upwelling index (cui.win,cui.spr,cui.sum,cui.aut): link inactive
* Seasonal North Pacific Index (index of Aleutian Low Pressure)((npi.win,npi.spr,npi.sum,npi.aut): link inactive
* Seasonal sea surface temperature for coastal Washington (ersstWACoast.win, ersstWACoast.spr,ersstWACoast.sum,ersstWACoast.aut): source data available online, but complex
* Seasonal sea surface temperature from Johnstone and Mantua (2014) source data available online, but complex
* Seasonal measure of Sverdrup transport along the Washington coast, most correlated with the temperatures in the upper 20 meters.: no link available


The covariates below are currently in the process of being recreated and updated from source data.


**Multivariate ENSO Index Version 2 (MEI.v2) Winter/Spring/Summer/Autumn**

The [main source page](https://www.psl.noaa.gov/enso/mei/) describes the index as follows: *"The bi-monthly Multivariate El Niño/Southern Oscillation (ENSO) index (MEI.v2) is the time series of the leading combined Empirical Orthogonal Function (EOF) of five different variables (sea level pressure (SLP), sea surface temperature (SST), zonal and meridional components of the surface wind, and outgoing longwave radiation (OLR)) over the tropical Pacific basin (30°S-30°N and 100°E-70°W). The EOFs are calculated for 12 overlapping bi-monthly "seasons" (Dec-Jan, Jan-Feb, Feb-Mar,..., Nov-Dec) in order to take into account ENSO's seasonality, and reduce effects of higher frequency intraseasonal variability."*


This Repo | Paper
-- | -- 
MEIv2MeanDecToFeb	| mei.win 
MEIv2MeanMarToMay	| mei.spr 
MEIv2MeanJunToAug	| mei.sum 
MEIv2MeanSepToNov	| mei.aut 

Source data available online in plain [text format](https://psl.noaa.gov/enso/mei/data/meiv2.data). 
The annotation explains that *"Row values are 2 month seasons (YEAR DJ JF FM MA AM MJ JJ JA AS SO ON ND)"*

We manually generate source files matching the [data structure for this repository](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA). To get the values, copy just the tab-separated values into a text file and add column headers (like [this](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/Chascoetal2021_SnakeRiverCk/RawFiles/MEIv2Source_DataRaw.txt)), import into Excel, and then copy values into the [csv](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/Chascoetal2021_SnakeRiverCk/MEIv2Source_Data.csv). **NOTE: The source file may include values of -999.00 or -999. These are assumed to be NA and are removed**


**Seasonal North Pacific Gyre Oscillation**

*WORKING ON IT*

source data available [here](http://www.o3d.org/npgo/npgo.php)


**Seasonal Oceanic Niño Index**

*WORKING ON IT*

source data available [here](https://origin.cpc.ncep.noaa.gov/products/analysis_monitoring/ensostuff/ONI_v5.php)