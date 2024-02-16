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

**Some initial observations**

Scatterplots show that the two versions of the winter PDO variable provide the same signal *for the same year*. Years with low mean values also have a low sum (e.g., 2000, 2009,2012,2022) and years with high mean values also have a high sum (e.g., 1998, 2003, 2015, 2016). 


<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Scatter_All.png"
	width="400">


The winter PDO covariate is more sensitive to nuances of definition (mean vs. sum, whether Oct or Nov are included) for years with larger differences between the monthly values. For example:
 
* monthly PDO index values were quite stable in the winters of 2003/2004 and 2010/2011, so the alternative definitions don't affect the signal.

* monthly PDO index values shifted quite a bit in the winters of 1994/1995 and 2021/2022, so alternative definitions might change how you interpret that year (e.g. when providing qualitative context for a run size forecast).


<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_ExampleYears.png"
	width="400">

	
Many environmental indicators have become more variable in recent years. However, the Oct-Mar range in monthly PDO index  has been smaller since the 1970s than it was from the 1900s to the 1960s. *Is there some quirk in the raw data or index calculation methods to explain that?*	
	
<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_TimeSeriesOfRanges.png"
	width="500">
	
	
	
### Winter vs Summer PDO Variables

The [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data set includes a winter PDO variable (sum of monthly PDO for Jan-Mar) and a summer PDO variable (sum of monthly means for May-Sep).


*INCLUDE SOME COMPARISON PLOTS*

*DISCUSS WHETHER IT MAKES SENSE TO COMPARE THESE SIDE BY SIDE*
   * Are the relevant to different life-history stages and therefore to different brood years?