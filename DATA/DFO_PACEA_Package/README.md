## DFO PACEA PACKAGE

**Status**: In progress

**Maintained by**: This entry maintained by [@SOLV-Code](https://github.com/SOLV-Code). Official version of the data set maintained the ```pbs-assess``` team in the [pacea package repository](https://github.com/pbs-assess/pacea).

**Last Data Update**: 2024-05-11

### Introduction

* R package

### Status of Data Set

* just starting with package install and exploration. See [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/DFO_PACEA_Package/1_Pacea_PackageInstallandDataExtract.R)


* some series updated monthly, some annually
* new series being added as papers are being written (e.g.: state of the pacific ocean reports)


Each data set is fully documented with links to raw data, data processing code, and detailed description of the data and context in a help file. If you use R and have the ```pacea``` package installed, you can access this information for each data set within R with ```help(object_name)``` or ```?object_name``` (e.g., ```?pdo```). If you are not accessing these data from within R, you can get the raw version of the help file in the package repository [man folder](https://github.com/pbs-assess/pacea/tree/main/man).



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


### Highlights from Published Analyses


*Still need to look through the referenced reports/papers to see how they cite these data sets and what the key conclusions were.*


### References

*Fill this in as highlights are included above*



### Details

*None yet*