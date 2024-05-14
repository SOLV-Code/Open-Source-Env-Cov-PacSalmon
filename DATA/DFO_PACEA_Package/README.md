## DFO PACEA PACKAGE

**Status**: In progress

**Maintained by**: This entry maintained by [@SOLV-Code](https://github.com/SOLV-Code). Official version of the data set maintained the ```pbs-assess``` team in the [pacea package repository](https://github.com/pbs-assess/pacea).

**Last Data Update**: 2024-05-14

### Introduction

*Pacea* is an R package which includes a large number of ecosystem data relevant to research in DFO's Pacific Region. Sharing these data through an R package allows for several important features, but also limits the potential user base. Strenghts of the approach include:

* Data objects in pacea are directly usable in statistical analyses with R
* custom functions for plotting each data set are included
* updating the package updates all the data sets at once
* makes it possible to package very different types of data objects (annual and monthly coastwide indices, detailed grids of satellite data).

However, potential users need to be comfortable with R/RStudio, and there there may be challenges with the initial installs and with package dependencies (Note that the pacea team provides contact information to assist with install challenges!). It may be be a useful addition to the pacea repository to make some of the data and information available to non-R folks. See discussion threads [here](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/116) and [here](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/120).

### Status of Data Set

Package install worked on first try on 1 computer, but took a whole bunch of removing/re-installing dependencies on another computer. Any idea why? See [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/DFO_PACEA_Package/1_Pacea_PackageInstallandDataExtract.R)


Each data set is fully documented with links to raw data, data processing code, and detailed description of the data and context in a help file. If you use R and have the ```pacea``` package installed, you can access this information for each data set within R with ```help(object_name)``` or ```?object_name``` (e.g., ```?pdo```). If you are not accessing these data from within R, you can get the raw version of the help file in the package repository [man folder](https://github.com/pbs-assess/pacea/tree/main/man).

New data sets are being added as papers are written (e.g.: [State of the Pacific Ocean Reports](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_StateOfThePacificOcean)).

For the PSEC repository, we're focusing on coastwide indices included in *Pacea* (for now).

**Annual Coastwide Indices in Pacea**


Variable Name | Description | pacea object name 
-- | -- | --
ALPI | Aleutian Low Pressure Index annual anomalies | alpi
NPIa | North Pacific Index values and annual anomalies | npi_annual

**Monthly Coastwide Indices in Pacea**


Variable Name | Description | pacea object name 
-- | -- | --
AO | Arctic Oscillation  monthly anomalies| ao
ENSO MEI | Multivariate ENSO Index  monthly anomalies |
NPGO | North Pacific Gyre Oscillation  monthly anomalies |
NPIm | North Pacific Index monthly values  |
ONI | Oceanographic Niño Index  monthly values and anomalies | 
PDO | Pacific Decadal Oscillation  monthly anomalies|



### Open Questions 

* [Best way to extract data from pacea package?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/116)

* [NPI monthly anomalies](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/118)

* [easier access to data decriptions](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/120)

* [two different versions of pdo index? (OI SST v2 vs. ER SST v5](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/26)


### Highlights from Published Analyses


*Still need to look through the referenced reports/papers to see how they cite these data sets and what the key conclusions were.*


### References

*Fill this in as highlights are included above*



### Details

*None yet*