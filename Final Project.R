# install.packages("palmerpenguins")
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("tidyr")

library(palmerpenguins)
library(ggplot2)
library(dplyr)
library(tidyr)

data("penguins")

penguins_cleaned_version <- penguins %>%
  drop_na(species, island, bill_length_mm, flipper_length_mm)

ggplot(
  penguins_cleaned_version,
  aes(
    x = bill_length_mm, 
    y = flipper_length_mm,
    color = species
  )
) +
  
  geom_point(
    aes(shape = island),
    size = 3,
    alpha = 0.8
  ) +
  
  geom_smooth(
    aes(group = 1),
    method = "lm",
    formula = y ~ x,
    se = TRUE,
    color = "black",
    alpha = 0.2
  ) +
  
  scale_color_manual(
    values = c(
      "Adelie" = "#FFB6C1",
      "Chinstrap" = "#112F4B",
      "Gentoo" = "#FF4B33"
    )
  ) + 
  
  labs(
    title = "Correlation Analysis & Statistical Trends",
    subtitle = "Directional Relationship Between Bill Length and Flipper Length",
    x = "Bill Length (mm)",
    y = "Flipper Length (mm)",
    color = "Species",
    shape = "Island"
  ) +
  
  theme_minimal() +
  theme(
    panel.grid.minor = element_blank(),
    
    axis.line.x = element_line(colour = "black", linewidth = 0.8),
    axis.text.x = element_text(size = 10, margin = margin(t = 10)),
    axis.title.x = element_text(face = "bold", size = 12, margin = margin(t = 10)), 
    
    axis.line.y = element_line(colour = "black", linewidth = 0.8),
    axis.text.y = element_text(size = 10, margin = margin(r = 10)), 
    axis.title.y = element_text(face = "bold", size = 12, margin = margin(r = 10)),
    
    plot.title = element_text(face = "bold", size = 14, hjust = 0, margin = margin(b = 5)),
    plot.subtitle = element_text(size = 11, hjust = 0, margin = margin(b = 15)),
    
    legend.position = "right",
    legend.title = element_text(face = "bold", size = 10),
    legend.text = element_text(size = 9)
  )

#MARKDOWN COMMENTS
#1. Based on the plot, Adelie penguins have the smallest bills and flippers, Chinstrap penguins have longer bills but shorter flippers, and Gentoo penguins have both long bills and the longest flippers.
#2. Furthermore, the species are tightly linked to specific islands showing that Torgersen island has only Adelie penguins, Dream island hosts Chinstrap and Adelie, while Gentoo penguins are found exclusively on Biscoe island.
#3. Overall, the plot shows that there is a general positive linear relationship across bill length and flipper length.