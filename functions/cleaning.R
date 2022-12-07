## ---------------------------
##
## Script name: cleaning.R
##
## Purpose of script: Contains the cleaning functions needed to run 
## penguin_assignment.r
##
## Date Created: 06/12/2022
##
## ---------------------------

# Standardises column names, removes empty rows and columns, removes columns 
# starting with "delta", removes "comments" columns 

cleaning <- function(data_raw){
  data_raw %>%
    clean_names() %>%
    remove_empty(c("rows", "cols")) %>%
    select(-starts_with("delta")) %>%
    select(-comments)
}



# Removes na values, removes Gentoo records, removes all columns other than
# species, body_mass_g and flipper_length_mm

flipper_clean <- function(data_clean){
  data_clean %>%
    filter(!is.na(body_mass_g)) %>%
    filter(!is.na(flipper_length_mm)) %>%
    filter(species!="Gentoo penguin (Pygoscelis papua)")%>%
    select(species, body_mass_g, flipper_length_mm)
    
}


