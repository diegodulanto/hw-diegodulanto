library(palmerpenguins)
library(ggplot2)

ggplot(penguins) +
  aes(x = species,
      y = flipper_length_mm,
      fill = species,
      color = species) +
  geom_jitter(height = 0.15)
  geom_smooth(color = "black",
               fill = "black")
