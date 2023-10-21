# OSEC-PS: Open-Source Environmental Covariates - Pacific Salmon


**STATUS: This repo is taking shape as we are discussing ideas with participants at the PICES Annual Meeting. Check back frequently and leave [some feedback](#feedback-on-osec-ps). All components are up for debate at this stage, so join in early to shape the project!**

## Purpose

We've used a lightweight, human-centered data management system to compile and manage source data for  Yukon River Chinook Salmon run reconstruction 
([Pestal et al. 2022](https://www.psc.org/download/33/psc-technical-reports/14359/psc-technical-report-no-48.pdf)). 33 people from 11 organizations contributed to the data compilation and review process, consolidating quality-controlled records and detailed meta-data for 31 main assessment surveys covering a basin of 850,000 km<sup>2</sup>. Data summaries and model input files had to be constantly updated as data review and model development progressed concurrently. A worked example of the approach is available in a [github repository](https://github.com/SOLV-Code/UltraLite-Fisheries-Data-System). The worked example explains the structure of the underlying data management system and how the components fit together. It includes tips on getting started with git/github and for setting up automated reports using markdown.  

We're also compiling [wiki pages with background information on human-centered design](https://github.com/SOLV-Code/UltraLite-Fisheries-Data-System/wiki), including excerpts from interesting papers.

We are now trying to test whether this approach can be scaled up from a relatively contained setting to a more typical data management situation. The Yukon Chinook data compilation was part of high-priority project with clear terms of reference for the project, a large technical working group, and dedicated resources.  More typically, data management systems are not implemented for just a single specific analysis or project, but developed and maintained as a more general-use resource (e.g., a data base of all the regional salmon spawner estimates). This changes the human dynamics of contribution, from a highly-focused and time-constrained deliverable for targeted outcome, to a long-running commitment, often without any clear and direct result for the individual contributors. 

In this type of setting, a data management system that minimizes procedural and technical hassles has the potential to greatly improve the data resource. 

An open-source data resource is a good test for this idea, because individual contributors are not obligated to work through a steep learning curve or drop other tasks because a senior manager made a request.

## Scope

* useable annual time series (quality controlled estimates, not raw data)
* meta-data for time series or individual records
* inventory of projects where each series was used, documenting where the covariate improved the model.

focus on annual time series, but compiling information on sources for raw data etc as well.

open data

Fraser Env watch


## Repository structure


### DATA Folder

* All the contributed source data lives here
* each data set  = 1 folder
* Readme file in markdown (standard section) -> pulled into automated report 
* individual csv files for each series




## Feedback on OSEC-PS  

If you have any questions, comments, or ideas for extensions, you can leave a note on the
[issues page](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues) by clicking
on *New Issue*. Make sure to give it an informative title.

You can also scroll through the other open issues to follow the discussion and contribute ideas.


## Get Started

You have three options for browsing through this repository:

* If you just want to have a quick look, keep reading and follow the links below for specific examples of file structure and code.

* If you want a local copy of the key files, click on the green *"<> Code"* button near the top of this page, and select *"Download Zip"*.

* If you really want to dig into the details and are familiar with RStudio and git, just clone this repository, then open the RStudio project file *UltraLite-Fisheries-Data-System.Rproj*


## Structure

Each folder has a *README.md* file that explains the files. Github displays the README contents below the list of files. If there are a lot of files, you may have to scroll to the bottom to see the README.

The key folders are:










