## code to prepare `DATASET` dataset goes here

library(tidyverse)
library(here)

filenames <- dir(path = c(here(), "data-raw/fars_raw/vehicles"),
                 pattern = "*.csv",
                 full.names = TRUE)

involving <-  dir(path = c(here(), "data-raw/fars_raw/vehicles"),
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

vehicles <- map2_df(filenames, involving, clean_table)

usethis::use_data(vehicles, overwrite = TRUE)

persons <- read_csv("data-raw/fars_raw/persons/gender_race.csv", skip = 1) %>%
  select(-Total) %>%
  fill(X1) %>%
  filter(X1 %nin% "Total", X2 %nin% "Total") %>%
  pivot_longer(cols = `2004`:`2018`, names_to = "year", values_to = "n") %>%
  rename(sex = X1, race = X2) %>%
  group_by(year, sex, race) %>%
  arrange(year) %>%
  ungroup()

usethis::use_data(persons, overwrite = TRUE)

agetimes <- read_csv("data-raw/fars_raw/times/age_times.csv", skip = 1) %>%
  select(-Total) %>%
  fill(X1) %>%
  filter(X1 %nin% "Total", X2 %nin% "Total") %>%
  pivot_longer(cols = `2004`:`2018`, names_to = "year", values_to = "n") %>%
  rename(age = X1,
         time = X2) %>%
  group_by(year, age, time) %>%
  arrange(year) %>%
  ungroup() %>%
  mutate(time_fct = na_if(time, "Unknown Hours"),
         time_fct = factor(time_fct, levels = unique(agetimes$time), ordered = TRUE),
         time_fct = droplevels(time_fct)) %>%
  select(age, time, time_fct, year, n)

usethis::use_data(agetimes, overwrite = TRUE)
