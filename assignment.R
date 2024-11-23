#Load  packages
library(palmerpenguins)
library(ggplot2)

#Make scatter plot with trend lines
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point(alpha = 0.6, size = 2) +                              #Make points more transparent
  geom_smooth(method = "lm", se = TRUE, aes(color = species)) +      #Linear regression lines to see the relationship
  labs(
    title = "Body Mass vs. Flipper Length by Penguin Species",
    x = "Flipper Length (mm)",
    y = "Body Mass (g)",
    color = "Species"
  ) +
  theme_minimal() 

