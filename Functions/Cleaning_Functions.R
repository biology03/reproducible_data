### This file contains defined functions to clean the penguins_raw data before using it in analysis

# First this function removes unnecessary columns for analysis (ie Delta 13/15 and comments)
clean_function <- function(penguins_data) {
  penguins_data %>%
    select(-starts_with("Delta")) %>%
    select(-Comments) %>%
    clean_names()
}

# Clean up the case type of the column names (ie for lower case and underscores)
clean_column_names <- function(penguins_data) {
  penguins_data %>%
    clean_names()
}

# Shorten the species names so they are easier to read/visualise
shorten_species <- function(penguins_data) {
  penguins_data %>%
    mutate(species = case_when(
      species == "Adelie Penguin (Pygoscelis adeliae)" ~ "Adelie",
      species == "Chinstrap penguin (Pygoscelis antarctica)" ~ "Chinstrap",
      species == "Gentoo penguin (Pygoscelis papua)" ~ "Gentoo"
    ))
}

# Remove empty columns and rows as they are unnecessary
remove_empty_columns_rows <- function(penguins_data) {
  penguins_data %>%
    remove_empty(c("rows", "cols"))
}

# Subset by column name
subset_columns <- function(penguins_data, column_names) {
  penguins_data %>%
    select(all_of(column_names))
}

# Subset by penguin species
filter_by_species <- function(penguins_data, selected_species) {
  penguins_data %>%
    filter(species == selected_species)
}

# Subset by island
filter_by_island <- function(penguins_data, selected_islands) {
  penguins_data %>%
    filter(islands == selected_islands)
}

# Subset by sex
filter_by_sex <- function(penguins_data, selected_sex) {
  penguins_data %>%
    filter(sex == selected_sex)
}

# Define a function to remove NA values
remove_NA <- function(penguins_data) {
  penguins_data %>%
    na.omit()
}
