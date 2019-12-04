## code to prepare `DATASET` dataset goes here

library(tidyverse)
library(here)

filenames <- dir(path = c(here(), "data-raw/fars_raw"),
                 pattern = "*.csv",
                 full.names = TRUE)

involving <-  dir(path = c(here(), "data-raw/fars_raw"),
                 pattern = "*.csv",
                 full.names = FALSE)
involving <- stringr::str_remove(involving, "\\.csv")

clean_table <- function(filename, measure){

  varnames <- c("vehicle_type", rep(c("yes", "no", "total"), length(2004:2018) + 1))
  read_csv(filename, skip = 5, col_names = varnames) %>%
    select_at(vars(-contains("total"))) %>%
    select_at(vars(-contains("_15"))) %>%
    filter(vehicle_type %nin% "Total") %>%
    pivot_longer(yes:no_14, values_to = "n") %>%
    mutate(name = str_replace(name, "_\\d{1,2}", ""),
           involving = measure) %>%
    rename(present = name) %>%
    group_by(vehicle_type) %>%
    mutate(year = rep(2004:2018, each = 2)) %>%
    select(vehicle_type, year, involving, everything()) %>%
    pivot_wider(names_from = present, values_from = n) %>%
    group_by(year, vehicle_type) %>%
    arrange(year) %>%
    ungroup()

}

crashes <- map2_df(filenames, involving, clean_table)

usethis::use_data(crashes, overwrite = TRUE)
