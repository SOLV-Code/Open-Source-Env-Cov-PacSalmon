# OSEC-PS: Open-Source Environmental Covariates - Pacific Salmon


**STATUS: This repo is taking shape as we are discussing ideas with participants at the PICES Annual Meeting. Check back frequently and leave [some feedback](#feedback-on-osec-ps). All components are up for debate at this stage, so join in early to shape the project!**

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

Along the way, we will also compile an inventory of any interesting sources of environmental information that come up, but are out of scope for this project. Once the wiki pages take shape, these links will move there somewhere, but for now we are compiling the here:

* [weekly reports from Fraser River Environmental Watch](https://www.pac.dfo-mpo.gc.ca/science/habitat/frw-rfo/index-eng.html)
* [IYS Ocean Observing System](https://iys.hakai.org/dataset)
* [short-term smoke forecasts for Canada and U.S.](https://www.pac.dfo-mpo.gc.ca/science/habitat/frw-rfo/index-eng.html) 

## Feedback on OSEC-PS  

If you have any questions, comments, or ideas for extensions, you can leave a note on the
[issues page](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues) by clicking
on *New Issue*. Make sure to give it an informative title.

You can also scroll through the other open issues to follow the discussion and contribute ideas.


## Get Started

You have three options for browsing through this repository:

* If you just want to have a quick look, keep reading and follow the links below for specific examples of file structure and code.

* If you want a local copy of the key files, click on the green *"<> Code"* button near the top of this page, and select *"Download Zip"*.

* If you really want to dig into the details and are familiar with RStudio and git, just clone this repository, then open the RStudio project file *Open-Source-Env-Cov-PacSalmon.Rproj* and start looking through the code scripts.


## Repository structure


### DATA Folder

All the contributed source data lives here. Each data set is contained in 1 folder within the data folder. A data set is a group of time series from a common source, related to a common topic, or covering a shared spatial extent (e.g., same watershed).

For each data set, there are 2 main files:

* *README.md* file in [github markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax), summarizing the source of the data, why it is included here, where it has been used for Pacific salmon models, and any notable points to consider before using that data. The intent is that the *README* will evolve into a set of standard sections, which can then be pulled "as-is" into an automated report.
* *InfoFile_DataSetName.csv*: data file with standard columns, listing each time series in the data set and some information about each series. Parts of this will be pulled into automated summaries and summary tables for the automated report.

For each time series, there are up to 3 csv files: 

* *SeriesLabel_Data* (required): lists annual estimates, with error bounds where available, and includes a header with some clarification information. Header lines start with *#*. In *R*, the header information is stripped out by using the argument ```comment.char = "#"``` when reading in the files with ```read.csv()```. See  *LINK TO EXAMPLE*
* *SeriesLabel_DataConcerns* (optional): lists any potential data issues, in 2 columns (*Years_Affected*, *Potential_Issue*). See See  *LINK TO EXAMPLE*
* *SeriesLabel_OperationalChanges* (optional): lists any major modifications to the data collection program or data processing steps, in 3 columns (*Years*, *Component*, *Change_Event*). See *LINK TO EXAMPLE*

Compiling short notes on data concerns and operational changes in *csv* format makes it possible to generate compact summary tables in an automated report (see examples in the appendices of [Pestal et al. 2022](https://www.psc.org/download/33/psc-technical-reports/14359/psc-technical-report-no-48.pdf)).



### CODE Folder

Given this file structure, the R code to merge, cross-check, and summarize the data across projects is relatively simple.

* functions vs. scripts

*INCLUDE SUMMARY*



### OUTPUT Folder

* csv files merging from the individual source data files
* csv summary files 
* summary plots
* automated report









