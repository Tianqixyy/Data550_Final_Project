here::i_am("code/02_make_figures.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

# 加载 ggplot2
library(dplyr)
library(ggplot2)
library(gridExtra)
# 绘制直方图
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


ggsave(
  here::here("output/distribution1.png"),
  plot = p1,
  device = "png"
)

ggsave(
  here::here("output/distribution2.png"),
  plot = p2,
  device = "png"
)

ggsave(
  here::here("output/distribution3.png"),
  plot = p3,
  device = "png"
)


