<!-- README.md is generated from README.Rmd. Please edit that file -->



# farsdata

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/kjhealy/farsdata.svg?branch=master)](https://travis-ci.org/kjhealy/farsdata)
<!-- badges: end -->

The `farsdata` package contains data from the Fatality Analysis Reporting System (FARS) for fatal automobile crashes in the United States.

## Installation

`farsdata` is a data package containing a dataset of PBE vaccination exemption rates in California Kindergartens in 2014-15. There are two ways to install it.

### Install direct from GitHub

You can install the beta version of farsdata from [GitHub](https://github.com/kjhealy/farsdata) with:

``` r
devtools::install_github("kjhealy/farsdata")
```

### Installation using `drat`

While using `install_github()` works just fine, it would be nicer to be able to just type `install.packages("farsdata")` or `update.packages("farsdata")` in the ordinary way. We can do this using Dirk Eddelbuettel's [drat](http://eddelbuettel.github.io/drat/DratForPackageUsers.html) package. Drat provides a convenient way to make R aware of package repositories other than CRAN.

First, install `drat`:


```r
if (!require("drat")) {
    install.packages("drat")
    library("drat")
}
```

Then use `drat` to tell R about the repository where `farsdata` is hosted:


```r
drat::addRepo("kjhealy")
```

You can now install `farsdata`:


```r
install.packages("farsdata")
```

To ensure that the `farsdata` repository is always available, you can add the following line to your `.Rprofile` or `.Rprofile.site` file:


```r
drat::addRepo("kjhealy")
```

With that in place you'll be able to do `install.packages("farsdata")` or `update.packages("farsdata")` and have everything work as you'd expect. 

Note that the drat repository only contains data packages that are not on CRAN, so you will never be in danger of grabbing the wrong version of any other package.


## Loading the data

The package works best with the [tidyverse](http://tidyverse.org/) libraries and the [simple features](https://r-spatial.github.io/sf/index.html) package for mapping.


```r
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.2.1     ✔ purrr   0.3.3
#> ✔ tibble  2.1.3     ✔ dplyr   0.8.3
#> ✔ tidyr   1.0.0     ✔ stringr 1.4.0
#> ✔ readr   1.3.1     ✔ forcats 0.4.0
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter()  masks stats::filter()
#> ✖ purrr::is_null() masks testthat::is_null()
#> ✖ dplyr::lag()     masks stats::lag()
#> ✖ dplyr::matches() masks tidyr::matches(), testthat::matches()
```

Load the data:


```r
library(farsdata)
```

Look at it:


```r
vehicles
#> # A tibble: 945 x 5
#>    vehicle_type           year involving    yes    no
#>    <chr>                 <int> <chr>      <dbl> <dbl>
#>  1 Passenger Car          2004 distracted  2864 22818
#>  2 Light Truck - Pickup   2004 distracted  1365  9489
#>  3 Light Truck - Utility  2004 distracted   931  6903
#>  4 Light Truck - Van      2004 distracted   460  3227
#>  5 Light Truck - Other    2004 distracted    13    98
#>  6 Large Truck            2004 distracted   808  4094
#>  7 Motorcycle             2004 distracted   420  3701
#>  8 Bus                    2004 distracted    40   239
#>  9 Other/Unknown          2004 distracted    92  1167
#> 10 Passenger Car          2005 distracted  2604 22565
#> # … with 935 more rows
```
