#' Vehicle-Level Counts of Fatal Automobile Accidents in the United States, 2004-2018
#'
#' A tibble containing selected vehicle-level characteristics of automobile crashes that resulted in at least one fatality, 2004-2018
#'
#' @format A tibble with 945 rows and 5 columns
#'
#' \describe{
#' \item{\code{vehicle_type}}{Type of vehicle in crash}
#' \item{\code{year}}{Year}
#' \item{\code{involving}}{Crashes that involved the following conditions: "distracted" driver, "drowsy" driver, "older" (65+) driver, "pedestrian", "rollover" of vehicle, "speeding", "younger" (15-24) driver.}
#' \item{\code{yes}}{Count of crashes where condition in "involving" was present.}
#' \item{\code{no}}{Count of crashes where condition in "involving" was not present.}
#'}
#'
#' @docType data
#' @keywords datasets
#' @name vehicles
#' @source Fatality Analysis Reporting System (FARS): 2004-2017 Final File and 2018 Annual Report File (ARF)
'vehicles'


#' Counts of Fatal Automobile Accidents in the United States, 2004-2018 by Age of victim and time of day of accident
#'
#' A tibble containing selected age- and time-level characteristics of automobile crashes that resulted in at least one fatality, 2004-2018
#'
#' @format A tibble with 1875 rows and 4 columns
#'
#' \describe{
#' \item{\code{age}}{Age group of victim}
#' \item{\code{time}}{Time of day (hour)}
#' \item{\code{year}}{Year}
#' \item{\code{n}}{Count}
#'}
#'
#' @docType data
#' @keywords datasets
#' @name agetimes
#' @source Fatality Analysis Reporting System (FARS): 2004-2017 Final File and 2018 Annual Report File (ARF)
'agetimes'
