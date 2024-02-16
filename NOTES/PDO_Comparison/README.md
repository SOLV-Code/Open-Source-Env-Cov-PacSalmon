## PDO Comparison

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*

Figures created from the [merged data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/Merged_CovariateSet.csv) and the [detailed PDO comparison data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Data.csv) using [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/2_PDO_Comparisons.R).


### Contents

* [Comparing Winter PDO Variables](#Alternative-Winter-PDO-Variables)
* [Winter vs. Summer PDO Variables](#Winter-vs-Summer-PDO-Variables)

### Alternative Winter PDO Variables


Both the [DFO Fraser River Sockeye and Pink Forecast](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast)  and [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data sets include a variable to reflect Pacific Decadal Oscillation (PDO) over the winter months, but the details of the variable definition differ. 

* *DFO Fraser Forecasting*  uses the **mean** of monthly PDO index values for Nov-Mar (just "Mean" below). 
* *NOAA Ocean Conditions Index* (just "Sum" below) uses the **sum** of monthly PDO index values for Dec-Mar (just "Sum" below)

Note: We've assigned the means and sums to the latter year (i.e., mean for Nov 2020 to March 2021 shows up as the 2021 indicator value)

Some initial observations:

* Scatterplots show that the two versions of the winter PDO variable provide the same signal. Years with low mean values also have a low sum (e.g., 2000, 2009,2012,2022) and years with high mean values also have a high sum (e.g., 1998, 2003, 2015, 2016). 

* Visually, the sum variable seems to have more contrast across years (*but still pondering how to quantify, b/c CV doesn't apply to interval scale variables*)




<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Scatter_All.png"
	width="400">


	
	
	
### Winter vs Summer PDO Variables

The [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data set includes a winter PDO variable (sum of monthly PDO for Jan-Mar) and a summer PDO variable (sum of monthly means for May-Sep).


*INCLUDE SOME COMPARISON PLOTS*

*DISCUSS WHETHER IT MAKES SENSE TO COMPARE THESE SIDE BY SIDE*
   * Are the relevant to different life-history stages and therefore to different brood years?