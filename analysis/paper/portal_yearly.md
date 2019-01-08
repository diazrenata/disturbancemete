Portal yearly analysis
================
Renata Diaz
1/2/2019

Load data
---------

    ## Loading in data version 1.74.0

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

#portal_yearly_communities <- portal_yearly_communities[1:10]
```

Get ps
------

``` r
for(i in 1:10) {
  

get_probs <- function(year, list_of_communities) {
  dir.create(paste0('./sim_storage_yearly_100draws/', i, '/'))

thisone <- list_of_communities[[year]]
thispath <- paste0('./sim_storage_yearly_100draws/', i, '/', year)
dir.create(thispath)
probs <- get_community_prob(thisone, thispath, 100)

return(probs)
}

all_probs <- lapply(X = names(portal_yearly_communities), FUN = get_probs,
                    list_of_communities = portal_yearly_communities)
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

print(all_probs_df)

write.csv(all_probs_df, paste0('./sim_storage_yearly_100draws/', i, '/probs_df.csv'),  row.names= F)

}
```

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1977'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1978'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1979'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1980'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1981'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1982'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1983'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1984'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1985'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1986'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1987'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1988'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1989'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1990'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1991'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1992'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1993'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1994'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1995'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1996'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1997'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1998'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/1999'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2000'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2001'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2002'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2003'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2004'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2005'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2006'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2007'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2008'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2009'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2010'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2011'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2012'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2013'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2014'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2015'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2016'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/1' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/1/2017'
    ## already exists

    ##    year      sad_p       ipd_p
    ## 1  1977 -0.6923099   -96.58976
    ## 2  1978 -1.1476187  -327.48138
    ## 3  1979 -2.2451269  -204.90902
    ## 4  1980 -3.2541533  -200.18334
    ## 5  1981 -3.5345779  -311.91692
    ## 6  1982 -4.4410168  -552.07976
    ## 7  1983 -5.6679535  -552.64566
    ## 8  1984 -2.3933342  -172.94909
    ## 9  1985 -2.7924988  -462.70964
    ## 10 1986 -1.7278404  -364.11086
    ## 11 1987 -4.1310843  -498.60594
    ## 12 1988 -2.7347723  -492.59393
    ## 13 1989 -2.9653239  -440.42884
    ## 14 1990 -3.7266296  -374.52477
    ## 15 1991 -2.7997319  -399.46792
    ## 16 1992 -2.7764060  -343.90861
    ## 17 1993 -3.8987388  -173.03266
    ## 18 1994 -2.4696484  -151.10548
    ## 19 1995 -1.4177238  -418.23663
    ## 20 1996 -4.2755408  -430.60955
    ## 21 1997 -3.0955813 -1025.82743
    ## 22 1998 -2.7706668  -576.65287
    ## 23 1999 -3.4085558  -504.00502
    ## 24 2000 -1.2392650  -503.51678
    ## 25 2001 -1.7464730  -728.43986
    ## 26 2002 -1.3134787  -923.03483
    ## 27 2003 -1.5024232 -1485.92725
    ## 28 2004 -1.1462557  -595.77050
    ## 29 2005 -1.7873654  -860.21678
    ## 30 2006 -0.8636529  -950.86682
    ## 31 2007 -3.5988566 -2381.23159
    ## 32 2008 -6.0891560 -1545.28994
    ## 33 2009 -1.5615361  -610.99291
    ## 34 2010 -1.1158405  -105.58670
    ## 35 2011 -0.9196071  -478.76001
    ## 36 2012 -1.6960152 -1084.97457
    ## 37 2013 -1.0843737  -639.62858
    ## 38 2014 -1.0567851 -1292.01745
    ## 39 2015 -5.0775227 -1758.18794
    ## 40 2016 -1.5364815  -604.72195
    ## 41 2017 -1.2264343  -800.42876

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/2/1977'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/2/1978'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/2/1979'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/2/1980'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/2/1981'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/2/1982'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(thispath): './sim_storage_yearly_100draws/2/1983'
    ## already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/2' already exists

    ##    year      sad_p      ipd_p
    ## 1  1977 -0.6104565   -72.1156
    ## 2  1978 -1.2591648  -310.7275
    ## 3  1979 -2.3451218  -184.8702
    ## 4  1980 -3.9717533  -218.1007
    ## 5  1981 -3.1699094  -364.2181
    ## 6  1982 -4.3633876  -498.3011
    ## 7  1983 -5.6816642  -422.9469
    ## 8  1984 -2.5739235  -268.4537
    ## 9  1985 -2.5271894  -411.5147
    ## 10 1986 -1.7590509  -268.7226
    ## 11 1987 -4.1030183  -482.4416
    ## 12 1988 -2.3302098  -421.7250
    ## 13 1989 -2.7439156  -493.9370
    ## 14 1990 -3.3552040  -379.2558
    ## 15 1991 -3.1162809  -307.5736
    ## 16 1992 -2.4781350  -287.5969
    ## 17 1993 -3.8476360  -181.8221
    ## 18 1994 -2.2738269  -165.1595
    ## 19 1995 -1.6328440  -365.8070
    ## 20 1996 -4.4805895  -572.8293
    ## 21 1997 -3.0739073  -834.7233
    ## 22 1998 -2.6877230  -694.9328
    ## 23 1999 -3.1195138  -505.9107
    ## 24 2000 -0.9645417  -616.9254
    ## 25 2001 -1.9747697  -619.0581
    ## 26 2002 -1.6263015 -1240.7794
    ## 27 2003 -1.4409723 -1069.9879
    ## 28 2004 -1.1414917  -713.3070
    ## 29 2005 -1.5994769  -649.7757
    ## 30 2006 -0.8289417 -1227.9829
    ## 31 2007 -4.1234121 -2139.4519
    ## 32 2008 -5.7810554 -1399.2603
    ## 33 2009 -1.4748138  -525.8215
    ## 34 2010 -0.8207430  -144.7339
    ## 35 2011 -0.7826499  -496.4880
    ## 36 2012 -1.7243562 -1081.5808
    ## 37 2013 -1.3125502  -519.5632
    ## 38 2014 -1.0961513 -1332.2346
    ## 39 2015 -4.0858582 -1621.5825
    ## 40 2016 -1.5150517  -660.6885
    ## 41 2017 -1.0452998  -801.2630

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/3' already exists

    ##    year      sad_p       ipd_p
    ## 1  1977 -0.6814163   -87.63842
    ## 2  1978 -1.3261925  -350.45953
    ## 3  1979 -2.3057735  -172.37462
    ## 4  1980 -3.9713024  -249.17242
    ## 5  1981 -3.4900378  -276.44972
    ## 6  1982 -4.3372675  -474.31827
    ## 7  1983 -5.4007440  -388.68421
    ## 8  1984 -3.1686912  -228.18601
    ## 9  1985 -2.4866923  -439.14395
    ## 10 1986 -1.6687741  -292.76481
    ## 11 1987 -4.4752014  -525.34617
    ## 12 1988 -2.0902809  -407.17388
    ## 13 1989 -2.7024112  -374.79501
    ## 14 1990 -3.3748246  -364.95829
    ## 15 1991 -3.7127475  -423.32330
    ## 16 1992 -2.9579467  -289.00744
    ## 17 1993 -4.2122048  -211.93933
    ## 18 1994 -2.7417848  -169.29183
    ## 19 1995 -1.8272098  -406.52101
    ## 20 1996 -4.1571282  -550.58134
    ## 21 1997 -3.3639626 -1071.83567
    ## 22 1998 -3.0041559  -792.27868
    ## 23 1999 -3.3064955  -368.99142
    ## 24 2000 -0.9885146  -619.71242
    ## 25 2001 -1.8827932  -635.47719
    ## 26 2002 -1.6742357  -795.98566
    ## 27 2003 -1.4622884 -1171.57098
    ## 28 2004 -0.8889555  -603.42741
    ## 29 2005 -1.6388741  -917.10305
    ## 30 2006 -0.7210578 -1094.99207
    ## 31 2007 -3.7282964 -2458.72528
    ## 32 2008 -4.9545856 -1327.40388
    ## 33 2009 -1.4553474  -528.24012
    ## 34 2010 -1.0029968  -135.56679
    ## 35 2011 -1.0006352  -562.72563
    ## 36 2012 -1.7063257 -1026.87011
    ## 37 2013 -1.0584657  -598.12608
    ## 38 2014 -1.1125093 -1306.04911
    ## 39 2015 -4.7045849 -1273.53777
    ## 40 2016 -1.6553092  -515.93820
    ## 41 2017 -1.1552875  -803.19282

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/4' already exists

    ##    year      sad_p       ipd_p
    ## 1  1977 -0.5735246   -97.45354
    ## 2  1978 -1.2270108  -336.19506
    ## 3  1979 -2.3472411  -165.47813
    ## 4  1980 -3.1844498  -214.25381
    ## 5  1981 -3.1832206  -279.00244
    ## 6  1982 -4.3500817  -673.06095
    ## 7  1983 -7.0795358  -402.53835
    ## 8  1984 -2.3787206  -191.01144
    ## 9  1985 -2.4390556  -368.39796
    ## 10 1986 -1.8790275  -305.24290
    ## 11 1987 -4.5182966  -676.09162
    ## 12 1988 -2.4552182  -388.85329
    ## 13 1989 -2.6888043  -435.30311
    ## 14 1990 -3.5459285  -395.58548
    ## 15 1991 -3.1831412  -375.39677
    ## 16 1992 -2.5017619  -283.68103
    ## 17 1993 -5.1519560  -121.62273
    ## 18 1994 -2.0454581  -221.02319
    ## 19 1995 -1.6578983  -398.52332
    ## 20 1996 -4.4565581  -655.52082
    ## 21 1997 -2.8795706 -1256.00828
    ## 22 1998 -2.7721400  -666.36666
    ## 23 1999 -3.8355435  -559.89300
    ## 24 2000 -0.9994690  -739.54210
    ## 25 2001 -2.0249277  -653.07179
    ## 26 2002 -1.3464100  -901.55672
    ## 27 2003 -1.5657875 -1552.86362
    ## 28 2004 -1.2709229  -740.10698
    ## 29 2005 -1.6167762  -810.89895
    ## 30 2006 -0.6904558 -1053.65989
    ## 31 2007 -3.4745824 -2443.75119
    ## 32 2008 -5.4900517 -1292.82955
    ## 33 2009 -1.4834177  -426.80657
    ## 34 2010 -1.1888598  -126.79917
    ## 35 2011 -0.7879789  -540.77873
    ## 36 2012 -1.5947555 -1050.15503
    ## 37 2013 -1.0247593  -547.38985
    ## 38 2014 -0.9163999 -1333.37316
    ## 39 2015 -3.8576689 -1266.73441
    ## 40 2016 -1.4912859  -663.29531
    ## 41 2017 -1.3072222  -995.45721

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/5' already exists

    ##    year      sad_p      ipd_p
    ## 1  1977 -0.6957887  -113.8979
    ## 2  1978 -1.1984796  -252.6282
    ## 3  1979 -2.0818858  -175.5592
    ## 4  1980 -4.0841307  -248.5236
    ## 5  1981 -3.1262019  -280.0688
    ## 6  1982 -3.8168705  -469.2142
    ## 7  1983 -5.5915496  -582.3096
    ## 8  1984 -2.6874854  -225.4753
    ## 9  1985 -2.2004876  -351.4685
    ## 10 1986 -1.9395190  -344.0103
    ## 11 1987 -4.4426637  -604.4722
    ## 12 1988 -2.2425756  -388.0650
    ## 13 1989 -2.9205408  -516.3928
    ## 14 1990 -2.7454556  -371.7420
    ## 15 1991 -2.9644163  -362.8573
    ## 16 1992 -2.5658054  -294.1389
    ## 17 1993 -3.2171840  -157.9809
    ## 18 1994 -2.2874540  -132.2087
    ## 19 1995 -1.6674434  -329.4671
    ## 20 1996 -4.1951044  -618.6503
    ## 21 1997 -2.9705623 -1096.5913
    ## 22 1998 -2.8534363  -476.5262
    ## 23 1999 -2.9626359  -489.2016
    ## 24 2000 -0.9550971  -552.5305
    ## 25 2001 -1.7759489  -643.0051
    ## 26 2002 -1.6161829  -964.3475
    ## 27 2003 -1.5394159 -1124.8157
    ## 28 2004 -1.2559049  -667.4957
    ## 29 2005 -1.9675828  -735.2609
    ## 30 2006 -0.8860788 -1370.7685
    ## 31 2007 -3.8502394 -2444.3613
    ## 32 2008 -5.5745713 -1114.3993
    ## 33 2009 -1.3059877  -540.4412
    ## 34 2010 -0.9942534  -139.5986
    ## 35 2011 -0.9169472  -365.9411
    ## 36 2012 -1.3587104 -1272.1603
    ## 37 2013 -0.9690387  -571.2495
    ## 38 2014 -1.2128811 -1045.6576
    ## 39 2015 -5.0570295 -1715.1940
    ## 40 2016 -1.7419632  -671.0030
    ## 41 2017 -1.1594521 -1060.1689

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/6' already exists

    ##    year      sad_p       ipd_p
    ## 1  1977 -0.6104620   -95.18528
    ## 2  1978 -1.2316837  -246.35401
    ## 3  1979 -2.5237320  -169.96482
    ## 4  1980 -3.4661021  -272.02936
    ## 5  1981 -3.3199410  -279.23705
    ## 6  1982 -3.6528939  -502.18018
    ## 7  1983 -5.7588419  -398.65652
    ## 8  1984 -2.5281432  -220.30797
    ## 9  1985 -3.2513087  -588.81712
    ## 10 1986 -1.6722933  -312.30144
    ## 11 1987 -5.3646404  -432.74641
    ## 12 1988 -2.7130465  -367.20778
    ## 13 1989 -2.7428609  -351.42380
    ## 14 1990 -3.4798355  -423.24448
    ## 15 1991 -3.5145094  -281.13979
    ## 16 1992 -3.0560069  -242.32932
    ## 17 1993 -3.9481068  -150.85905
    ## 18 1994 -2.0659489  -222.26139
    ## 19 1995 -1.7515731  -403.35107
    ## 20 1996 -4.7428875  -454.41336
    ## 21 1997 -2.8516340  -837.27362
    ## 22 1998 -3.0849999  -665.35843
    ## 23 1999 -3.2741604  -447.48541
    ## 24 2000 -1.1365712  -515.45166
    ## 25 2001 -2.2536790  -677.82137
    ## 26 2002 -1.1833001 -1436.50991
    ## 27 2003 -1.5676925 -1515.64651
    ## 28 2004 -1.0663062  -692.69218
    ## 29 2005 -1.5781266  -942.86727
    ## 30 2006 -0.9539383 -1224.20559
    ## 31 2007 -4.5862415 -1788.95934
    ## 32 2008 -4.9255498 -1306.01642
    ## 33 2009 -1.3564353  -442.52280
    ## 34 2010 -1.0349794  -108.63111
    ## 35 2011 -1.0746545  -353.48869
    ## 36 2012 -1.2516541 -1272.31786
    ## 37 2013 -1.0178844  -568.28223
    ## 38 2014 -1.1141449 -1563.03228
    ## 39 2015 -5.3618408 -1484.13177
    ## 40 2016 -1.7350662  -722.94515
    ## 41 2017 -1.0190287  -915.06623

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/7' already exists

    ##    year      sad_p       ipd_p
    ## 1  1977 -0.8101377   -89.01801
    ## 2  1978 -1.1239761  -260.84869
    ## 3  1979 -2.2198192  -196.30380
    ## 4  1980 -3.3829727  -282.45505
    ## 5  1981 -3.9484248  -339.94112
    ## 6  1982 -4.5344170  -483.41357
    ## 7  1983 -5.9044882  -451.50481
    ## 8  1984 -2.9719375  -232.66572
    ## 9  1985 -2.4328470  -454.99596
    ## 10 1986 -1.4598677  -388.25412
    ## 11 1987 -4.1879774  -454.17676
    ## 12 1988 -2.1130513  -499.57524
    ## 13 1989 -2.5809680  -392.63776
    ## 14 1990 -3.4212385  -372.01972
    ## 15 1991 -2.8408702  -299.86900
    ## 16 1992 -2.5667635  -278.84472
    ## 17 1993 -3.6631161  -157.37355
    ## 18 1994 -2.4065798  -201.90125
    ## 19 1995 -1.6812437  -391.18859
    ## 20 1996 -5.1513101  -637.96774
    ## 21 1997 -3.3578891  -941.03569
    ## 22 1998 -2.8642393  -612.30999
    ## 23 1999 -3.6034917  -486.32329
    ## 24 2000 -1.0300203  -685.65600
    ## 25 2001 -1.7174375  -712.91898
    ## 26 2002 -1.5005104  -981.44619
    ## 27 2003 -1.4926919 -1836.81645
    ## 28 2004 -1.1654915  -538.33879
    ## 29 2005 -1.6540596  -896.08732
    ## 30 2006 -0.7304485 -1688.53816
    ## 31 2007 -3.5080327 -1593.47903
    ## 32 2008 -4.9220281 -1309.70701
    ## 33 2009 -1.4516105  -760.31168
    ## 34 2010 -0.9796109  -110.06212
    ## 35 2011 -0.9137745  -649.41625
    ## 36 2012 -1.5617267  -938.14733
    ## 37 2013 -0.9554646  -454.37632
    ## 38 2014 -1.0767948 -1030.55171
    ## 39 2015 -4.4084698 -1184.49368
    ## 40 2016 -1.8005579  -601.27866
    ## 41 2017 -1.1811565  -775.01816

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/8' already exists

    ##    year      sad_p       ipd_p
    ## 1  1977 -0.6079073   -93.29512
    ## 2  1978 -1.2824386  -251.48909
    ## 3  1979 -1.8492930  -198.80711
    ## 4  1980 -3.8560470  -207.71585
    ## 5  1981 -4.2172831  -397.55403
    ## 6  1982 -3.7207817  -703.73032
    ## 7  1983 -6.3396735  -498.10754
    ## 8  1984 -2.7407613  -248.92623
    ## 9  1985 -2.5673149  -384.09079
    ## 10 1986 -1.9679667  -353.62749
    ## 11 1987 -4.7738779  -419.02385
    ## 12 1988 -2.5171901  -392.53879
    ## 13 1989 -2.7637436  -426.69903
    ## 14 1990 -3.7833272  -394.54415
    ## 15 1991 -2.7102759  -369.21728
    ## 16 1992 -2.6406372  -264.75827
    ## 17 1993 -3.6717765  -176.99218
    ## 18 1994 -2.5975060  -193.62693
    ## 19 1995 -1.4030485  -420.69857
    ## 20 1996 -4.1772297  -507.68137
    ## 21 1997 -3.3617484 -1100.21779
    ## 22 1998 -3.1378023  -833.17819
    ## 23 1999 -3.1079680  -625.25482
    ## 24 2000 -1.0296711  -613.03447
    ## 25 2001 -1.8296640  -592.02985
    ## 26 2002 -1.2067962 -1142.35563
    ## 27 2003 -1.3120139 -1484.52840
    ## 28 2004 -1.2923481  -673.18202
    ## 29 2005 -1.6323210  -893.21764
    ## 30 2006 -0.7032353 -1077.61594
    ## 31 2007 -4.3163546 -3023.51823
    ## 32 2008 -5.8997413 -1242.90280
    ## 33 2009 -1.6632217  -464.56159
    ## 34 2010 -1.1808276  -136.12634
    ## 35 2011 -0.9738110  -347.10208
    ## 36 2012 -1.6138782  -955.08211
    ## 37 2013 -1.1534698  -516.56475
    ## 38 2014 -1.1345255 -1352.57681
    ## 39 2015 -4.8162208 -1997.35169
    ## 40 2016 -1.4921877  -624.71936
    ## 41 2017 -1.0458681  -674.27595

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/9' already exists

    ##    year      sad_p       ipd_p
    ## 1  1977 -0.5693672  -122.16764
    ## 2  1978 -1.1421349  -237.33045
    ## 3  1979 -2.3668253  -182.78193
    ## 4  1980 -3.8257329  -275.23816
    ## 5  1981 -3.2635790  -304.24593
    ## 6  1982 -3.5648194  -510.18048
    ## 7  1983 -5.1508459  -478.66301
    ## 8  1984 -2.5905194  -291.17953
    ## 9  1985 -2.4257622  -521.20835
    ## 10 1986 -1.8591915  -286.70502
    ## 11 1987 -4.6955246  -420.51294
    ## 12 1988 -2.2794727  -468.86024
    ## 13 1989 -2.7590933  -443.78073
    ## 14 1990 -3.0688989  -399.85772
    ## 15 1991 -2.7154230  -390.59888
    ## 16 1992 -2.4531293  -282.26340
    ## 17 1993 -3.8934845  -163.40827
    ## 18 1994 -2.5822236  -156.51805
    ## 19 1995 -1.8202685  -414.51134
    ## 20 1996 -5.0906016  -571.95001
    ## 21 1997 -3.0331928 -1254.33494
    ## 22 1998 -2.6593481  -651.98108
    ## 23 1999 -3.1419569  -392.56813
    ## 24 2000 -1.0716324  -500.26225
    ## 25 2001 -1.8295407  -596.28079
    ## 26 2002 -1.5194456  -964.87410
    ## 27 2003 -1.6985785 -1301.12320
    ## 28 2004 -1.1508937  -567.29867
    ## 29 2005 -1.5676803  -851.36723
    ## 30 2006 -0.8759256 -1126.65934
    ## 31 2007 -3.5580121 -2733.87882
    ## 32 2008 -5.1567227 -1291.18473
    ## 33 2009 -1.6447159  -578.48445
    ## 34 2010 -1.0246313   -92.35559
    ## 35 2011 -0.8315884  -428.22643
    ## 36 2012 -1.6765123 -1056.70430
    ## 37 2013 -1.2501786  -757.93635
    ## 38 2014 -1.0969966 -1357.28219
    ## 39 2015 -4.9014028 -1379.85726
    ## 40 2016 -1.5445792  -741.94907
    ## 41 2017 -1.0970728  -886.61037

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ## Warning in dir.create(paste0("./sim_storage_yearly_100draws/", i, "/")):
    ## './sim_storage_yearly_100draws/10' already exists

    ##    year      sad_p      ipd_p
    ## 1  1977 -0.7481296  -101.6948
    ## 2  1978 -1.1663077  -385.1190
    ## 3  1979 -2.2759388  -158.5868
    ## 4  1980 -3.4536458  -220.2505
    ## 5  1981 -3.0820983  -276.5088
    ## 6  1982 -4.6578970  -483.9433
    ## 7  1983 -4.4312647  -384.2350
    ## 8  1984 -3.0346296  -184.1771
    ## 9  1985 -2.5919771  -492.0098
    ## 10 1986 -1.5560392  -358.2054
    ## 11 1987 -4.6491824  -393.3210
    ## 12 1988 -2.2929612  -425.3796
    ## 13 1989 -2.9315398  -526.4317
    ## 14 1990 -3.1774203  -326.3006
    ## 15 1991 -2.6406589  -316.9600
    ## 16 1992 -2.4581703  -322.6629
    ## 17 1993 -4.0964836  -176.7499
    ## 18 1994 -2.4147035  -165.4892
    ## 19 1995 -1.5271056  -433.0188
    ## 20 1996 -4.1162241  -587.4942
    ## 21 1997 -2.8086501  -934.5340
    ## 22 1998 -2.7257174  -935.4434
    ## 23 1999 -2.7919192  -460.5000
    ## 24 2000 -1.0292540  -519.6931
    ## 25 2001 -1.7260961 -1047.9820
    ## 26 2002 -1.6170729 -1052.7436
    ## 27 2003 -1.3830207 -1404.2089
    ## 28 2004 -0.7848081  -623.7724
    ## 29 2005 -1.8260726  -871.0032
    ## 30 2006 -0.8013640 -1159.7872
    ## 31 2007 -4.5162552 -2447.9027
    ## 32 2008 -6.3548797 -1619.4522
    ## 33 2009 -1.2786189  -530.9369
    ## 34 2010 -0.9659632  -119.2084
    ## 35 2011 -0.7608040  -405.6064
    ## 36 2012 -1.5317854 -1185.5327
    ## 37 2013 -0.9980291  -712.2876
    ## 38 2014 -1.0329737  -906.0506
    ## 39 2015 -5.7046703 -1420.6411
    ## 40 2016 -1.4251876  -651.7889
    ## 41 2017 -1.0550859  -774.2533
