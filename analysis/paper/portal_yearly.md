Portal yearly analysis
================
Renata Diaz
1/2/2019

Load data
---------

    ## Loading in data version 1.66.0

    ##   year species abund     power
    ## 1 1977      DM     1  90.50181
    ## 2 1977      DM     1 103.76316
    ## 3 1977      DM     1  71.10674
    ## 4 1977      DM     1 100.50337
    ## 5 1977      DM     1  83.62558
    ## 6 1977      DO     1 110.18305

Split by year
-------------

``` r
portal_yearly_communities <- list()

for(i in 1:length(unique(portal_granivores$year))) {
  this_year <- unique(portal_granivores$year)[i]
  portal_yearly_communities[[i]] <- extract_portal_year(portal_granivores, chosen_year= this_year)
  names(portal_yearly_communities)[i]<-this_year
}

portal_yearly_communities <- portal_yearly_communities[1:10]
```

Get ps
------

``` r
get_probs <- function(year, list_of_communities) {
  
thisone <- list_of_communities[[year]]
thispath <- paste0('./sim_storage/', year)
dir.create(thispath)
probs <- get_community_prob(thisone, thispath, 10000)

return(probs)
}

all_probs <- lapply(X = names(portal_yearly_communities), FUN = get_probs,
                    list_of_communities = portal_yearly_communities)
```

    ## Warning in dir.create(thispath): './sim_storage/1977' already exists

``` r
names(all_probs) <- names(portal_yearly_communities)
all_probs_df <- as.data.frame(names(portal_yearly_communities))
colnames(all_probs_df) <- 'year'
get_distp_from_list <- function(year, list_of_ps, dist_index) {
return(as.numeric(list_of_ps[[year]][dist_index]))
  }

all_probs_df$sad_p <- vapply(all_probs_df$year, FUN = get_distp_from_list,
                             list_of_ps = all_probs, dist_index = 1, FUN.VALUE = as.numeric(all_probs[[1]][1]))
all_probs_df$ipd_p <- vapply(all_probs_df$year, FUN = get_distp_from_list,
                             list_of_ps = all_probs, dist_index = 2, FUN.VALUE = as.numeric(all_probs[[1]][1]))

all_probs_df
```

    ##    year      sad_p     ipd_p
    ## 1  1977 -0.6610949 -100.6675
    ## 2  1978 -1.2222443 -289.0477
    ## 3  1979 -2.2110706 -179.1414
    ## 4  1980 -3.6178309 -229.4322
    ## 5  1981 -3.6275617 -292.6218
    ## 6  1982 -4.2120687 -470.7148
    ## 7  1983 -5.1330313 -508.5967
    ## 8  1984 -2.5660397 -229.0499
    ## 9  1985 -2.5741376 -434.8022
    ## 10 1986 -1.7693168 -317.4055
