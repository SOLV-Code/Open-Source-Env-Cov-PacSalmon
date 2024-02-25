## Scope of Analyses

*These notes are designed for collaborative editing. Just click the pencil icon above to edit directly in your browser (must be logged into GitHub).*

Figures created using [this script](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/CODE/3_ScopeOfAnalyses.R).


### Key Points

Data sets included in this repository vary widely in terms of the number of stocks the analyses look at, the number of environmental covariates they test, and whether up-to-date series are either directly available or have been recreated.


Data Set |  Stocks | Env. Covar  | Comment | Status
-- | -- | -- | -- | --
[DFO Fraser River Sockeye and Pink Forecast](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_FraserSockeyeForecast) | 28 | 7 | Annually complete a retrospective test of models with and without env. covariates at different scales (PDO, regional SST, Fraser River discharge) | Most series recreated
[NOAA Ocean Conditions Index](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/NOAA_OceanConditionsIndex) | NA  | 8 | General index, not designed for a specific stock (but variables selected based on previous work). Covers env. covariates at different scales (PDO, regional SST, deep salinity). Also includes 8 biological covariates (e.g., copepod richness). | Up-to-date series available from source
[Chasco et al. (2021) paper](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/Chascoetal2021_SnakeRiverCk) | 1 | 40 | Analysis looked at smolt-to-adult survival of Snake River Chinook, split into wild and hatchery-origin fish. The environmental covariates include seasonal versions (e.g., PDO winter, PDO spring). | Some series recreated
[Peterman et al. (2009) summary paper](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/Petermanetal2009_Summary) | 120 | 3 | Analyses summarized in this paper focused on covariates capturing *coastal* conditions at a regional scale (upwelling, SST, SSS), for stocks from Washington State to western Alaska. | None of the series recreated yet
[DFO State of the Pacific Oceans](https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/tree/main/DATA/DFO_StateOfThePacificOcean) | NA | NA | Detailed description of ocean conditions produced annually. Not currently a standard set of analyses or covariates. Recent reports include a systematic table with qualitative ratings. | NA





<img src="https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/blob/main/OUTPUT/ScopeOfAnalyses/ScopeAndCurrentStatus.png" width="600">

