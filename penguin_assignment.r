## ---------------------------
##
## Script name: penguin_assignment.r
##
## Purpose of script: Upload and clean penguin data from palmerpenguins library.
## Run ANCOVA analysis of the effects of body mass and species on flipper length
## in Adelie and Chinstrap penguins.
## Produce and save graphs presenting ANCOVA analysis.
##
## Date Created: 06/12/2022
##
## ---------------------------

#PLEASE SET WORKING DIRECTORY MANUALLY (Session>Set Working Directory) OR INSERT 
#WORKING DIRECTORY BELOW (un-comment code):
#setwd()

# Loading Libraries and functions ----
source("functions/libraries.r")
source("functions/cleaning.r") 
source("functions/plotting.r")
source("functions/analysis.r")

write.csv(penguins_raw, "data_raw/penguins_raw.csv")  # Backing up raw data

# Cleaning data 
# Removing empty rows and columns, removing columns beginning with "delta",
# removing "comments" column and standardising column names
penguins_clean <- cleaning(penguins_raw)
write.csv(penguins_clean, "data_clean/penguins_clean.csv")  # Backing up clean data

# Filtering data - removing na values, removing all Gentoo data, removing all 
# columns other than species, body_mass_g and flipper_length_mm. 
penguins_flipper <- flipper_clean(penguins_clean)


# Running ANCOVA Analysis
# Assessing the effects of body mass and species and their interaction on flipper 
# length. Printing default diagnostic plots
ancova(penguins_flipper)

#Plotting graph
(flipper_line <- plot_flip_mass(penguins_flipper))

#Saving plot as .svg (vector file) file
save_plot_svg(penguins_flipper, 
                      "figures/Penguin_Vector.svg", 
                      width = 25, height = 15, scaling = 1)

#Saving multiple plots as .png files:
#Specifying plot names and parameters as data frame
penguin_files <- data.frame(
  file_name = c("figures/Penguin_Article.png","figures/Penguin_Poster.png","figures/Penguin_Presentation.png"), 
  file_widths = c(25,50,25),
  file_heights = c(15,30,15),
  file_scaling=c(1, 3.4, 1.7))

save_many_plots_png(penguins_flipper)  # saving plots




