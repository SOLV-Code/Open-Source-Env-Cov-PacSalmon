
if(FALSE){
# only run these lines if you want to update the package
library(remotes)
remotes::install_github("pbs-assess/pacea")
}

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

write_csv(pacea.annual,"DATA/DFO_PACEA_Package/GENERATE_pacea_series_annual.csv")


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

pacea.monthly <- full_join(ao %>% dplyr::rename(Pacea_AO_anomaly=anomaly),
													 mei %>% dplyr::rename(Pacea_MEI_anomaly=anomaly), by=c("year","month")) %>%
									full_join(npgo %>% dplyr::rename(Pacea_NPGO_anomaly=anomaly), by=c("year","month")) %>%
									full_join(npi_monthly %>% dplyr::rename(Pacea_NPIm_value=value),by=c("year","month")) %>%
									full_join(oni %>% dplyr::rename(Pacea_ONI_value=value,Pacea_ONI_anomaly=anomaly),by=c("year","month")) %>%
									full_join(pdo %>% dplyr::rename(Pacea_PDO_anomaly=anomaly),by=c("year","month")) %>%
										dplyr::rename(Year = year,Month = month)
pacea.monthly

write_csv(pacea.monthly,"DATA/DFO_PACEA_Package/GENERATE_pacea_series_monthly.csv")
















