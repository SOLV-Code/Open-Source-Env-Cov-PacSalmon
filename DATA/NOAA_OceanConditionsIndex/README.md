## NOAA Ocean Conditions Index

**Status**: In Progress

**Maintained by**: This entry maintained by [@SOLV-Code](https://github.com/SOLV-Code), with contributions from SG (**Use github ID,Check with them**). Official version of the data set maintained by [Northwest Fisheries Science Center](https://www.fisheries.noaa.gov/about/northwest-fisheries-science-center).

**Last Data Update**: 2014-02-12

### Introduction

The NOAA ocean conditions index and stoplight summary dashboard are developed for stocks that migrate into the California Current system, with a focus on Chinook and Coho. The environmental variables included in the index were selected based on observed relationships with marine survival of salmon, using data from long-running surveys off the Washington and Oregon coast.

The specific environmental covariates combined in the index have evolved over time, and currently include large-scale climate and atmospheric indicators (e.g., PDO), regional physical indicators (e.g., mean temperature across multiple locations), and regional biological indicators (e.g., copepod diversity and biomass). Note that they define these physical and biological indicators as "local", but we categorize them as regional for consistency with other data sets in this repository.

Note that the biological indicators are currently not included in this repository. The aggregate index based on all the variables will be included if it becomes available online, or if it can be replicated. 

Since 2008, annual summaries of ocean conditions are published and archived as [webpages](https://www.fisheries.noaa.gov/west-coast/science-data/summary-ocean-indicators-2008-present). 


### Status of Data Set

The time series used in the index are available for 
[download](https://www.fisheries.noaa.gov/west-coast/science-data/ocean-conditions-indicators-trends) as an xls file. However, the individual ranks assigned to each value, and the aggregate index based on each year's rank of the mean rank across variables is not included.

Variable descriptions are available online for [large-scale climate and atmospheric indicators](https://www.fisheries.noaa.gov/west-coast/science-data/climate-and-atmospheric-indicators) and for [regional-scale physical indicators](https://www.fisheries.noaa.gov/west-coast/science-data/local-physical-indicators).


### Open Questions 

Follow the links to see the discussion thread and leave comments.

* [Any milestones in development to highlight?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/36)
* [PDO: Sum vs mean?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/37)
* [Rank and Mean of ranks not included in download anymore?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/38)
* [Assumed mechanism for PDO covariate](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/69)


### Highlights from Published Analyses

* To be included





### References

* [2006 PICES presentation](https://meetings.pices.int/publications/presentations/PICES_15/Ann15_S1/S1_Casillas-Peterson.pdf)

* [2011 Report](https://meridian.allenpress.com/jfwm/article-supplement/138759/pdf/10_3996_042010-jfwm-009_s6/)




### Details


The online source file is in xls format, with layout optimized for humans, so values can't be extracted easily. We manually generate source files matching the [data structure for this repository](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA) (paste values with transpose, then fix column headings to br R compliant.

