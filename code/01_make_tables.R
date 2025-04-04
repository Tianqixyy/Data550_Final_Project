here::i_am("code/01_make_tables.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)
library(knitr)
library(dplyr)
library(gtsummary)

table_one <- data %>%
  select(diagnosis,radius_mean,texture_mean,perimeter_worst,concave.points_worst, area_worst) %>%
  head(5) %>%
  kable(caption = "First 5 rows of data")

saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)


table_two <- data |>
  select("diagnosis", "concave.points_worst", "perimeter_worst","texture_mean", "area_worst") |>
  tbl_summary(by = diagnosis)  |>
  add_overall() |>
  add_p()

saveRDS(
  table_two,
  file = here::here("output/table_two.rds")
)

