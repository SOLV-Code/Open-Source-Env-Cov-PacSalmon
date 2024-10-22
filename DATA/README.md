## DATA

Files in this folder are used to generate [OUTPUT](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/OUTPUT) using the R scripts in [CODE](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/CODE).


[This inventory of variables](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/LookUp_VariableDescriptions.csv) with short descriptions, plot labels, etc. needs to be maintained manually (for now, until the *InfoFile_DataSetName.csv* for each dataset is set up).


All the contributed source data lives in the sub-folders. Each data set is contained in 1 folder within the data folder. A data set is a group of time series from a common source, related to a common topic, or covering a shared spatial extent (e.g., same watershed).

For each data set, there are 2 main files:

* *README.md* file in [github markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax), summarizing the source of the data, why it is included here, where it has been used for Pacific salmon models, and any notable points to consider before using that data. The intent is that the *README* will evolve into a set of standard sections, which can then be pulled "as-is" into an automated report.
* *InfoFile_DataSetName.csv*: data file with standard columns, listing each time series in the data set and some information about each series. Parts of this will be pulled into automated summaries and summary tables for the automated report.

For each time series, there are up to 3 csv files: 

* *SeriesLabel_Data* (required): lists annual estimates, with error bounds where available, and includes a header with some clarification information. Header lines start with *#*. In *R*, the header information is stripped out by using the argument ```comment.char = "#"``` when reading in the files with ```read.csv()```.  **IMPORTANT: Do not use any ```,``` in the notes, they will mess up the import. **See  *LINK TO EXAMPLE*
* *SeriesLabel_DataConcerns* (optional): lists any potential data issues, in 2 columns (*Years_Affected*, *Potential_Issue*). See See  *LINK TO EXAMPLE*
* *SeriesLabel_OperationalChanges* (optional): lists any major modifications to the data collection program or data processing steps, in 3 columns (*Years*, *Component*, *Change_Event*). See *LINK TO EXAMPLE*

Compiling short notes on data concerns and operational changes in *csv* format makes it possible to generate compact summary tables in an automated report (see examples in the appendices of [Pestal et al. 2022](https://www.psc.org/download/33/psc-technical-reports/14359/psc-technical-report-no-48.pdf)).


This repository currently covers 9 data sets of environmental covariates: 


* [DFO Pacea Package](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_PACEA_Package)

* [CTC Chinook Forecast Covariates](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/CTC_ChinookForecast_Covars)

* [DFO Ocean Science Division Data Products Group](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_OceanScienceDiv_DataProd)

* [DFO Fraser Sockeye and Pink Forecasting](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast)

* [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex)

* [DFO State of the Pacific Oceans](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_StateOfThePacificOcean)

* [DFO Salmon in Regional Ecosystems Program (SiRE-P)](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_SalmonInRegionalEcosystems)

* [Chasco et al. (2021) Snake River Chinook paper](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/Chascoetal2021_SnakeRiverCk). 

* [Peterman et al. (2009) summary paper](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/Petermanetal2009_Summary)


