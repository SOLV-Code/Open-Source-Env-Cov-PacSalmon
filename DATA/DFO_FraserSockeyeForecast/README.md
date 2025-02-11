## DFO Fraser Sockeye and Pink Salmon Adult Run Size Forecast

**Status**: In progress

**Maintained by**: This entry maintained by [@SOLV-Code](https://github.com/SOLV-Code), with contributions from SG and KD (*get github usernames*). Official version of the data set maintained by [DFO Stock Assessment - Lower Fraser](https://www.dfo-mpo.gc.ca/contact/regions/pacific-pacifique-eng.html#Delta). A static copy of the covariates up to brood year 2022 is available in the [github repo](https://github.com/yi-xu/Sockeye_paper/tree/main/data) for the [Xu et al. 2024 paper](https://cdnsciencepub.com/doi/abs/10.1139/cjfas-2023-0139?journalCode=cjfas)

**Last Data Update**: 2024-05-28


### Introduction

Run size forecasts for stocks of Fraser River sockeye are developed annually, using a comprehensive suite of candidate models and extensive retrospective evaluation. Candidate models and forecast evaluation methods have evolved over more than 20 years through an intensive annual peer-review process.

The following environmental covariates are currently included in the forecast explorations:

Scale | Category | variables
-- | -- | --
local | Fraser river conditions during juvenile outmigration|  monthly mean flow (Apr, May, Jun), Apr-Jun peak discharge
regional | conditions during ocean entry | Mean monthly sea surface temperature at Entrance Island and Pine Island lightstations (Apr, May, Jun, Jul), 
large scale | climate conditions during the winter preceding outmigration | Pacific Decadal Oscillation (PDO)
large-scale | *how lined up with brood year?* | North Pacific Gyre Oscillation (NPGO)
large-scale | *how lined up with brood year?* |  Gulf of Alaska sea surface temperature

Key milestones in the evolution of forecasting methods were: 

* [2010 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/341025.pdf), which expanded the analyses and communication of uncertainty in the forecasts and formalized the consideration and testing of environmental covariates
* [2012 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/345619.pdf), which documented the retrospective and jacknife approaches for testing candidate models and more rigorous approach to evaluating model performance.
* [2014 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/365999.pdf), which first included a detailed discussion of environmental and other considerations by life history stage, packaged as a stand-alone [supplement document](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/363655.pdf). 2014 is the year when 'the blob' marine heatwave developed in the NE Pacific. So timing of this development was aligned with how observations of ocean conditions were exceptional. It is increasingly challenging to create quantitative forecasts, when observations exceed historical record. As the global climate and oceans warm, using historical data to forecast the future may change relationships etc. The supplement was added to provide an indication on where in the quantitative forecast probability distribution the returns might fall based on expert input prior to the return season. This ensures science expertise is integrated ahead of the season in an objective way. The supplements are developed by an expert working group and cover topics like adult migration conditions, spawner condition, spawner success, egg-to-fry survival, freshwater rearing conditions, juvenile migration timing, and juvenile diets at ocean entry. This supplemental information was later published as a stand-alone technical report (2018-2020), and then included as an appendix in the main forecast report in the most recent years. 
* [2022 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41227153.pdf) and [2024 CJFAS paper](https://cdnsciencepub.com/doi/abs/10.1139/cjfas-2023-0139?journalCode=cjfas) evaluated new environmental and biological covariates (fry body length and weight, Pacific salmon abundance indices, Gulf of Alaska sea surface temperature and North Pacific Gyre Oscillation).
 
As the forecast methods have matured and stabilized, the peer-review process has changed as well. For 2000-2013, the annual forecasts were published as DFO Research Documents, which undergo a full peer-review coordinated by [DFO's Canadian Science Advisory Secretariat](https://www.dfo-mpo.gc.ca/csas-sccs/process-processus/srp-prs-eng.htm). From 2014 to 2021, a more streamlined [Science Response](https://www.dfo-mpo.gc.ca/csas-sccs/process-processus/srp-prs-eng.htm) process was used. The 2022 forecast was published as a DFO technical report, but combined with a CJFAS paper documenting the test of new covariates. Forecast reports, environmental condition supplements, and technical reports are available through the [References](#References) below.

The supplement summarizing environmental conditions was a critical process that integrated salmon experts and data across life-stages. This process evolved and improved as the expert group learned the language and nuances of each program from lake limnology, stock assessment, marine ocean ecology, physiology, etc. In the process, experts challenged each other on what could be said about the observations and their links to salmon survival, and what was considered to be less reliable. 

The [2019 Supplement](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/40819103.pdf) includes summary tables with key observations and qualitative ratings of (1) direction of effect, (2) confidence, and (3) significance to survival for this specific forecast. Table 1 has general highlights and Table 2 has stock-specific ratings.


### Status of Data Set

Most of the source data can be accessed through links in the latest report, but the up-to-date time series actually being used is not currently available online. 
It is, however, available upon request from the [DFO Lower Fraser Office](https://www.dfo-mpo.gc.ca/contact/regions/pacific-pacifique-eng.html#Delta). A static copy of the covariates up to brood year 2022 is available in the [github repo](https://github.com/yi-xu/Sockeye_paper/tree/main/data) for the [Xu et al. 2024 paper](https://cdnsciencepub.com/doi/abs/10.1139/cjfas-2023-0139?journalCode=cjfas)

The source data used to generate the specific environmental covariate time series are described in detail in the reports. The most recent report includes active links to online source data for the PDO variable as well as the raw sea surface temperature and salinity data (BC ligh stations, Gulf of Alaska SST). For the Fraser River discharge data, an agency contact is provided.  

The reports include plots of the environmental covariate time series (e.g., Figures 3-5 of the [2021 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41006057.pdf)), but do not include a table with the actual annual values. Recent forecast reports also include detailed discussion of environmental conditions in a supplemental document or appendix (e.g., Appendix A5 of the [2021 Forecast](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41006057.pdf)).

For this repository, we are trying to replicate the data treatment steps to generate an [up-to-date downloadable covariate time series](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/DFO_FraserSockeyeForecast/GENERATED_COVARS_DFOFraserRiverForecasts.csv) directly from the publicly available source data, using [this R script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/DFO_FraserSockeyeForecast/1_FraserFC_Process_Source_Data.R). *This is still a work in progress, as we are checking the generated file against the official data set*. 


**Note**: The raw BC lightstation data is available through at [Open Data](https://open.canada.ca/data/en/dataset/719955f2-bf8e-44f7-bc26-6bd623e82884). To get the files, find "DATA - Active Sites", then click on "Explore" and select "Go to Resource" from the drop-down menu. That downloads a zip folder with everything. Then extract the csv files you need and process them with R code like [this R script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/DFO_FraserSockeyeForecast/1_FraserFC_Process_Source_Data.R)


### Open Questions 

Follow the links to see the discussion thread and leave comments.

* [Missing forecast reports?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/24)
* [Other milestones in evolution of methods?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/25)
* [PDO Index Details](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/26)
* [Lighthouse SST and SSS Details](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/28)
* [Values vs. Deviations from mean?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/30)
* [Assumed mechanism for PDO covariate](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/69)
* [Link between State of Pacific Ocean Reports and forecasts](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/70)
* [stn2js and stn2ja covariates not used anymore?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/135)

### Highlights from Published Analyses

Candidate models with environmental covariates generally haven't been the best performing models acording to statistical criteria in retrospective tests, but have become the focus of pre-season advice due to extreme conditions observed in many recent years. Specifically, the [2021 Forecast Report](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41006057.pdf) states (pg.7): 

* *"For 19 major stocks, forecasts are based on a model selected from a shortlist of top-ranked models, by consensus of a group of experts."* 

* *"Model performance, ranking, and the primary model selection process for Fraser Sockeye Salmon are based on the jack-knife retrospective analyses conducted in 2012 (MacDonald and Grant 2012). Given the environmental conditions and poor productivity observed in recent years, an additional criterion was added during the 2017 model selection process where under certain conditions, environmental covariate models would be favoured over biological models (i.e., stock-recruit models) without environmental covariates (DFO 2017). Further attempts in recent years to capture historically poor productivity have led model selection to become more of an expert-driven process, that hasn’t fit neatly into the model selection criteria laid out in previous years. In an attempt for improved transparency, model selection criteria were revisited this year, and the conventions re-written to reflect this expert-driven process. Appendix 1 outlines the approach taken for model selection for 2021."*

* *"For many stocks, top-ranked models without climate-driven covariates, tended to provide forecast estimates at productivity levels far higher than those observed recently (Table 2). In many cases, the only models that provided forecast values near recently observed productivity levels were either forecast models with climate-driven covariates, or naïve models based on recent recruit-per-spawner (RS) estimates (such as RS4yr and RS8yr)."*

A review of environmental and biological covariate performance was just published [Xu et al. 2024](https://cdnsciencepub.com/doi/pdf/10.1139/cjfas-2023-0139). Key results are:

* *"incorporated five new covariates, including sea surface temperature in the Gulf of Alaska and the abundance of salmon species, into the existing forecast models. Results revealed better performances by both the Ricker and Power models when coupled with the newly included covariates. Moreover, models selected over a decade ago underperformed compared to those selected based on our recent retrospective analysis from 2009 to 2020."*

* *"time-varying effects of environmental conditions on population and community processes, i.e., non-stationary relationships, are becoming more prevalent in the face of climate
change, and have been increasingly recognized"*


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
* 2022 Forecast [Tech Report](https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41227153.pdf)

**Other Analyses**



* Xu, Y., Q. Liu, C. Fu, and J. Holmes. 2024. [Assessing the impacts of environmental and ecological
variables on the performance of Fraser sockeye salmon
forecast](https://cdnsciencepub.com/doi/pdf/10.1139/cjfas-2023-0139). Can. J. Fish. Aquat. Sci. 00: 1–16 (2024). Retrospective test of 37 alternative forecast models on 18 stocks, for 2009-2020.







### Details

**PDO Pacific Decadal Oscillation**

The latest forecast report provides 
[this link](http://research.jisao.washington.edu/pdo/PDO.latest) for the PDO index. The source file includes brief notes on the data and citations with more detail. 

The source file describes the data set as *"Updated standardized values for the PDO index, derived as the leading PC of monthly SST anomalies in the North Pacific Ocean,  poleward of 20N. The monthly mean global average SST anomalies are removed to separate this pattern of variability from any "global warming" signal that may be present in the data."* 

*Note*: This source file ends in 2018. Another version that goes up to 2022 with matching values is available [here](https://psl.noaa.gov/gcos_wgsp/Timeseries/Data/pdo.long.data), but does not include the context and definitions. Up-to-date versions are available online, but numbers don't match (e.g., [here](https://www.ncei.noaa.gov/pub/data/cmb/ersst/v5/index/ersst.v5.pdo.dat)).

The online source file is in text format with annotations, so values can't be extracted easily. We manually generate source files matching the [data structure for this repository](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA) from the notes [here](http://research.jisao.washington.edu/pdo/PDO.latest)  and the values [here](https://psl.noaa.gov/gcos_wgsp/Timeseries/Data/pdo.long.data). To get the values, copy just the tab-separated values into a text file and add column headers (like [this](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/DFO_FraserSockeyeForecast/RawFiles/PDOIdxSource_DataRaw.txt)), import into Excel, and then copy values into the [csv](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/DFO_FraserSockeyeForecast/PDOIdxSource_Data.csv). **NOTE: The source file may include values of -9.90. These are assumed to be NA and are removed**

[This R script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/DFO_FraserSockeyeForecast/1_Process_Source_Data.R) then reorganizes the raw data and calculates Nov-Mar means.


**Important to resolve:** The [pacea package](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_PACEA_Package) uses a different version of the PDO index. Need to pick on or the other. Details at [this discussion thread](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/26).

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



**Gulf of Alaska SST**

*Need to check through the [Xu et al. 2024 paper](https://cdnsciencepub.com/doi/pdf/10.1139/cjfas-2023-0139) and companion [repo](https://github.com/yi-xu/Sockeye_paper) to figure out how exactly the 
covariates were calculated, then replicate*




**North Pacific Gyre Oscillation (NPGO)**

*Need to check through the [Xu et al. 2024 paper](https://cdnsciencepub.com/doi/pdf/10.1139/cjfas-2023-0139) and companion [repo](https://github.com/yi-xu/Sockeye_paper) to figure out how exactly the 
covariates were calculated, then replicate*


