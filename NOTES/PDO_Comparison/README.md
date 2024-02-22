## PDO Comparison

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*

Figures created from the [merged data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/Merged_CovariateSet.csv) and the [detailed PDO comparison data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Data.csv) using [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/2_PDO_Comparisons.R).


### Contents

* [Key Points](#Key-Points)
* [Plots: Winter vs. Summer PDO Variables](#Plots-Comparing-Winter-vs-Summer-PDO-Variables)
* [Plots: Comparing Winter PDO Variables](#Plots-Comparing-Alternative-Winter-PDO-Variables)
* [Plots: Long-term changes in PDO Variables](#Plots-Summarizing-Long-Term-Changes)


### Key Points

Three of the data sets include covariates based on the Pacific Decadal Oscillation (PDO) index, but they are all slightly different:

* The [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data set includes a winter PDO variable (sum of monthly PDO for Dec-Mar) and a summer PDO variable (sum of monthly means for May-Sep).
* The [Chasco et al. (2021) paper](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/Chascoetal2021_SnakeRiverCk) tested four seasonal PDO covariates (Winter: mean Dec-Feb, Spring: mean Mar-May, Summer: mean Jun-Aug, Autumn: mean Sep-Nov). They found that the PDO covariates had a negative effect on smolt-to-adult survival of wild Snake River Chinook, with summer PDO the strongest.
* [DFO Fraser River Sockeye and Pink Forecast](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast) data set includes 1 PDO covariate, the mean for Nov-Mar.

A potential source of discrepancies between alternative implementations is how environmental covariates are lined up with each other and with the salmon data. The three implementations are consistent. The *NOAA Ocean Conditions Index* compares the PDO covariate with regional covariates like sea surface temperature in the same calendar year (e.g., rank of the sum of PDO index for Jan-Mar 2018 and rank of the mean sea surface temperature for May-Sep 2018 are combined into the mean rank for 2018). *DFO Fraser Forecasting* maps the PDO covariate to the winter preceding outmigration and the sea surface temperature covariate to year of ocean entry, which are in the same calendar year. The *Chasco et al. (2021)* paper looks at alternative seasonal PDO covariates (Dec-Feb, Mar-May,Jun-Aug,Sep-Nov) and maps all four onto the same calendar year, then matches them with the year of outmigration (*"marine conditions spanning the winter prior to
when fish out-migrated to the fall after outmigration."*). In the [merged data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/Merged_CovariateSet.csv) and the [detailed PDO comparison data set](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Data.csv) we replicate this by assigning the means and sums to the latter year (i.e., mean for Nov 2020 to March 2021 shows up as the 2021 indicator value). 



*Insert text on the assumed mechanisms linking the alternative PDO covariates to salmon surival. Started a discussion thread [here](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/69).*



[Scatterplots](#Plots:-Winter-vs-Summer-PDO-Variables) comparing alternative seasons used for the PDO-based covariates show that these variations generally produce the same signal for the same year. Years with low winter values also have a low values the following summer. However, the link is noisy, so that for some individual years the winter and summer covariates will provide a different signal (e.g. in a pre-season run size forecast).


[Scatterplots]((#Plots-Comparing-Alternative-Winter-PDO-Variables)) comparing alternative versions of the winter PDO variable show that these variations provide the same signal for the same year. Years with low mean values also have a low sum (e.g., 2000, 2009,2012,2022) and years with high mean values also have a high sum (e.g., 1998, 2003, 2015, 2016). However, for some years with larger differences between the monthly values the winter PDO covariate is more sensitive to nuances of definition (mean vs. sum, whether Oct or Nov are included). For example:
 
* monthly PDO index values were quite stable in the winters of 2003/2004 and 2010/2011, so the alternative definitions don't affect the signal.

* monthly PDO index values shifted quite a bit in the winters of 1994/1995 and 2021/2022, so alternative definitions might change how you interpret those year (e.g. when providing qualitative context for a run size forecast).

[Plots of long-term trends](#Plots-Summarizing-Long-Term-Changes) can provide a perspective on the covariates beyond the time window used in modelling, given that the quantitative estimates used for most salmon stocks only go back 30-60 years:

* Many environmental indicators have become more variable in recent years. However, the Oct-Mar range in monthly PDO index  has been smaller since the 1970s than it was from the 1900s to the 1960s. *Is there some quirk in the raw data or index calculation methods to explain that? Could it be due to the [removal of the underlying long-term trend](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/26)? Based on the summary of major changes to the source data, [here](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/DATA/DFO_FraserSockeyeForecast/PDOIdxSource_Data_OperationalChanges.csv), there are were changes in calculation in 1982 and 2002, but not in the 1960s*	

	
	
	
	
### Plots Comparing Winter vs Summer PDO Variables




<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_FraserFCvsChascoPaper.png" width="500">



<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_WintervsSummer_NOAA.png"
	width="500">





### Plots Comparing Alternative Winter PDO Variables



<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_FraserFCvsChascoPaper_Winter.png" width="500">



<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_Scatter_All.png"
	width="400">




<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_ExampleYears.png"
	width="500">




### Plots Summarizing Long Term Changes
	

	
<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/PDO_Comparisons/PDO_Comparisons_TimeSeriesOfRanges.png"
	width="500">
	
	
