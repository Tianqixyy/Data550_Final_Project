here::i_am("code/00_clean_data.R")
absolute_path_to_data <- here::here("data", "breast-cancer.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)
library(labelled)
library(dplyr)
library(gtsummary)
var_label(data) <- list(
  id = "ID",
  diagnosis = " Diagnosis",
  concave.points_worst  = "Worst value of the concave points",
  radius_mean = "Radius mean",
  perimeter_mean = "Perimeter Mean",
  perimeter_worst = "Largest perimeter",
  texture_mean = "texture mean",
  area_worst = "largest tumor area"
)

saveRDS(
  data, 
  file = here::here("output/data_clean.rds")
)

