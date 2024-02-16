## PDO Comparison

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*

Figures created from the [merged data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/Merged_CovariateSet.csv) using [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/2_PDO_Comparisons.R).


### Contents

* [Comparing Winter PDO Variables](#Alternative-Winter-PDO-Variables)
* [Winter vs. Summer PDO Variables](#Winter-vs-Summer-PDO-Variables)

### Alternative Winter PDO Variables


Both the [DFO Fraser River Sockeye and Pink Forecast](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast)  and [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data sets include a variable to reflect Pacific Decadal Oscillation (PDO) over the winter months, but the details of the variable definition differ. 

* *DFO Fraser Forecasting*  uses the **mean** of monthly PDO index values for Nov-Mar (just "Mean" below). Note: to make the 2 series directly comparable, we've assigned the Nov-March mean to the latter year (i.e., mean for Nov 2022 to March 2023 shows up as the 2023 indicator value)
* *NOAA Ocean Conditions Index* (just "Sum" below) uses the **sum** of monthly PDO index values for Jan-Mar (just "Sum" below)

Some initial observations:

* Scatterplots show that the two versions of the winter PDO variable provide the same signal for almost all years. Years with low mean values also have a low sum (e.g., 2000, 2009,2012,2022) and years with high mean values  also have a high sum (e.g., 1998, 2003, 2015, 2016). However, for the 2 most recent years, the mean and sum diverge considerably:
   * 2022 is an outlier in the mean variable, but consistent with the low end of the sum variable (i.e., sum is similar to 2000, 2009, and 2012)
   * 2023 is an extreme outlier in the mean variable, but consistent with the low end of the sum variable

* Visually, the sum variable seems to have more contrast across years (*but still pondering how to quantify, b/c CV doesn't apply to interval scale variables*)

* When environmental covariates are used qualitatively (e.g., to help choose among candidate forecast models, or in a stoplight approach), analysts will focus on years with extreme values. For some years, the sum variable and mean variable provide a very different picture (2022, 2023). *NOTE: working on a diagnostic plot for 2022 and 2023 specifically, stay tuned*


<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Scatter_All.png"
	width="400">


<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Scatter_Excl2023.png"
	width="400">
	
	
	
### Winter vs Summer PDO Variables

The [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data set includes a winter PDO variable (sum of monthly PDO for Jan-Mar) and a summer PDO variable (sum of monthly means for May-Sep).


*INCLUDE SOME COMPARISON PLOTS*

*DISCUSS WHETHER IT MAKES SENSE TO COMPARE THESE SIDE BY SIDE*
   * Are the relevant to different life-history stages and therefore to different brood years?