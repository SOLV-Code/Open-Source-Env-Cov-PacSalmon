
if(FALSE){
# only run these lines if you want to update the package
library(remotes)
install.packages("gh")
remotes::install_github("r-lib/usethis", force=TRUE)
remotes::install_github("pbs-assess/pacea")
1}

library(tidyverse)
library(pacea)

# check date of current install
pacea_installed()

# check whether there have been any more recent updates:
# https://github.com/pbs-assess/pacea/blob/main/NEWS.md
# https://github.com/pbs-assess/pacea/network


# open help page for the package to check which variables are included
# using this to populate the settings list
help(package = "pacea")

# Not including the following, because out of scope for PSEC
# but needs discussion!
# hake, herring, harbour seals, zooplankton_sog

# Not including the following, because need to figure out which, if any,
# annual summary indices to extract
# bccm outputs, buoy_sst,

# currently including the following annual variables
# ALPI - Aleutian Low Pressure Index
# NPI – North Pacific Index
pacea.annual <- full_join(alpi %>% dplyr::rename(Pacea_ALPI_Anomaly = anomaly),
					npi_annual %>% dplyr::rename(Pacea_NPI_Value = value,Pacea_NPI_Anomaly = anomaly),
					by=c("year")) %>% dplyr::rename(Year = year)
pacea.annual
write_csv(pacea.annual,"DATA/DFO_PACEA_Package/GENERATED_pacea_series_annual.csv")


# currently including the following monthly variables
#	AO - Arctic Oscillation
# ENSO MEI – Multivariate ENSO Index
# NPGO – North Pacific Gyre Oscillation
# NPI – North Pacific Index monthly values
# ONI – Oceanographic Niño Index
# PDO – Pacific Decadal Oscillation
ao
mei
npgo
npi_monthly
oni
pdo

help(pdo)


# npi_monthly doesn't have anomaly column
# ?npi_annual states that anomalies are calculated relative to 1925-1989 mean
base.mean.monthly <- mean( npi_monthly %>% dplyr::filter(year %in% 1925:1989) %>% select(value) %>% unlist(),na.rm=TRUE)
base.mean.monthly

# different from the 1008.9 hPa value in the npi_annual help file?
# mean of the annual values matches the help file
# explanation for discrepancy? _> started issue at https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon/issues/118
base.mean.annual <- mean(npi_annual %>% dplyr::filter(year %in% 1925:1989) %>% select(value) %>% unlist(),na.rm=TRUE)
base.mean.annual

# also: shouldn't it look at difference from mean for that month?
base.mean.by.month <- npi_monthly %>% dplyr::filter(year %in% 1925:1989) %>% dplyr::filter(year %in% 1925:1989) %>%
							group_by(month) %>% summarize(BaseMeanByMonth = mean(value,na.rm=TRUE))
base.mean.by.month

npi_monthly_mod <- npi_monthly %>% mutate(BaseMeanMonthly = base.mean.monthly,
											 BaseMeanAnnual = base.mean.annual) %>%
						left_join(base.mean.by.month, by="month") %>%
						mutate(anomaly_month = value - BaseMeanMonthly,
									 anomaly = value - BaseMeanAnnual, # using this as the default in the merge, for now
									 anomaly_bymonth = value - BaseMeanByMonth)

npi_monthly_mod <- npi_monthly_mod  %>% arrange(year,month) %>% mutate(plot_index = c(1:dim(npi_monthly_mod)[1]))
npi_monthly_mod
write_csv(npi_monthly_mod,"DATA/DFO_PACEA_Package/GENERATED_pacea_NPI_MonthlyAnomaliesVariations.csv")

oni$value+oni$anomaly
plot(oni$value+oni$anomaly,type="l")






pacea.monthly <- full_join(ao %>% dplyr::rename(Pacea_AO_anomaly=anomaly),
													 mei %>% dplyr::rename(Pacea_MEI_anomaly=anomaly), by=c("year","month")) %>%
									full_join(npgo %>% dplyr::rename(Pacea_NPGO_anomaly=anomaly), by=c("year","month")) %>%
									full_join(npi_monthly_mod %>% select(year, month, value, anomaly) %>%
															dplyr::rename(Pacea_NPIm_value=value,
																						Pacea_NPIm_anomaly=anomaly),by=c("year","month")) %>%
									full_join(oni %>% dplyr::rename(Pacea_ONI_value=value,Pacea_ONI_anomaly=anomaly),by=c("year","month")) %>%
									full_join(pdo %>% dplyr::rename(Pacea_PDO_anomaly=anomaly),by=c("year","month")) %>%
										dplyr::rename(Year = year,Month = month)

pacea.monthly  <- pacea.monthly %>% arrange(Year,Month) %>% mutate(plot_index = c(1:dim(pacea.monthly)[1]))
pacea.monthly

write_csv(pacea.monthly,"DATA/DFO_PACEA_Package/GENERATED_pacea_series_monthly.csv")














