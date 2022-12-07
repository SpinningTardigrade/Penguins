## ---------------------------
##
## Script name: plotting.R
##
## Purpose of script: Contains the plotting functions needed to run 
## penguin_assignment.r
##
## Date Created: 06/12/2022
##
## ---------------------------

#  Plots line graph for penguin ANCOVA analysis

plot_flip_mass <- function(penguins_flipper){
  colours <- c("darkorange","purple")  # Setting colour scheme
  labels <- c("Adelie","Chinstrap")  # Setting legend labels
    ggplot(penguins_flipper, aes(x=body_mass_g, y=flipper_length_mm, color=species)) +
      geom_point(aes(shape=species, color=species)) +
      geom_smooth(method=lm, aes(fill=species))+
      labs(title = "Body Mass Correlates with Flipper Length",
           x="Body Mass (g)",
           y="Flipper Length (mm)",
           caption = "Lines are regression lines, shaded areas show 95% confidence intervals")+
      scale_color_manual(values = colours, name="Species", labels = labels)+  
      scale_fill_manual(values = colours, name ="Species", labels = labels)+
      scale_shape_manual(values=c(3, 16, 17), name="Species", labels = labels)+
      theme_bw()+
      theme(legend.position = "bottom", 
            plot.title = element_text(face="bold", hjust = 0.5),
            plot.caption = element_text(face="italic", hjust = 0.5),
            legend.title = element_text(face="bold"))
}



# Saves plot as single svg file

save_plot_svg <- function(penguins_flipper, 
                                  filename, width, height, scaling){
  width_inches = width/2.54
  height_inches = height/2.54
  svglite(filename, width = width_inches,
          height = height_inches,
          scaling = scaling)
  flipper_line <- plot_flip_mass(penguins_flipper)
  print(flipper_line)
  dev.off()
}



# Saves plot as single png file

save_plot_png <- function(penguins_flipper, 
                          filename, width, height, res, scaling){
  agg_png(filename, width   =  width, 
          height  =  height, 
          units   =  "cm", 
          res     =  res, 
          scaling =  scaling)
  flipper_line <- plot_flip_mass(penguins_flipper)
  print(flipper_line)
  dev.off()
}



# Saves plot as multiple png files, based on data-frame of file parameters 
# (specified in penguin_assignment.r)

save_many_plots_png <- function(penguins_flipper){
  for (i in 1:length(penguin_files$file_name)) {
    save_plot_png(penguins_flipper, 
                  penguin_files[i,1], 
                  width = penguin_files[i,2], 
                  height = penguin_files[i,3], 
                  scaling = penguin_files[i,4],
                  res = 600) 
  }
}







