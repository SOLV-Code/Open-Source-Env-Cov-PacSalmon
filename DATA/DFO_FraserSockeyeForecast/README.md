## DFO Fraser Sockeye and Pink Salmon Adult Run Size Forecast

**Status**: In progress

**Maintained by**: This entry maintained by [@SOLV-Code](https://github.com/SOLV-Code), with contributions from SG and KD (*get github usernames*). Official version of the data set maintained by [DFO Stock Assessment - Lower Fraser](https://www.dfo-mpo.gc.ca/contact/regions/pacific-pacifique-eng.html#Delta).

**Last Data Update**: 2024-02-12

### Introduction

Run size forecasts for stocks of Fraser River sockeye are developed annually, using a comprehensive suite of candidate models and extensive retrospective evaluation. Environmental covariates considered include local river conditions during juvenile outmigration, regional conditions during ocean entry, and large-scale climate conditions during the winter preceding outmigration.

Candidate models and forecast evaluation methods have evolved over more than 20 years through an intensive annual peer-review process.

Key milestones in the evolution of forecasting methods were: 

* [2010 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/341025.pdf), which expanded the analyses and communication of uncertainty in the forecasts and formalized the consideration and testing of environmental covariates
* [2012 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/345619.pdf), which documented the retrospective and jacknife approaches for testing candidate models and more rigorous approach to evaluating model performance.
* [2014 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/365999.pdf), which first included a detailed discussion of environmental and other considerations by life history stage, packaged as a stand-alone [supplement document](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/363655.pdf). 2014 is the year when 'the blob' marine heatwave developed in the NE Pacific. So timing of this development was aligned with how observations of ocean conditions were exceptional. It is increasingly challenging to create quantitative forecasts, when observations exceed historical record. As the global climate and oceans warm, using historical data to forecast the future may change relationships etc. The supplement was added to provide an indication on where in the quantitative forecast probability distribution the returns might fall based on expert input prior to the return season. This ensures science expertise is integrated ahead of the season in an objective way. The supplements are developed by an expert working group and cover topics like adult migration conditions, spawner condition, spawner success, egg-to-fry survival, freshwater rearing conditions, juvenile migration timing, and juvenile diets at ocean entry. This supplemental information was later published as a stand-alone technical report (2018-2020), and then included as an appendix in the main forecast report in the most recent years.  

As the forecast methods have matured and stabilized, the peer-review process has changed as well. For 2000-2013, the annual forecasts were published as DFO Research Documents, which undergo a full peer-review coordinated by [DFO's Canadian Science Advisory Secretariat](https://www.dfo-mpo.gc.ca/csas-sccs/process-processus/srp-prs-eng.htm). From 2014 to 2021, a more streamlined [Science Response](https://www.dfo-mpo.gc.ca/csas-sccs/process-processus/srp-prs-eng.htm) process was used. Forecast reports and environmental condition supplements are available through the [References](#References) below.

The supplement summarizing environmental conditions was a critical process that integrated salmon experts and data across life-stages. This process evolved and improved as the expert group learned the language and nuances of each program from lake limnology, stock assessment, marine ocean ecology, physiology, etc. In the process, experts challenged each other on what could be said about the observations and their links to salmon survival, and what was considered to be less reliable. 

The [2019 Supplement](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/40819103.pdf) includes summary tables with key observations and qualitative ratings of (1) direction of effect, (2) confidence, and (3) significance to survival for this specific forecast. Table 1 has general highlights and Table 2 has stock-specific ratings.


### Status of Data Set

Most of the source data can be accessed through links in the latest report, but the final time series actually being used is not currently available online. 
It is, however, available upon request from the [DFO Lower Fraser Office](https://www.dfo-mpo.gc.ca/contact/regions/pacific-pacifique-eng.html#Delta). 

The source data used to generate the specific environmental covariate time series are described in detail in the reports. The most recent report includes active links to online source data for the PDO variable as well as the raw sea surface temperature and salinity data. For the Fraser River discharge data, an agency contact is provided.  

The reports include plots of the environmental covariate time series (e.g., Figures 3-5 of the [2021 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41006057.pdf)), but do not include a table with the actual annual values. Recent forecast reports also include detailed discussion of environmental conditions in a supplemental document or appendix (e.g., Appendix A5 of the [2021 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41006057.pdf)).

For this repository, we are trying to replicate the data treatment steps to generate an [up-to-date downloadable covariate time series](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/DFO_FraserSockeyeForecast/GENERATED_COVARS_DFOFraserRiverForecasts.csv) directly from the publicly available source data. *This is still a work in progress, as we are checking the generated file against the official data set*.


### Open Questions 

Follow the links to see the discussion thread and leave comments.

* [Missing forecast reports?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/24)
* [Other milestones in evolution of methods?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/25)
* [PDO Index Details](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/26)
* [Lighthouse SST and SSS Details](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/28)
* [Values vs. Deviations from mean?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/30)
* [Assumed mechanism for PDO covariate](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/69)
* [Link between State of Pacific Ocean Reports and forecasts](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/70)

### Highlights from Published Analyses

Candidate models with environmental covariates generally haven't been the best performing models acording to statistical criteria in retrospective tests, but have become the focus of pre-season advice due to extreme conditions observed in many recent years. Specifically, the [2021 Forecast Report](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41006057.pdf) states (pg.7): 

* *"For 19 major stocks, forecasts are based on a model selected from a shortlist of top-ranked models, by consensus of a group of experts."* 

* *"Model performance, ranking, and the primary model selection process for Fraser Sockeye Salmon are based on the jack-knife retrospective analyses conducted in 2012 (MacDonald and Grant 2012). Given the environmental conditions and poor productivity observed in recent years, an additional criterion was added during the 2017 model selection process where under certain conditions, environmental covariate models would be favoured over biological models (i.e., stock-recruit models) without environmental covariates (DFO 2017). Further attempts in recent years to capture historically poor productivity have led model selection to become more of an expert-driven process, that hasn’t fit neatly into the model selection criteria laid out in previous years. In an attempt for improved transparency, model selection criteria were revisited this year, and the conventions re-written to reflect this expert-driven process. Appendix 1 outlines the approach taken for model selection for 2021."*

* *"For many stocks, top-ranked models without climate-driven covariates, tended to provide forecast estimates at productivity levels far higher than those observed recently (Table 2). In many cases, the only models that provided forecast values near recently observed productivity levels were either forecast models with climate-driven covariates, or naïve models based on recent recruit-per-spawner (RS) estimates (such as RS4yr and RS8yr)."*




### References

**Annual Forecast Reports and Environmental Conditions Supplements**

* 2000 Forecast [Res Doc](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/249501.pdf)
* 2001 Forecast [Res Doc](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/256496.pdf)
* 2002 Forecast [Res Doc](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/270590.pdf)
* 2006 Forecast [Res Doc](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/325297.pdf) and [SAR](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/327848.pdf)
* 2007 Forecast [SAR](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/331833.pdf)
* 2009 Forecast [SAR](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/337551.pdf)
* 2010 Forecast [Res Doc](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/341025.pdf) and [SAR](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/341128.pdf)
* 2011 Forecast [Res Doc](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/363080.pdf) and [SAR](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/346302.pdf)
* 2012 Forecast [Res Doc](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/345619.pdf) and [SAR](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/345682.pdf)
* 2013 Forecast [Res Doc](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/348273.pdf) and [SAR](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/348399.pdf)
* 2014 Forecast [SciResp](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/363637.pdf) and [Supplement](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/363655.pdf).
* 2015 Forecast [SciResp](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/363748.pdf)
* 2016 Forecast [SciResp](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/365999.pdf) and [Supplement](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/4062254x.pdf)
* 2017 Forecast [SciResp](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/40624808.pdf),
* 2018 Forecast [SciResp](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/40715607.pdf), and [Supplement](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/4072511x.pdf)
* 2019 Forecast [Supplement](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/40819103.pdf)
* 2020 Forecast [Supplement](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/4088546x.pdf)
* 2021 Forecast
[SciResp](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41006057.pdf)


**Other Analyses**

*Still looking for other reports/papers that use the same data set.*



### Details

**PDO Pacific Decadal Oscillation**

The latest forecast report provides 
[this link](http://research.jisao.washington.edu/pdo/PDO.latest) for the PDO index. The source file includes brief notes on the data and citations with more detail. 

The source file describes the data set as *"Updated standardized values for the PDO index, derived as the leading PC of monthly SST anomalies in the North Pacific Ocean,  poleward of 20N. The monthly mean global average SST anomalies are removed to separate this pattern of variability from any "global warming" signal that may be present in the data."* 

*Note*: This source file ends in 2018. Another version that goes up to 2022 with matching values is available [here](https://psl.noaa.gov/gcos_wgsp/Timeseries/Data/pdo.long.data), but does not include the context and definitions. Up-to-date versions are available online, but numbers don't match (e.g., [here](https://www.ncei.noaa.gov/pub/data/cmb/ersst/v5/index/ersst.v5.pdo.dat)).

The online source file is in text format with annotations, so values can't be extracted easily. We manually generate source files matching the [data structure for this repository](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA) from the notes [here](http://research.jisao.washington.edu/pdo/PDO.latest)  and the values [here](https://psl.noaa.gov/gcos_wgsp/Timeseries/Data/pdo.long.data). To get the values, copy just the tab-separated values into a text file and add column headers (like [this](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/DFO_FraserSockeyeForecast/RawFiles/PDOIdxSource_DataRaw.txt)), import into Excel, and then copy values into the [csv](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/DFO_FraserSockeyeForecast/PDOIdxSource_Data.csv). **NOTE: The source file may include values of -9.90. These are assumed to be NA and are removed**

[This R script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/DFO_FraserSockeyeForecast/1_Process_Source_Data.R) then reorganizes the raw data and calculates Nov-Mar means.


**Sea Surface Temperature and Salinity**

The latest forecast report provides 
[this link](https://open.canada.ca/data/en/dataset/719955f2-bf8e-44f7-bc26-6bd623e82884) to a complete set of sea surface temperature and salinity measurements at BC lightstation starting in 1914. There is also an [interactive map](https://hub.arcgis.com/datasets/6140178915024068ac498da4225a2e6b) for exploring lightstation locations and associated data.

The actual data set is available online as a single [zip file (3MB)](https://open.canada.ca/data/en/dataset/719955f2-bf8e-44f7-bc26-6bd623e82884/resource/472ebc80-bcc4-4926-8aad-7b0662532b84) with all the data, organized into subfolders. To get the values, manually extract the monthly average sea surface temperature and salinity files for Entrance Island, Pine Island, Amphitrite Point, Race Rocks, and Departure Bay. Departure Bay measurements are used to fill in missing values in the Entrance Island data (p.6 of [2021 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41006057.pdf)).

[This R script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/DFO_FraserSockeyeForecast/1_Process_Source_Data.R) extracts and merges the raw data, then calculates Apr-Jun mean for SST, Jul-Aug and Jul-Sep mean for SSS).




**Fraser River Discharge**


*Still trying to figure out a source and workflow for this one*

Online sources of raw data: 

* Water Survey of Canada: can get Fraser discharge at Hope in a csv file via download button [here](https://wateroffice.ec.gc.ca/report/data_availability_e.html?type=historical&station=08MF005&parameter_type=Flow+and+Level)


* Fraser River conditions from DFO Environmental Watch (EWatch) Program: [Detailed weekly summaries ](https://www.pac.dfo-mpo.gc.ca/science/habitat/frw-rfo/index-eng.html), but no digital source file available.


