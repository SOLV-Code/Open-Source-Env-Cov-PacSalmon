## Chasco  et al (2021) Paper on environmental covariates for Snake River Chinook

**Status**: In Progress

**Maintained by**: This entry maintained by [@SOLV-Code](https://github.com/SOLV-Code). The official version of the data set used in the paper is available via the lead author's [github repository](https://github.com/bchasco/SAR_paper), but there is currently no up-to-date source for these covariates.

**Last Data Update**: 2014-02-19

### Introduction

*To be included*


### Status of Data Set

The covariate series used in the paper are available in a [github repository](https://github.com/bchasco/SAR_paper).

[Table 2](https://journals.plos.org/plosone/article/figure?id=10.1371/journal.pone.0246659.t002) of the paper defines the covariates and provides links to source data. In the [pdf version](https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0246659&type=printable) of the paper these links are clickable. 

With this information it should be possible to replicate the calculations, generate an up-to-date version of the data set, and cross-check the earlier years against the archived data set from the paper. *This is a work in progress and some challenges came up, which are being tracked at [this thread](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/74)*

Note that the data file includes additional covariates not listed in Table 2 of the paper (e.g., pdo.win,pdo.spr,pdo.sum,pdo.aut). These are included also included here.


### Open Questions 

*To be included*

### Highlights from the paper

*To be included*





### References

Chasco B, Burke B, Crozier L, Zabel R (2021) Differential impacts of freshwater and marine covariates on wild and hatchery Chinook salmon marine survival. PLOS ONE 16(2): e0246659. https://doi.org/10.1371/journal.pone.0246659

* [Full paper - read online](https://doi.org/10.1371/journal.pone.0246659)

* [Full paper - pdf download](https://journals.plos.org/plosone/article/file?id=10.1371/journal.pone.0246659&type=printable)

* [github repository with archived data](https://github.com/bchasco/SAR_paper).


### Details


For now, most covariates are just being extracted from the archived data set. 
The covariates below are currently in the process of being recreated and updated from source data.



**Multivariate ENSO Index Version 2 (MEI.v2) Winter/Spring/Summer/Autumn

The [main source page](https://www.psl.noaa.gov/enso/mei/) describes the index as follows: *"The bi-monthly Multivariate El Niño/Southern Oscillation (ENSO) index (MEI.v2) is the time series of the leading combined Empirical Orthogonal Function (EOF) of five different variables (sea level pressure (SLP), sea surface temperature (SST), zonal and meridional components of the surface wind, and outgoing longwave radiation (OLR)) over the tropical Pacific basin (30°S-30°N and 100°E-70°W). The EOFs are calculated for 12 overlapping bi-monthly "seasons" (Dec-Jan, Jan-Feb, Feb-Mar,..., Nov-Dec) in order to take into account ENSO's seasonality, and reduce effects of higher frequency intraseasonal variability."*


This Repo | Paper | Definition
-- | -- |  --
MEIv2MeanDecToMar	| oni.win? | Need to figure out the exact definition
MEIv2MeanMarToJun	| oni.spr? | Need to figure out the exact definition
MEIv2MeanJunToSep	| oni.sum? | Need to figure out the exact definition
MEIv2MeanSepToDec	| oni.aut? | Need to figure out the exact definition

Source data available online in plain [text format](https://psl.noaa.gov/enso/mei/data/meiv2.data). 
The annotation explains that *"Row values are 2 month seasons (YEAR DJ JF FM MA AM MJ JJ JA AS SO ON ND)"*

We manually generate source files matching the [data structure for this repository](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA). To get the values, copy just the tab-separated values into a text file and add column headers (like like [this](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/Chascoetal2021_SnakeRiverCk/RawFiles/MEIv2Source_DataRaw.txt)), import into Excel, and then copy values into the [csv](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/Chascoetal2021_SnakeRiverCk/MEIv2Source_Data.csv). **NOTE: The source file may include values of -999.00 or -999. These are assumed to be NA and are removed**


