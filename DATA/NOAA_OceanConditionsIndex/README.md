## NOAA Ocean Conditions Index

**Status**: In Progress

**Maintained by**: This entry maintained by [@SOLV-Code](https://github.com/SOLV-Code), with contributions from SG (*get github username*). Official version of the data set maintained by [Northwest Fisheries Science Center](https://www.fisheries.noaa.gov/about/northwest-fisheries-science-center).

**Last Data Update**: 2024-02-12

### Introduction

The NOAA ocean conditions index and stoplight summary dashboard are developed for stocks that migrate into the California Current system, with a focus on Chinook and Coho. The environmental variables included in the index were selected based on observed relationships with marine survival of salmon, using data from long-running surveys off the Washington and Oregon coast.

The specific environmental covariates combined in the index have evolved over time, and currently include large-scale climate and atmospheric indicators (e.g., PDO), regional physical indicators (e.g., mean temperature across multiple locations), and regional biological indicators (e.g., copepod diversity and biomass). Note that they define these physical and biological indicators as "local", but we categorize them as regional for consistency with other data sets in this repository.

Note that the biological indicators are currently not included in this repository. The aggregate index based on all the variables will be included if it becomes available online, or if it can be replicated. 

Since 2008, annual summaries of ocean conditions are published and archived as [webpages](https://www.fisheries.noaa.gov/west-coast/science-data/summary-ocean-indicators-2008-present). 


### Status of Data Set

The time series used in the index are available for 
[download](https://www.fisheries.noaa.gov/west-coast/science-data/ocean-conditions-indicators-trends) as an xls file. However, the individual ranks assigned to each value, and the aggregate index based on each year's rank of the mean rank across variables is not included. An R script to reproduce the rank calculations is started [here](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/NOAA_OceanConditionsIndex/1_OceanCondIdx_CalculateRanks.R) and explores some alternative versions (see below)



Variable descriptions are available online for [large-scale climate and atmospheric indicators](https://www.fisheries.noaa.gov/west-coast/science-data/climate-and-atmospheric-indicators) and for [regional-scale physical indicators](https://www.fisheries.noaa.gov/west-coast/science-data/local-physical-indicators).


### Open Questions 

Follow the links to see the discussion thread and leave comments.

* [Any milestones in development to highlight?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/36)
* [PDO: Sum vs mean?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/37)
* [Rank and Mean of ranks not included in download anymore?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/38)
* [Assumed mechanism for PDO covariate](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/69)
* [ranking details](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/104)

### Highlights from Published Analyses

* To be included





### References

* [2006 PICES presentation](https://meetings.pices.int/publications/presentations/PICES_15/Ann15_S1/S1_Casillas-Peterson.pdf)

* [2011 Report](https://meridian.allenpress.com/jfwm/article-supplement/138759/pdf/10_3996_042010-jfwm-009_s6/)




### Details


The online source file is in xls format, with layout optimized for humans, so values can't be extracted easily. We manually generate source files matching the [data structure for this repository](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA) (paste values with transpose, then fix column headings to be R compliant.

Descriptions are available for each group of indicators:
* [climate/atmospheric](https://www.fisheries.noaa.gov/west-coast/science-data/climate-and-atmospheric-indicators)
* [regional physical](https://www.fisheries.noaa.gov/west-coast/science-data/local-physical-indicators)
* [biological](https://www.fisheries.noaa.gov/west-coast/science-data/local-biological-indicators)



Type	| Label| Direction | Description
-- | -- | -- | --
Climate / Atmos |  PDOSumDecToMarch  | Lower is better | Sum of monthly PDO index from December to March
Climate / Atmos |  		PDOSumMayToSep | Lower is better | Sum of monthly PDO index from May to Sept.
Climate / Atmos |  		ONIAvgJanToJun | Lower is better | Mean of monthly Oceanic Niño index from Jan to Jun
Regional Physical |		SST7BuoysMeanMayToSep | Lower is better | Details TBI
Regional Physical |		Upper20mTempAvgNovToMar | Lower is better | TBI
Regional Physical |		Upper20mTempAvgMayToSep | Lower is better | TBI
Regional Physical |		DeepTempAvgMayToSep | Lower is better | TBI
Regional Physical |		DeepSalinityAvgMayToSept | **Higher** is better | TBI
Regional Biological |	CopeRichAnom| Lower is better | Copepod richness anomalies (number of species May-Sept)
Regional Biological |	NthCopeMassAnom| **Higher** is better | Northern copepod biomass anomalies(mg C m-3, May-Sep)
Regional Biological|	SthCopeMassAnom| Lower is better | Southern copepod biomass anomalies(mg C m-3, May-Sep)
Regional Biological |	BiolTransition| Lower is better | Biological transition (day of year)
Regional Biological |	NearIplanktonJantoMar| **Higher** is better | Nearshore Ichthyoplankton
Log(mg C 1,000 m-3; Jan-Mar)
Regional Biological |	NearOffIplanktonCommIdxJanToMar| Lower is better | Copepod community index
Regional Biological  |	CkJuvCtJune| **Higher** is better | Chinook salmon juvenile
catches Log (no. km-1; June)
Regional Biological |	CoJuvCtJune| **Higher** is better | Coho salmon juvenile
catches Log (no. km-1; June)


The component indicators are correlated, but do pick up different signals for individual years. The largest observed difference is for 2022, which has a very good rank for climate and atmospheric indicators (mean rank = 3), but a very poor rank for more regional indicators summarizing coastal temperature and salinity (mean rank = 20.6). The overall index for 2022 comes out as a middle ground (rank of mean ranks across all indicators is 12 out of 26), which is categorized as "fair" conditions in the [stoplight summary table](https://www.fisheries.noaa.gov/west-coast/science-data/ocean-conditions-indicators-trends).

<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/NOAA_OceanConditionsIndex/MeanRankComparison.png" width="500">

<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/NOAA_OceanConditionsIndex/MeanRankScatterplot.png" width="500">