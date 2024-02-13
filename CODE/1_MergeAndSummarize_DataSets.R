# MERGE AND SUMMARIZE DATA SETS


library(tidyverse)


merged.data <- read_csv("DATA/DFO_FraserSockeyeForecast/GENERATED_COVARS_DFOFraserRiverForecasts.csv") %>%
							full_join(read_csv("DATA/NOAA_OceanConditionsIndex/NOAAOceanCond_DATA.csv",comment = "#"),
												by="Year")


head(merged.data)



# as per https://stackoverflow.com/questions/72304594/added-commented-section-to-output-csv-with-write-csv
merged.filename <- "OUTPUT/Merged_CovariateSet.csv"

comment.text1 <- paste("# Merged set of all available records in the OSEC-PS repository")
comment.text2 <- paste("# Variable descriptions and source data available at https://github.com/SOLV-Code/Open-Source-Env-Cov-PacSalmon")
comment.text3 <- paste("# File generated on", format(Sys.time(), "%a %b %e %H:%M:%S %Y"))


write_lines(comment.text1, merged.filename)
write_lines(comment.text2, merged.filename, append = TRUE)
write_lines(comment.text3, merged.filename, append = TRUE)
merged.data |> colnames() |> paste0(collapse = ",") |> write_lines(merged.filename, append = TRUE)
write_csv(merged.data, merged.filename, append = TRUE)

