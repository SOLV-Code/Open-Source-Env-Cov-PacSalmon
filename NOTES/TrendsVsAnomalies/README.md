## Trends vs. Anomalies

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*


### Contents

* [Key Points](#Key-Points)
* [Plots: ONI Trends and Anomalies](#Plots-ONI-Trends-and-Anomalies)
* [Plots: NPI Trends and Anomalies](#Plots-NPI-Trends-and-Anomalies)
* [Recommendations for Salmon Modelling](#Recommendations-for-salmon-modelling)


### Key Points

Large-scale environmental covariates are commonly used in terms of anomalies rather
than actual values, including the *Oceanographic Niño Index* (ONI), the *North Pacific Index* (NPI),  
the *Pacific Decadal Oscillation* (PDO), and the *North Pacific Gyre Oscillation* (NPGO). 

The exact calculation of the anomalies differs between these key indices, and maybe even between 
versions of the same index. For example:

- The ONI monthly anomalies use a moving 30-year base period for each month, updated every 5 years in some periods and more frequently in other periods ([Plot](Plots-ONI-Trends-and-Anomalies), details in this [discussion thread](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/118))

- The NPI monthly anomalies seem to use the same fixed base value (mean for 1925-1989) as the reference for all months, but month-specific base values would give a very different picture for the anomalies ([Plot](Plots-NPI-Trends-and-Anomalies), details in this [discussion thread](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/118)).

- The PDO index [source file](http://research.jisao.washington.edu/pdo/PDO.latest) states that the underlying warming trend has been removed from the index to focus on anomalies, but still need to dig through sources to find specifics. For example, warming trend handled differently in alternative versions of the PDO the OI SST v2 vs. ER SST v5? (details in this [discussion thread](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/26))

In addition to questions regarding specific choices made for individual indices, this also raises a more fundamental question: 
*Are these data treatment choices, made for oceanographic purposes, approporiate for covariates used in salmon models?*

For example, when testing the effect of including the PDO index in a salmon forecast, does it make sense that the overall warming trend is excluded? [DFO's Fraser Sockeye Forecasts](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast) test a separate Sea-Surface-Temperature (SST) covariate that picks up the overall warming trend, but that one is currently at a more local scale (e.g., SST at Pine Island lighthouse). The moving base periods used for the ONI anomalies also have the effect of removing part of the overall warming trend (see [plot](#Plots-ONI-Trends-and-Anomalies)).



## Recommendations For Salmon Modelling

*To be included based on discussions*




	
	
### Plots: ONI Trends and Anomalies



<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/Values_CrossCheck/ONI_BaseValueTrends.png"
	width="500">





### Plots: NPI Trends and Anomalies



<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/Values_CrossCheck/ComparisonOfNPIAnomalies.png" width="500">


