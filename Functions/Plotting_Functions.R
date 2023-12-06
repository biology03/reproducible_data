# Defining a function to produce a results graph, showing the regression line,
  # the 95% confidence interval, and results of the stats test (R^2 and p value)
results_figure <- function(hypothesis_data){
  hypothesis_data %>%
   ggplot(aes(x = flipper_length_mm, y = body_mass_g, colour = species)) +
   geom_point() +
   geom_smooth(method = "lm", colour = "black", formula = y ~ x) +
   labs(x = "Body Mass (g)", y = "Flipper Length (mm)") +
   scale_color_manual(values = c("cyan3","purple","red")) +
   ggtitle("A Figure to Show a Linear Regression of the Relationship Between Body Mass\n and Flipper Length in Three Species of Penguins") +
   annotate("text", x = 220, y = 3500, label = paste("R-squared = 0.8528")) +
   annotate("text", x = 220, y = 3300, label = paste("p-value < 2.2e-16")) +
   theme_bw()
}
