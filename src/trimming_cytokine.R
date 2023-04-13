library(tidyverse)
library(here)

data <- read_csv(here('data/raw/tutorial_cytokine.csv')) 
data %>% 
    filter(Project == 'Longitudinal Sepsis') %>%
    filter(Sample %in% c("S02", "S03")) %>%
    filter(Cytokine %in% c("IL-6", "IL-10", "IL-2")) %>%
    write_csv('data/raw/tutorial_cytokine_trimmed.csv')

