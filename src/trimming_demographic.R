library(tidyverse)
library(arrow)
library(here)

data <- read_feather(here("data/raw/longitudinal_sepsis_demographic.feather"))
data %>%
    select(No, age, sex) %>%
    filter(No <= 5) %>%
    write_csv(here("data/raw/tutorial_demographic.csv"))
