# OSEC-PS: Open-Source Environmental Covariates - Pacific Salmon


**STATUS: This repo is taking shape based on discussions at the [2023 PICES Annual Meeting](https://meetings.pices.int/meetings/annual/2023/PICES/scope) and the [2024 World Fisheries Congress](https://wfc2024.fisheries.org/). Check back frequently and leave [some feedback](#feedback-on-osec-ps). All components are up for debate at this stage, so join in early to shape the project!**

## Current Coverage


Data Set | Large-Scale  | Regional | Local
-- | -- | -- | --
[DFO Fraser Sockeye Forecasting](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast) | **PDO**: Pacific Decadal Oscillation Mean Nov-Mar | **Sea Surface Temperature**: Entrance Island (Strait of Georgia) Mean Apr-Jun, Pine Island (NE Vancouver Island) Mean Apr-Jun; **Sea Surface Salinity**: Amphitrite Point (WCVI) and Race Rocks (Strait of Juan de Fuca) Mean Jul-Aug/Sep | **Fraser River Discharge**: Peak and Mean April-June
[NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) | **PDO** Pacific Decadal Oscillation: Sum Dec-March, Sum May-Sep, **ONI** Oceanic Nino Index: Avg Jan-Jun   |
**Sea Surface Temperature**: Anomalies in Mean May-Sep Across 7 bouys off coastasl Washington and Oregon; **Upper 20m Temperature**: Mean Nov-Mar, Mean May-Sep (?Same buoys?); **Deep Temperature**: Mean May-Sep (?Same buoys?); **Deep Salinity**:Mean May-Sep (?Same buoys?) |  None




## Purpose

We've used a lightweight, human-centered data management system to compile and manage source data for  Yukon River Chinook Salmon run reconstruction 
([Pestal et al. 2022](https://www.psc.org/download/33/psc-technical-reports/14359/psc-technical-report-no-48.pdf)). 33 people from 11 organizations contributed to the data compilation and review process, consolidating quality-controlled records and detailed meta-data for 41 individual assessment projects covering a basin of 850,000 km<sup>2</sup>. Data summaries and model input files had to be constantly updated as data review and model development progressed concurrently. A worked example of the approach is available in a [github repository](https://github.com/SOLV-Code/UltraLite-Fisheries-Data-System). The worked example explains the structure of the underlying data management system and how the components fit together. It includes tips on getting started with git/github and for setting up automated reports using markdown, plus [wiki pages with background information on human-centered design and excerpts from interesting papers](https://github.com/SOLV-Code/UltraLite-Fisheries-Data-System/wiki).

We are now trying to test whether this approach can be scaled up from a relatively contained setting to a more typical data management situation. The Yukon Chinook data compilation was part of high-priority project with clear terms of reference for the project, a large technical working group, and dedicated resources.  More typically, data management systems are not implemented for just a single specific analysis or project, but developed and maintained as a more general-use resource (e.g., a data base of all the regional salmon spawner estimates). This changes the human dynamics of contribution, from a highly-focused and time-constrained deliverable for targeted outcome, to a long-running commitment, often without any clear and direct result for the individual contributors. 

In this type of setting, a data management system that minimizes procedural and technical hassles has the potential to greatly improve the data resource. 

An open-source data resource is a good test for this idea, because individual contributors are not obligated to work through a steep learning curve or drop other tasks because a senior manager made a request.

## Scope

Data management systems are easier to design and maintain if their scope is clearly bounded. For this project, we are considering the following bounds:

* potential environmental covariates for Pacific salmon models
* useable annual time series (quality controlled estimates, not raw data)
* meta-data for time series or individual records
* inventory of projects where each series was used, documenting where the covariate improved the model.

For now, we are excluding biological covariates, such as copepod diversity, winter ichthyoplankton biomass, or catch/abundance of other salmon species (e.g., using pink salmon abundance as a covariate in sockeye salmon models). In cases where biological variables are part of a multi-variable index, such as the [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex), we include the overall index, and the individual environmental components of index.

Along the way, we are also compiling an inventory of any interesting sources of environmental information that come up, but are out of scope for this project. These are stored on a [wiki page](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/wiki/Other-Sources).


## Repository structure


* [DATA Folder](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA): Includes all the contributed data with detailed descriptions of what they are and how they have been used.

* [CODE Folder](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/CODE): includes all the functions an code needed to process the contributed data into a single consistent data set and generate various summaries.

* [OUTPUT Folder](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/OUTPUT): includes the merged data set and summaries.



## Get Started

You have four options for browsing through this repository:

* If you are mainly interested in getting the data, browse through the descriptions of each data set in the [DATA](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA), then download either an individual data file or the full merged data set in the [OUTPUT](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/OUTPUT) folder. To download a data set, click through until you see the contents of the csv file displayed, then click on the icon for "download raw file" in the top right corner.

* If you just want to have a quick look at the data structure and code, follow the links above for specific examples of file structure and code.

* If you want a local copy of all the key files, click on the green *"<> Code"* button near the top of this page, and select *"Download Zip"*.

* If you really want to dig into the details and are familiar with RStudio and git, just clone this repository, then open the RStudio project file *Open-Source-Env-Cov-PacSalmon.Rproj* and start looking through the code scripts.


## Feedback on OSEC-PS  

If you have any questions, comments, or ideas for extensions, you can leave a note on the
[issues page](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues) by clicking
on *New Issue*. Make sure to give it an informative title.

You can also scroll through any other open issues to follow the discussion and contribute ideas.









