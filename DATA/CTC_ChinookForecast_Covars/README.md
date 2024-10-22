## Chinook Technical Committee (CTC) Forecasting

**Status**: In Progress

**Maintained by**: This entry maintained by [SOLV-Code](https://github.com/SOLV-Code), with contributions from [nembrown](https://github.com/nembrown). Official version of the data set maintained by the [CTC of the Pacific Salmon Commission](https://www.psc.org/membership-lists/).

**Last Data Update**: 2024-08-02

### Introduction

The Chinook Technical Committee (CTC) provides technical support for international coordination of Chinook management in Alaska, British Columbia, and Washington. One key task of the CTC is the annual forecasting process. The forecasting tool kit is available online as an [R package](https://github.com/SalmonForecastR/ForecastR-Package) and [Shiny App](https://github.com/SalmonForecastR/ForecastR-App). For the latest information about ForecastR, check out the [ForecastR Releases Repo](https://github.com/SalmonForecastR/ForecastR-Releases).

The CTC annually generates a comprehensive data set of environmental and biological covariates for exploration in the forecasting process. These include large-scale variables like Pacific Decadal Oscillation (PDO) and Oceanic Niño Index (ONI) as well as more localized variables like Sea Surface Temperature at the lighthouse nearest to the ocean entry point for each stock.


### Status of Data Set

The latest version of the data set is not currently published online, but it is available upon request from the [CTC of the Pacific Salmon Commission](https://www.psc.org/membership-lists/). In addition, the code used to generate the data set is available in the [covariates_forecastr repository](https://github.com/nembrown/covariates_forecastr).

For PSEC, we've extracted the large-scale environmental covariates from the CTC data file for 2024, provided by [nembrown](https://github.com/nembrown). 

**Variables extracted from the covariates_forecastr data set**

Base Variable | Covariate (PSEC) | Covariate (CTC) | Description  | Year Match
-- | -- | -- | -- | --
Oceanic Niño Index (ONI) | CTC_ONI_AnnualMean | cov_ONI_yearly_mean	| Mean of monthly values Jan-Dec using Nino 3.4 series  | TBI
Oceanic Niño Index (ONI) | CTC_ONI_AnnualAnomaly | cov_ONI_yearly_anomaly		|   TBI  using Nino 3.4 series| TBI
Oceanic Niño Index (ONI) | CTC_ONI_SummerMean | cov_ONI_summer_mean		| Mean of monthly values May-Sep (inclusive) using Nino 3.4 series  | TBI
Oceanic Niño Index (ONI) | CTC_ONI_SummerAnomaly| cov_ONI_summer_anomaly		| TBI  using Nino 3.4 series | TBI
Southern Oscillation Index (SOI) | CTC_SOI_SummerMean| cov_SOI_summer_mean		| Mean of monthly values May-Sep (inclusive)    | TBI
Southern Oscillation Index (SOI) | CTC_SOI_AnnualMean | cov_SOI_yearly_mean		|  Mean of monthly values Jan-Dec   | TBI
Pacific Decadal Oscillation (PDO) | CTC_PDO_SummerMean | cov_PDO_summer_mean		| Mean of monthly values May-Sep (inclusive) using ERSST Version 5 | TBI
Pacific Decadal Oscillation (PDO) | CTC_PDO_AnnualMean | cov_PDO_yearly_mean		|  Mean of monthly values Jan-Dec using ERSST Version 5   | TBI
North Pacific Gyre Oscillation (NPGO) | CTC_NPGO_AnnualMean | cov_NPGO_yearly_mean		|  Mean of monthly values Jan-Dec using AVISO Satellite SSHa   | TBI
North Pacific Gyre Oscillation (NPGO) | CTC_NPGO_SummerMean | cov_NPGO_summer_mean		| Mean of monthly values May-Sep (inclusive) using AVISO Satellite SSHa   | TBI
East Pacific - North Pacific Index (EPNP) | CTC_EPNP_AnnualMean | cov_EPNP_yearly_mean		|  Mean of monthly values Jan-Dec  | TBI
East Pacific - North Pacific Index (EPNP) | CTC_EPNP_SummerMean | cov_EPNP_summer_mean	| Mean of monthly values May-Sep (inclusive)  | TBI



### Open Questions 

Follow the links to see the discussion thread and leave comments.

* None yet

3) [Means vs. Anomalies: the data set has both for some variables, but not others. Why?](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/161)




### Highlights from Published Analyses

* To be included


### References

* Anything to cite here?



### Details

The data set shared by the CTC has ready-to-use environmental covariates. No further processing is required for integrating these series into the PSEC data set. We just modified the variable labels to match the PSEC nomeclature.

