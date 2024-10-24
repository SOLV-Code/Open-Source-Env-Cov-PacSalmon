## Current Coverage

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*

Figures created from the [merged data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/Merged_CovariateSet.csv) using [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/1_MergeAndSummarize_DataSets.R).

### Key Points

* Usable covariates can be extracted or derived from **5** of the data sets currently covered in this repository.


* Environmental covariates from the [CTC Chinook Forecast](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/CTC_ChinookForecast_Covars) data set can be used directly from a source file that is available upon request, but the code used to process raw data and generate the covariates is also available in a GitHub repository and could be used to reproduce and automate the full workflow.

* Environmental covariates from the [DFO Fraser River Sockeye and Pink Forecast](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast) data set can be mostly reproduced from the source data links provided in the reports, and the source data sets go back much further than the available salmon spawner-recruit data sets (e.g., sea surface temperature and salinity records from British Columbia lighthouses are available since the early 1900s).

* Environmental covariates from the [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data set can be downloaded directly and all start in 1998.

* The [Chasco et al. 2021](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/Chascoetal2021_SnakeRiverCk) paper on Snake River (Columbia) Chinook provides an archived version of the covariates via github, and includes active links to source data for most of the covariates. Some of the covariates have been recreated and updated, others are being extracted from the archived data set for now.

* The [DFO Pacea Package for R](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_PACEA_Package) is designed to easily integrate into existing workflows for users who are already doing their analyses in R. It includes diverse data sets, from annual coastwide indices to fine-scale satellite data, and provides detailed descriptions of each data set. For now, only 2 annual coastwide indices from Pacea have been incorporated here, but work is on-going to develop and incorporate annual covariates from the monthly coastwide indices (like the Nov-Mar mean PDO anomaly used in the Fraser Sockeye forecast data set).

* See [Variable descriptions](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/LookUp_VariableDescriptions.csv) table for details.

* All 5 data sets include a mix of covariates at different scales. All 5 data sets include large-scale variables (e.g., Pacific Decadal Oscillation) and more regional variables (e.g., sea surface temperature for one or a few locations). The *DFO Fraser Forecasting* data set, the Chasco et al. (2021) paper, and the Pacea package also include local variables (Fraser River discharge, Columbia River flow and temperature).

* All 5 data sets include a variable to reflect Pacific Decadal Oscillation (PDO), but the details of the variable definition differ. [This note](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/NOTES/PDO_Comparison) is taking a closer look at the similarities and differences.


### Data Timeline

<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/DataOverview_Part1.png"
	width="600">
	
<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/DataOverview_Part2.png"
	width="600">

