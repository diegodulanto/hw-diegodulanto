HW1: Exploring penguins
================
Diego A. Dulanto
1/26/2021

## R Markdown

``` r
mean(penguins$bill_length_mm, na.rm = TRUE)
```

    ## [1] 43.92193

``` r
mean(penguins$flipper_length_mm, na.rm = TRUE, trim = 0.25)
```

    ## [1] 199.2558

``` r
range(penguins$body_mass_g, na.rm = TRUE)
```

    ## [1] 2700 6300

The average penguin bill length for penguins is **43.92193**, not
including unavailable data.

The average penguin flipper length is **199.2558**, not including
unavailable data, and *trimming 25% of the data*.

Penguin body mass ranges from **2700 to 6300**, not including
unavailable data.
