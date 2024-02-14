## PDO Comparison

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*


### Contents

* [Comparing Winter PDO Variables](#Alternative-Winter-PDO-Variables)
* [Winter vs. Summer PDO Variables](#Winter-vs-Summer-PDO-Variables)

### Alternative Winter PDO Variables

Both the [DFO Fraser River Sockeye and Pink Forecast](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast)  and [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data sets include a variable to reflect Pacific Decadal Oscillation (PDO) over the winter months, but the details of the variable definition differ. 

* *DFO Fraser Forecasting*  uses the **mean** of monthly PDO index values for Nov-Mar (just "Mean" below)
* *NOAA Ocean Conditions Index* (just "Sum" below) uses the **sum** of monthly PDO index values for Jan-Mar (just "Sum" below)

Some initial observations:

* Scatterplots show that the two versions of the winter PDO variable generally provide the same signal. Years with low mean values mostly also have a low sum (e.g., 2008, 2011,2021) and years with high mean values mostly also have a high sum (e.g., 2003, 2015, 2016). However, there are several years where the mean and sum diverge considerably. For example:
   * 2002 has a low sum but the second highest mean of the comparable years starting in 1998 (4th largest mean since 1900).
   * 2022 is an extreme outlier in the mean variable, but consistent with the low end of the sum variable (i.e., sum is similar to 2000, 2009, and 2012, all of which had middle-ground values for the mean variable)

* Visually, the sum variable seems to have more contrast across years (*but still pondering how to quantify, b/c CV doesn't apply to interval scale variables*)

* When environmental covariates are used qualitatively (e.g., to help choose among candidate forecast models, or in a stoplight approach), analysts will focus on years with extreme values. For some years, the sum variable and mean variable provide a very different picture (2002, 2022).

<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Scatter_All.png"
	width="400">


<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Scatter_Excl2022.png"
	width="400">
	
	
	
### Winter vs Summer PDO Variables

The [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data set includes a winter PDO variable (sum of monthly PDO for Jan-Mar) and a summer PDO variable (sum of monthly means for May-Sep).


*INCLUDE SOME COMPARISON PLOTS*

*DISCUSS WHETHER IT MAKES SENSE TO COMPARE THESE SIDE BY SIDE*
   * Are the relevant to different life-history stages and therefore to different brood years?