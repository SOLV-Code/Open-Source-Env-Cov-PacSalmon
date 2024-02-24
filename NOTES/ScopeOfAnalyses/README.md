## Scope of Analyses

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*

Figures created using [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/3_ScopeOfAnalyses.R).


### Key Points

Analyses using environmental data sets included in this repository vary widely in terms of the number of stocks they look at and the number of environmental covariates they test.


Data Set |  Stocks | Env. Covar  | Comment
-- | -- | -- | --
[DFO Fraser River Sockeye and Pink Forecast](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast) | 28 | 7 | Text
[Chasco et al. (2021) paper](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/Chascoetal2021_SnakeRiverCk) | 1 | 40 | Analysis looks smolt-to-adult survival of Snake River Chinook, split into wild and hatchery-origin fish. The environmental covariates include seasonal versions (e.g., PDO winter, PDO spring).





* The [NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) data set includes a winter PDO variable (sum of monthly PDO for Dec-Mar) and a summer PDO variable (sum of monthly means for May-Sep).
* The [Chasco et al. (2021) paper](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/Chascoetal2021_SnakeRiverCk) tested four seasonal PDO covariates (Winter: mean Dec-Feb, Spring: mean Mar-May, Summer: mean Jun-Aug, Autumn: mean Sep-Nov). They found that the PDO covariates had a negative effect on smolt-to-adult survival of wild Snake River Chinook, with summer PDO the strongest.
* [DFO Fraser River Sockeye and Pink Forecast](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast) data set includes 1 PDO covariate, the mean for Nov-Mar.





