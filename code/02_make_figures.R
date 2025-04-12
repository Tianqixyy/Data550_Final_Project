here::i_am("code/02_make_figures.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)


library(dplyr)
library(ggplot2)
library(gridExtra)

p1 <- ggplot(data, aes(x = concave.points_worst, fill = diagnosis)) +
  geom_histogram(alpha = 0.6, position = "identity", bins = 30) +
  labs(title = "Concave points worst Distribution by Tumor Type", 
       x = "Concave points worst", 
       y = "Count") +
  scale_fill_manual(values = c("B" = "orange", "M" = "blue"), 
                    name = "Diagnosis", 
                    labels = c("Benign", "Malignant")) +
  theme_minimal()

p2 <- ggplot(data, aes(x = radius_mean, fill = diagnosis)) +
  geom_histogram(alpha = 0.6, position = "identity", bins = 30) +
  labs(title = "Radius Mean Distribution by Tumor Type", 
       x = "Radius Mean", 
       y = "Count") +
  scale_fill_manual(values = c("B" = "orange", "M" = "blue"), 
                    name = "Diagnosis", 
                    labels = c("Benign", "Malignant")) +
  theme_minimal()

p3 <- ggplot(data, aes(x = perimeter_mean, fill = diagnosis)) +
  geom_histogram(alpha = 0.6, position = "identity", bins = 30) +
  labs(title = "Perimeter mean Distribution by Tumor Type", 
       x = "Perimeter mean", 
       y = "Count") +
  scale_fill_manual(values = c("B" = "orange", "M" = "blue"), 
                    name = "Diagnosis", 
                    labels = c("Benign", "Malignant")) +
  theme_minimal()

g <- arrangeGrob(p1, p2, p3, ncol = 3)
ggsave(
  here::here("output/distribution1.png"), 
  plot=g, 
  width = 20, height = 5)



