here::i_am("code/03_make_model.R")
library(cardx)
library(broom)
library(broom.helpers)
library(car)
library(parameters)
data <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(gtsummary)

data$diagnosis <- as.factor(data$diagnosis) 
logit_model <- glm(diagnosis ~ radius_mean + perimeter_worst  + texture_mean + area_worst , 
                   data = data, 
                   family = binomial)

regression_table <- logit_model %>%
  tbl_regression(exponentiate = TRUE) %>%
  add_global_p() %>% 
  bold_labels()  

saveRDS(
  logit_model,
  file = here::here("output/regression_models.rds")
)

saveRDS(
  regression_table,
  file = here::here("output/regression_tables.rds")
)

