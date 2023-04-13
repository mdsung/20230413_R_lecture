library(tidyverse)
library(here)
library(magrittr)

total_col <- c(
    "PatientID", "IPA", "sex", "age_label", "underlying_disease",
    "lung_transplantation_type", "BMI_label", "HTN", "DM",
    "CKD", "LC", "CVD",
    "candida", "crypto", "other", "serum_AGT_label",
    "BALF_AGT_label", "BDG_label", "serum_AGT", "BALF_AGT",
    "BDG"
)

data <- read_csv(here("data/raw/IPA.csv")) %>%
    mutate(id_flag = ifelse(is.na(Sex), 0, 1), .before = IPA) %>%
    mutate(PatientID = cumsum(id_flag), .before = id_flag) %>%
    select(-id_flag) %>%
    set_colnames(total_col) %>%
    select(PatientID, IPA, sex, age_label, BMI_label, underlying_disease, lung_transplantation_type, HTN, DM, CKD, LC, CVD, candida, crypto, other, serum_AGT, BALF_AGT, BDG) %>%
    fill(PatientID:other) %>%
    mutate(IPA = ifelse(IPA == 2, 1, IPA)) %>%
    mutate(across(c(-serum_AGT, -BALF_AGT, -BDG), factor))

data %>% write_csv(here("data/raw/tutorial_ipa.csv"))
