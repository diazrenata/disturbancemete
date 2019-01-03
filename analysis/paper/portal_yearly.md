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
```

Get ps
------

``` r
get_probs <- function(year, list_of_communities) {
  
thisone <- list_of_communities[[year]]
thispath <- paste0('./sim_storage/', year)
dir.create(thispath)
probs <- get_community_prob(thisone, thispath)

return(probs)
}

all_probs <- lapply(X = names(portal_yearly_communities), FUN = get_probs,
                    list_of_communities = portal_yearly_communities)
```

    ## Warning in dir.create(thispath): './sim_storage/1977' already exists

    ## Warning in dir.create(thispath): './sim_storage/1978' already exists

    ## Warning in dir.create(thispath): './sim_storage/1979' already exists

    ## Warning in dir.create(thispath): './sim_storage/1980' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(thispath): './sim_storage/1981' already exists

    ## Warning in dir.create(thispath): './sim_storage/1982' already exists

    ## Warning in dir.create(thispath): './sim_storage/1983' already exists

    ## Warning in dir.create(thispath): './sim_storage/1984' already exists

    ## Warning in dir.create(thispath): './sim_storage/1985' already exists

    ## Warning in dir.create(thispath): './sim_storage/1986' already exists

    ## Warning in dir.create(thispath): './sim_storage/1987' already exists

    ## Warning in dir.create(thispath): './sim_storage/1988' already exists

    ## Warning in dir.create(thispath): './sim_storage/1989' already exists

    ## Warning in dir.create(thispath): './sim_storage/1990' already exists

    ## Warning in dir.create(thispath): './sim_storage/1991' already exists

    ## Warning in dir.create(thispath): './sim_storage/1992' already exists

    ## Warning in dir.create(thispath): './sim_storage/1993' already exists

    ## Warning in dir.create(thispath): './sim_storage/1994' already exists

    ## Warning in dir.create(thispath): './sim_storage/1995' already exists

    ## Warning in dir.create(thispath): './sim_storage/1996' already exists

    ## Warning in dir.create(thispath): './sim_storage/1997' already exists

    ## Warning in dir.create(thispath): './sim_storage/1998' already exists

    ## Warning in dir.create(thispath): './sim_storage/1999' already exists

    ## Warning in dir.create(thispath): './sim_storage/2000' already exists

    ## Warning in dir.create(thispath): './sim_storage/2001' already exists

    ## Warning in dir.create(thispath): './sim_storage/2002' already exists

    ## Warning in dir.create(thispath): './sim_storage/2003' already exists

    ## Warning in dir.create(thispath): './sim_storage/2004' already exists

    ## Warning in dir.create(thispath): './sim_storage/2005' already exists

    ## Warning in dir.create(thispath): './sim_storage/2006' already exists

    ## Warning in dir.create(thispath): './sim_storage/2007' already exists

    ## Warning in dir.create(thispath): './sim_storage/2008' already exists

    ## Warning in dir.create(thispath): './sim_storage/2009' already exists

    ## Warning in dir.create(thispath): './sim_storage/2010' already exists

    ## Warning in dir.create(thispath): './sim_storage/2011' already exists

    ## Warning in dir.create(thispath): './sim_storage/2012' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(thispath): './sim_storage/2013' already exists

    ## Warning in dir.create(thispath): './sim_storage/2014' already exists

    ## Warning in dir.create(thispath): './sim_storage/2015' already exists

    ## Warning in dir.create(thispath): './sim_storage/2016' already exists

    ## Warning in dir.create(thispath): './sim_storage/2017' already exists

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

    ##    year       sad_p         ipd_p
    ## 1  1977 0.524107042  2.916107e-40
    ## 2  1978 0.300096708 3.339980e-121
    ## 3  1979 0.098869266  8.379790e-74
    ## 4  1980 0.033062200            NA
    ## 5  1981 0.029359591 2.884540e-123
    ## 6  1982 0.014309819 2.446359e-202
    ## 7  1983 0.006149640 3.018473e-216
    ## 8  1984 0.078709023 1.801808e-101
    ## 9  1985 0.076634650 5.011983e-192
    ## 10 1986 0.169030765 2.194674e-136
    ## 11 1987 0.010809390 8.467157e-242
    ## 12 1988 0.071861470 1.811761e-168
    ## 13 1989 0.063298261 7.442132e-167
    ## 14 1990 0.035134731 5.552414e-171
    ## 15 1991 0.063635030 1.529053e-161
    ## 16 1992 0.082617277 9.839360e-117
    ## 17 1993 0.013950388  2.882839e-75
    ## 18 1994 0.098875008  4.945257e-76
    ## 19 1995 0.208754677 1.569505e-173
    ## 20 1996 0.013176777 3.347748e-257
    ## 21 1997 0.037484516  0.000000e+00
    ## 22 1998 0.053331227 2.560888e-294
    ## 23 1999 0.042353602 3.962943e-211
    ## 24 2000 0.350012675 4.118827e-258
    ## 25 2001 0.147206899 1.257901e-278
    ## 26 2002 0.216757355  0.000000e+00
    ## 27 2003 0.230074606  0.000000e+00
    ## 28 2004 0.315357375 2.545676e-253
    ## 29 2005 0.211992775  0.000000e+00
    ## 30 2006 0.461626754  0.000000e+00
    ## 31 2007 0.025964375  0.000000e+00
    ## 32 2008 0.004036132  0.000000e+00
    ## 33 2009 0.248839825 2.599556e-216
    ## 34 2010 0.356817632  6.939549e-51
    ## 35 2011 0.415569421 1.026900e-208
    ## 36 2012 0.187356325            NA
    ## 37 2013 0.364636453 3.690538e-257
    ## 38 2014 0.354573135  0.000000e+00
    ## 39 2015 0.008816220  0.000000e+00
    ## 40 2016 0.181900818 1.534791e-276
    ## 41 2017 0.340393167  0.000000e+00
