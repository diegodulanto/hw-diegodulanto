Data Documentation
================
Diego A. Dulanto
3/9/2021

| Variable                                    | Type    | Value           |
|---------------------------------------------|---------|-----------------|
| Month of Admission                          | Numeric | 1-12            |
| Year of Admission                           | Numeric | 1999-2000       |
| Country of Birth                            | Numeric | 1-230           |
| Age                                         | Numeric | 0-99            |
| Country of Last Permanent Residence         | String  | Ex. Peru        |
| Marital Status                              | Numeric | 1-9             |
| State of Intended Residence                 | Numeric | 1-99            |
| Metropolitan Area of Intended Residence     | Numeric | 1-999           |
| Labor Certification                         | Numeric | 1, 3, 9         |
| Occupation                                  | Numeric | 10-999          |
| Sex                                         | Numeric | 1, 2, 9         |
| Country of Chargeability                    | String  | Ex. Peru        |
| Type of Case                                | Numeric | 1, 3            |
| Nonimmigrant Class of Entry                 | Numeric | 1-99            |
| Nonimmigrant Year of Entry                  | Numeric | 1930-2000, 9999 |
| Immigrant Class of Admission                | Numeric | 1-29            |
| Principal vs. Derivative Class of Admission | Numeric | 1, 2            |

*Missing data will be displayed as NA*

``` r
library(haven)
```

    ## Warning: package 'haven' was built under R version 4.0.4

``` r
library(tidyverse)
```

    ## -- Attaching packages --------------------------------------- tidyverse 1.3.0 --

    ## v ggplot2 3.3.3     v purrr   0.3.4
    ## v tibble  3.0.6     v dplyr   1.0.4
    ## v tidyr   1.1.2     v stringr 1.4.0
    ## v readr   1.4.0     v forcats 0.5.1

    ## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(ggplot2)
library(readr)
library(tibble)
```

``` r
here::here("data", "immigrant_data_2000.sav")
```

    ## [1] "C:/Users/Diego Dulanto/OneDrive/Documents/GitHub/hw-diegodulanto/hw04_final_project/data/immigrant_data_2000.sav"

``` r
(immigrant_data <- haven::read_sav(
  here::here("data", "immigrant_data_2000.sav")
)
)
```

    ## # A tibble: 849,386 x 17
    ##       V1    V2        V3    V4 V5         V6       V7        V8      V9
    ##    <dbl> <dbl> <dbl+lbl> <dbl> <chr> <dbl+l> <dbl+lb> <dbl+lbl> <dbl+l>
    ##  1     7  2000 190 [Cub~    26 Unkn~ 2 [Mar~ 15 [Flo~ 189 [Mia~ 3 [Not~
    ##  2     4  2000 179 [Mex~    75 Mexi~ 2 [Mar~  9 [Cal~ 188 [Mer~ 3 [Not~
    ##  3    12  1999 179 [Mex~    75 Mexi~ 4 [Div~  9 [Cal~ 174 [Los~ 3 [Not~
    ##  4     7  2000 179 [Mex~    75 Mexi~ 3 [Wid~ 55 [Tex~ 260 [San~ 3 [Not~
    ##  5     5  2000 179 [Mex~    75 Mexi~ 3 [Wid~  9 [Cal~ 263 [San~ 3 [Not~
    ##  6     7  2000  62 [Chi~    15 Chin~ 1 [Sin~  9 [Cal~ 174 [Los~ 3 [Not~
    ##  7     4  2000  83 [Phi~    31 Phil~ 2 [Mar~  9 [Cal~ 266 [San~ 3 [Not~
    ##  8     8  2000 179 [Mex~    70 Mexi~ 2 [Mar~ 55 [Tex~  91 [El ~ 3 [Not~
    ##  9     3  2000  52 [Uni~    75 Unit~ 2 [Mar~ 31 [Mic~ 212 [Non~ 1 [Iss~
    ## 10    11  1999 218 [Col~    71 Colo~ 3 [Wid~ 15 [Flo~ 189 [Mia~ 3 [Not~
    ## # ... with 849,376 more rows, and 8 more variables: V10 <dbl+lbl>,
    ## #   V11 <dbl+lbl>, V12 <chr>, V13 <dbl+lbl>, V14 <dbl+lbl>, V15 <dbl>,
    ## #   V16 <dbl+lbl>, V17 <dbl+lbl>

``` r
##Renaming columns

