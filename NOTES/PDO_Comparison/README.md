## PDO Comparison

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*

Figures created from the [merged data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/Merged_CovariateSet.csv) and the [detailed PDO comparison data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Data.csv) using [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/2_PDO_Comparisons.R).


**TO DO: include comparisons to the seasonal PDO covariates from the [Chasco et al. (2021) paper](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/Chascoetal2021_SnakeRiverCk). They found the strongest PDO effect was from Jun-Aug (their pdo.sum variable)**


### Contents

* [Comparing Winter PDO Variables](#Alternative-Winter-PDO-Variables)
* [Winter vs. Summer PDO Variables](#Winter-vs-Summer-PDO-Variables)

### Alternative Winter PDO Variables


Both the [DFO Fraser River Sockeye and Pink Forecast](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast)  and [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data sets include a variable to reflect Pacific Decadal Oscillation (PDO) over the winter months, but the details of the variable definition differ. 

* *DFO Fraser Forecasting*  uses the **mean** of monthly PDO index values for Nov-Mar (just "Mean" below). 
* *NOAA Ocean Conditions Index* (just "Sum" below) uses the **sum** of monthly PDO index values for Dec-Mar (just "Sum" below)


A potential source of discrepancies between alternative implementations is how environmental covariates are lined up with each other and with the salmon data. The DFO and NOAA implementations are consistent. The *NOAA Ocean Conditions Index* compares the PDO covariate with regional covariates like sea surface temperature in the same calendar year (e.g., rank of the sum of PDO index for Jan-Mar 2018 and rank of the mean sea surface temperature for May-Sep 2018 are combined into the mean rank for 2018). *DFO Fraser Forecasting* maps the PDO covariate to the winter preceding outmigration and the sea surface temperature covariate to ocean entry, which are in the same calendar year. In the [merged data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/Merged_CovariateSet.csv) and the [detailed PDO comparison data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Data.csv) we replicate this by assigning the means and sums to the latter year (i.e., mean for Nov 2020 to March 2021 shows up as the 2021 indicator value).

*Insert text on the assumed mechanism linking the PDO covariate to salmon surival. Started a discussion thread [here](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/69).*


**Some initial observations**

Scatterplot shows that the two versions of the winter PDO variable provide the same signal for the same year. Years with low mean values also have a low sum (e.g., 2000, 2009,2012,2022) and years with high mean values also have a high sum (e.g., 1998, 2003, 2015, 2016). 


<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Scatter_All.png"
	width="400">


The winter PDO covariate is more sensitive to nuances of definition (mean vs. sum, whether Oct or Nov are included) for years with larger differences between the monthly values. For example:
 
* monthly PDO index values were quite stable in the winters of 2003/2004 and 2010/2011, so the alternative definitions don't affect the signal.

* monthly PDO index values shifted quite a bit in the winters of 1994/1995 and 2021/2022, so alternative definitions might change how you interpret that year (e.g. when providing qualitative context for a run size forecast).


<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_ExampleYears.png"
	width="400">

	
Many environmental indicators have become more variable in recent years. However, the Oct-Mar range in monthly PDO index  has been smaller since the 1970s than it was from the 1900s to the 1960s. *Is there some quirk in the raw data or index calculation methods to explain that? Could it be due to the [removal of the underlying long-term trend](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/26)?*	
	
<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_TimeSeriesOfRanges.png"
	width="500">
	
	
	
### Winter vs Summer PDO Variables

The [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data set includes a winter PDO variable (sum of monthly PDO for Jan-Mar) and a summer PDO variable (sum of monthly means for May-Sep).

*Discuss whether it makes sense to compare these side by side.*

*Insert text on the assumed mechanism linking the summer PDO covariate to salmon surival, and how that is similar/different from the winter PDO covariate. Started a discussion thread [here](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/69).*




**Some initial observations**


Scatterplot shows that the winter and summer PDO variable provide generally the same signal for the same year. Years with low winter values also have a low summer values (e.g., 2008,2011,2012) and years with high winter values also have a high summer values (e.g., 2003, 2015, 2016).

<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_WintervsSummer_NOAA.png"
	width="500">



