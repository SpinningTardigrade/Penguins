## ---------------------------
##
## Script name: analysis.R
##
## Purpose of script: Contains the analysis function needed to run 
## penguin_assignment.r
##
## Date Created: 06/12/2022
##
## ---------------------------

# Performs ANCOVA analysis of effect of body mass and species on flipper length.
# Fits linear model, displays diagnostic plots, displays summary and anova tables

ancova <- function(penguins_flipper){
  # Defining ancova model
  penguins_flipper_model <- lm(flipper_length_mm ~ body_mass_g * species, data = penguins_flipper)
  # Displaying diagnostic plots
  par(mfrow=c(2,2))
  plot(penguins_flipper_model) 
  dev.off
  #  Displaying summary and anova tables
  print(summary(penguins_flipper_model))
  print(anova(penguins_flipper_model))
}