colnames(immigrant_data)[colnames(immigrant_data) == "V1"] <- "Month of Admission"
colnames(immigrant_data)[colnames(immigrant_data) == "V2"] <- "Year of Admission"
colnames(immigrant_data)[colnames(immigrant_data) == "V3"] <- "Country of Birth"
colnames(immigrant_data)[colnames(immigrant_data) == "V4"] <- "Age"
colnames(immigrant_data)[colnames(immigrant_data) == "V5"] <- "Country of Last Permanent Residence"
colnames(immigrant_data)[colnames(immigrant_data) == "V6"] <- "Marital Status"
colnames(immigrant_data)[colnames(immigrant_data) == "V7"] <- "State of Intended Residence"
colnames(immigrant_data)[colnames(immigrant_data) == "V8"] <- "Metropolitan Area of Intended Residence"
colnames(immigrant_data)[colnames(immigrant_data) == "V9"] <- "Labor Certification"
colnames(immigrant_data)[colnames(immigrant_data) == "V10"] <- "Occupation"
colnames(immigrant_data)[colnames(immigrant_data) == "V11"] <- "Sex"
colnames(immigrant_data)[colnames(immigrant_data) == "V12"] <- "Country of Chargeability"
colnames(immigrant_data)[colnames(immigrant_data) == "V13"] <- "Type of Case"
colnames(immigrant_data)[colnames(immigrant_data) == "V14"] <- "Nonimmigrant class of entry"
colnames(immigrant_data)[colnames(immigrant_data) == "V15"] <- "Nonimmigrant year of entry"
colnames(immigrant_data)[colnames(immigrant_data) == "V16"] <- "Immigrant class of admission"
colnames(immigrant_data)[colnames(immigrant_data) == "V17"] <- "Principal vs. Derivative Class of Admission"


print(immigrant_data)
```

    ## # A tibble: 849,386 x 17
    ##    `Month of Admis~ `Year of Admiss~ `Country of Bir~   Age `Country of Las~
    ##               <dbl>            <dbl>        <dbl+lbl> <dbl> <chr>           
    ##  1                7             2000 190 [Cuba]          26 Unknown         
    ##  2                4             2000 179 [Mexico]        75 Mexico          
    ##  3               12             1999 179 [Mexico]        75 Mexico          
    ##  4                7             2000 179 [Mexico]        75 Mexico          
    ##  5                5             2000 179 [Mexico]        75 Mexico          
    ##  6                7             2000  62 [China Peop~    15 China People Re~
    ##  7                4             2000  83 [Philippine~    31 Philippines     
    ##  8                8             2000 179 [Mexico]        70 Mexico          
    ##  9                3             2000  52 [United Kin~    75 United Kingdom  
    ## 10               11             1999 218 [Colombia]      71 Colombia        
    ## # ... with 849,376 more rows, and 12 more variables: `Marital
    ## #   Status` <dbl+lbl>, `State of Intended Residence` <dbl+lbl>, `Metropolitan
    ## #   Area of Intended Residence` <dbl+lbl>, `Labor Certification` <dbl+lbl>,
    ## #   Occupation <dbl+lbl>, Sex <dbl+lbl>, `Country of Chargeability` <chr>,
    ## #   `Type of Case` <dbl+lbl>, `Nonimmigrant class of entry` <dbl+lbl>,
    ## #   `Nonimmigrant year of entry` <dbl>, `Immigrant class of
    ## #   admission` <dbl+lbl>, `Principal vs. Derivative Class of
    ## #   Admission` <dbl+lbl>
