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

![](portal_yearly_files/figure-markdown_github/community%20ps-1.png)

    ## $breaks
    ##  [1] -38 -37 -36 -35 -34 -33 -32 -31 -30 -29 -28 -27 -26 -25 -24 -23 -22
    ## [18] -21 -20 -19 -18
    ## 
    ## $counts
    ##  [1]    6   37  137  344  580  893 1202 1363 1312 1226 1037  703  511  325
    ## [15]  173   83   42   14    9    3
    ## 
    ## $density
    ##  [1] 0.0006 0.0037 0.0137 0.0344 0.0580 0.0893 0.1202 0.1363 0.1312 0.1226
    ## [11] 0.1037 0.0703 0.0511 0.0325 0.0173 0.0083 0.0042 0.0014 0.0009 0.0003
    ## 
    ## $mids
    ##  [1] -37.5 -36.5 -35.5 -34.5 -33.5 -32.5 -31.5 -30.5 -29.5 -28.5 -27.5
    ## [12] -26.5 -25.5 -24.5 -23.5 -22.5 -21.5 -20.5 -19.5 -18.5
    ## 
    ## $xname
    ## [1] "sad_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-2.png)

    ## $breaks
    ##  [1] -630 -620 -610 -600 -590 -580 -570 -560 -550 -540 -530 -520 -510 -500
    ## [15] -490 -480 -470 -460 -450
    ## 
    ## $counts
    ##  [1]    1    7   32  100  287  655 1207 1551 1758 1701 1228  833  360  181
    ## [15]   64   28    6    1
    ## 
    ## $density
    ##  [1] 0.00001 0.00007 0.00032 0.00100 0.00287 0.00655 0.01207 0.01551
    ##  [9] 0.01758 0.01701 0.01228 0.00833 0.00360 0.00181 0.00064 0.00028
    ## [17] 0.00006 0.00001
    ## 
    ## $mids
    ##  [1] -625 -615 -605 -595 -585 -575 -565 -555 -545 -535 -525 -515 -505 -495
    ## [15] -485 -475 -465 -455
    ## 
    ## $xname
    ## [1] "ipd_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-3.png)

    ## $breaks
    ##  [1] -52 -50 -48 -46 -44 -42 -40 -38 -36 -34 -32 -30 -28 -26 -24 -22
    ## 
    ## $counts
    ##  [1]    1   56  256  738 1384 1908 2023 1599 1066  590  265   87   21    5
    ## [15]    1
    ## 
    ## $density
    ##  [1] 0.00005 0.00280 0.01280 0.03690 0.06920 0.09540 0.10115 0.07995
    ##  [9] 0.05330 0.02950 0.01325 0.00435 0.00105 0.00025 0.00005
    ## 
    ## $mids
    ##  [1] -51 -49 -47 -45 -43 -41 -39 -37 -35 -33 -31 -29 -27 -25 -23
    ## 
    ## $xname
    ## [1] "sad_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-4.png)

    ## $breaks
    ##  [1] -1540 -1520 -1500 -1480 -1460 -1440 -1420 -1400 -1380 -1360 -1340
    ## [12] -1320 -1300 -1280 -1260 -1240 -1220 -1200 -1180
    ## 
    ## $counts
    ##  [1]    1    4   12   70  204  551 1016 1562 1904 1796 1384  848  398  177
    ## [15]   55   15    0    3
    ## 
    ## $density
    ##  [1] 0.000005 0.000020 0.000060 0.000350 0.001020 0.002755 0.005080
    ##  [8] 0.007810 0.009520 0.008980 0.006920 0.004240 0.001990 0.000885
    ## [15] 0.000275 0.000075 0.000000 0.000015
    ## 
    ## $mids
    ##  [1] -1530 -1510 -1490 -1470 -1450 -1430 -1410 -1390 -1370 -1350 -1330
    ## [12] -1310 -1290 -1270 -1250 -1230 -1210 -1190
    ## 
    ## $xname
    ## [1] "ipd_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-5.png)

    ## $breaks
    ##  [1] -48 -46 -44 -42 -40 -38 -36 -34 -32 -30 -28 -26 -24 -22
    ## 
    ## $counts
    ##  [1]    5   92  446 1128 1910 2267 1902 1240  655  267   75   12    1
    ## 
    ## $density
    ##  [1] 0.00025 0.00460 0.02230 0.05640 0.09550 0.11335 0.09510 0.06200
    ##  [9] 0.03275 0.01335 0.00375 0.00060 0.00005
    ## 
    ## $mids
    ##  [1] -47 -45 -43 -41 -39 -37 -35 -33 -31 -29 -27 -25 -23
    ## 
    ## $xname
    ## [1] "sad_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-6.png)

    ## $breaks
    ##  [1] -1040 -1020 -1000  -980  -960  -940  -920  -900  -880  -860  -840
    ## [12]  -820  -800  -780
    ## 
    ## $counts
    ##  [1]    2   29  122  546 1319 2164 2375 1908 1038  365  112   19    1
    ## 
    ## $density
    ##  [1] 0.000010 0.000145 0.000610 0.002730 0.006595 0.010820 0.011875
    ##  [8] 0.009540 0.005190 0.001825 0.000560 0.000095 0.000005
    ## 
    ## $mids
    ##  [1] -1030 -1010  -990  -970  -950  -930  -910  -890  -870  -850  -830
    ## [12]  -810  -790
    ## 
    ## $xname
    ## [1] "ipd_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

    ## $breaks
    ##  [1] -46 -44 -42 -40 -38 -36 -34 -32 -30 -28 -26 -24 -22 -20
    ## 
    ## $counts
    ##  [1]   16  184  649 1334 1938 2144 1732 1101  580  231   71   17    3
    ## 
    ## $density
    ##  [1] 0.00080 0.00920 0.03245 0.06670 0.09690 0.10720 0.08660 0.05505
    ##  [9] 0.02900 0.01155 0.00355 0.00085 0.00015
    ## 
    ## $mids
    ##  [1] -45 -43 -41 -39 -37 -35 -33 -31 -29 -27 -25 -23 -21
    ## 
    ## $xname
    ## [1] "sad_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

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

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

    ## Warning in log(out): NaNs produced

![](portal_yearly_files/figure-markdown_github/community%20ps-7.png)![](portal_yearly_files/figure-markdown_github/community%20ps-8.png)

    ## $breaks
    ##  [1] -1580 -1560 -1540 -1520 -1500 -1480 -1460 -1440 -1420 -1400 -1380
    ## [12] -1360 -1340 -1320 -1300 -1280 -1260
    ## 
    ## $counts
    ##  [1]    4   16   77  234  608 1122 1632 1923 1824 1323  743  336  106   42
    ## [15]    8    2
    ## 
    ## $density
    ##  [1] 0.000020 0.000080 0.000385 0.001170 0.003040 0.005610 0.008160
    ##  [8] 0.009615 0.009120 0.006615 0.003715 0.001680 0.000530 0.000210
    ## [15] 0.000040 0.000010
    ## 
    ## $mids
    ##  [1] -1570 -1550 -1530 -1510 -1490 -1470 -1450 -1430 -1410 -1390 -1370
    ## [12] -1350 -1330 -1310 -1290 -1270
    ## 
    ## $xname
    ## [1] "ipd_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-9.png)

    ## $breaks
    ##  [1] -52 -50 -48 -46 -44 -42 -40 -38 -36 -34 -32 -30 -28 -26 -24 -22
    ## 
    ## $counts
    ##  [1]   10  122  383  936 1527 1926 1873 1474  952  520  187   64   19    5
    ## [15]    2
    ## 
    ## $density
    ##  [1] 0.00050 0.00610 0.01915 0.04680 0.07635 0.09630 0.09365 0.07370
    ##  [9] 0.04760 0.02600 0.00935 0.00320 0.00095 0.00025 0.00010
    ## 
    ## $mids
    ##  [1] -51 -49 -47 -45 -43 -41 -39 -37 -35 -33 -31 -29 -27 -25 -23
    ## 
    ## $xname
    ## [1] "sad_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-10.png)

    ## $breaks
    ##  [1] -1740 -1720 -1700 -1680 -1660 -1640 -1620 -1600 -1580 -1560 -1540
    ## [12] -1520 -1500 -1480 -1460 -1440 -1420 -1400 -1380 -1360
    ## 
    ## $counts
    ##  [1]    1    2   13   66  196  447  854 1393 1681 1770 1586 1025  574  253
    ## [15]  100   33    3    1    2
    ## 
    ## $density
    ##  [1] 0.000005 0.000010 0.000065 0.000330 0.000980 0.002235 0.004270
    ##  [8] 0.006965 0.008405 0.008850 0.007930 0.005125 0.002870 0.001265
    ## [15] 0.000500 0.000165 0.000015 0.000005 0.000010
    ## 
    ## $mids
    ##  [1] -1730 -1710 -1690 -1670 -1650 -1630 -1610 -1590 -1570 -1550 -1530
    ## [12] -1510 -1490 -1470 -1450 -1430 -1410 -1390 -1370
    ## 
    ## $xname
    ## [1] "ipd_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-11.png)

    ## $breaks
    ##  [1] -62 -60 -58 -56 -54 -52 -50 -48 -46 -44 -42 -40 -38 -36 -34 -32 -30
    ## 
    ## $counts
    ##  [1]    7   41  169  480  889 1402 1640 1676 1412 1030  647  331  181   70
    ## [15]   16    9
    ## 
    ## $density
    ##  [1] 0.00035 0.00205 0.00845 0.02400 0.04445 0.07010 0.08200 0.08380
    ##  [9] 0.07060 0.05150 0.03235 0.01655 0.00905 0.00350 0.00080 0.00045
    ## 
    ## $mids
    ##  [1] -61 -59 -57 -55 -53 -51 -49 -47 -45 -43 -41 -39 -37 -35 -33 -31
    ## 
    ## $xname
    ## [1] "sad_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-12.png)

    ## $breaks
    ##  [1] -2700 -2650 -2600 -2550 -2500 -2450 -2400 -2350 -2300 -2250 -2200
    ## [12] -2150
    ## 
    ## $counts
    ##  [1]    1   13  150  805 2202 3235 2465  926  189   13    1
    ## 
    ## $density
    ##  [1] 0.000002 0.000026 0.000300 0.001610 0.004404 0.006470 0.004930
    ##  [8] 0.001852 0.000378 0.000026 0.000002
    ## 
    ## $mids
    ##  [1] -2675 -2625 -2575 -2525 -2475 -2425 -2375 -2325 -2275 -2225 -2175
    ## 
    ## $xname
    ## [1] "ipd_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-13.png)

    ## $breaks
    ##  [1] -58 -56 -54 -52 -50 -48 -46 -44 -42 -40 -38 -36 -34 -32 -30 -28 -26
    ## [18] -24
    ## 
    ## $counts
    ##  [1]    1    9   88  325  744 1269 1675 1754 1589 1175  708  403  175   67
    ## [15]   16    0    2
    ## 
    ## $density
    ##  [1] 0.00005 0.00045 0.00440 0.01625 0.03720 0.06345 0.08375 0.08770
    ##  [9] 0.07945 0.05875 0.03540 0.02015 0.00875 0.00335 0.00080 0.00000
    ## [17] 0.00010
    ## 
    ## $mids
    ##  [1] -57 -55 -53 -51 -49 -47 -45 -43 -41 -39 -37 -35 -33 -31 -29 -27 -25
    ## 
    ## $xname
    ## [1] "sad_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-14.png)

    ## $breaks
    ##  [1] -2750 -2700 -2650 -2600 -2550 -2500 -2450 -2400 -2350 -2300 -2250
    ## 
    ## $counts
    ##  [1]   12  144  908 2501 3327 2225  756  118    8    1
    ## 
    ## $density
    ##  [1] 0.000024 0.000288 0.001816 0.005002 0.006654 0.004450 0.001512
    ##  [8] 0.000236 0.000016 0.000002
    ## 
    ## $mids
    ##  [1] -2725 -2675 -2625 -2575 -2525 -2475 -2425 -2375 -2325 -2275
    ## 
    ## $xname
    ## [1] "ipd_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-15.png)

    ## $breaks
    ##  [1] -54 -52 -50 -48 -46 -44 -42 -40 -38 -36 -34 -32 -30 -28 -26
    ## 
    ## $counts
    ##  [1]    6   72  344  939 1509 2052 1969 1464  869  490  200   66   16    4
    ## 
    ## $density
    ##  [1] 0.00030 0.00360 0.01720 0.04695 0.07545 0.10260 0.09845 0.07320
    ##  [9] 0.04345 0.02450 0.01000 0.00330 0.00080 0.00020
    ## 
    ## $mids
    ##  [1] -53 -51 -49 -47 -45 -43 -41 -39 -37 -35 -33 -31 -29 -27
    ## 
    ## $xname
    ## [1] "sad_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-16.png)

    ## $breaks
    ##  [1] -940 -920 -900 -880 -860 -840 -820 -800 -780 -760 -740 -720 -700 -680
    ## [15] -660
    ## 
    ## $counts
    ##  [1]    6   38  130  448  993 1709 2095 2091 1318  731  332   93   10    6
    ## 
    ## $density
    ##  [1] 0.000030 0.000190 0.000650 0.002240 0.004965 0.008545 0.010475
    ##  [8] 0.010455 0.006590 0.003655 0.001660 0.000465 0.000050 0.000030
    ## 
    ## $mids
    ##  [1] -930 -910 -890 -870 -850 -830 -810 -790 -770 -750 -730 -710 -690 -670
    ## 
    ## $xname
    ## [1] "ipd_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-17.png)

    ## $breaks
    ##  [1] -54 -52 -50 -48 -46 -44 -42 -40 -38 -36 -34 -32 -30 -28 -26
    ## 
    ## $counts
    ##  [1]    6   53  238  637 1252 1759 2018 1644 1217  644  348  128   47    9
    ## 
    ## $density
    ##  [1] 0.00030 0.00265 0.01190 0.03185 0.06260 0.08795 0.10090 0.08220
    ##  [9] 0.06085 0.03220 0.01740 0.00640 0.00235 0.00045
    ## 
    ## $mids
    ##  [1] -53 -51 -49 -47 -45 -43 -41 -39 -37 -35 -33 -31 -29 -27
    ## 
    ## $xname
    ## [1] "sad_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-18.png)

    ## $breaks
    ##  [1] -1920 -1900 -1880 -1860 -1840 -1820 -1800 -1780 -1760 -1740 -1720
    ## [12] -1700 -1680 -1660 -1640 -1620 -1600 -1580 -1560 -1540
    ## 
    ## $counts
    ##  [1]    7   15   58  141  335  621 1096 1423 1668 1526 1379  850  502  220
    ## [15]  117   23   15    3    1
    ## 
    ## $density
    ##  [1] 0.000035 0.000075 0.000290 0.000705 0.001675 0.003105 0.005480
    ##  [8] 0.007115 0.008340 0.007630 0.006895 0.004250 0.002510 0.001100
    ## [15] 0.000585 0.000115 0.000075 0.000015 0.000005
    ## 
    ## $mids
    ##  [1] -1910 -1890 -1870 -1850 -1830 -1810 -1790 -1770 -1750 -1730 -1710
    ## [12] -1690 -1670 -1650 -1630 -1610 -1590 -1570 -1550
    ## 
    ## $xname
    ## [1] "ipd_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-19.png)

    ## $breaks
    ##  [1] -58 -56 -54 -52 -50 -48 -46 -44 -42 -40 -38 -36 -34 -32 -30 -28
    ## 
    ## $counts
    ##  [1]    1   12   88  339  835 1443 1839 1852 1523 1047  587  287  104   34
    ## [15]    9
    ## 
    ## $density
    ##  [1] 0.00005 0.00060 0.00440 0.01695 0.04175 0.07215 0.09195 0.09260
    ##  [9] 0.07615 0.05235 0.02935 0.01435 0.00520 0.00170 0.00045
    ## 
    ## $mids
    ##  [1] -57 -55 -53 -51 -49 -47 -45 -43 -41 -39 -37 -35 -33 -31 -29
    ## 
    ## $xname
    ## [1] "sad_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

![](portal_yearly_files/figure-markdown_github/community%20ps-20.png)

    ## $breaks
    ##  [1] -1220 -1200 -1180 -1160 -1140 -1120 -1100 -1080 -1060 -1040 -1020
    ## [12] -1000  -980  -960  -940  -920  -900  -880
    ## 
    ## $counts
    ##  [1]    4   23   73  203  530 1021 1455 1836 1821 1392  934  457  179   54
    ## [15]   14    3    1
    ## 
    ## $density
    ##  [1] 0.000020 0.000115 0.000365 0.001015 0.002650 0.005105 0.007275
    ##  [8] 0.009180 0.009105 0.006960 0.004670 0.002285 0.000895 0.000270
    ## [15] 0.000070 0.000015 0.000005
    ## 
    ## $mids
    ##  [1] -1210 -1190 -1170 -1150 -1130 -1110 -1090 -1070 -1050 -1030 -1010
    ## [12]  -990  -970  -950  -930  -910  -890
    ## 
    ## $xname
    ## [1] "ipd_ll_sim"
    ## 
    ## $equidist
    ## [1] TRUE
    ## 
    ## attr(,"class")
    ## [1] "histogram"

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

    ##    year      sad_p      ipd_p
    ## 1  1977 -0.6644627  -97.87251
    ## 2  1978 -1.2300029 -284.89669
    ## 3  1979 -2.2483064 -178.11053
    ## 4  1980 -3.5884865 -232.60265
    ## 5  1981 -3.6097797 -294.40594
    ## 6  1982 -4.1746160 -476.24450
    ## 7  1983 -5.0990650 -506.71034
    ## 8  1984 -2.5854276 -230.65933
    ## 9  1985 -2.6090892 -443.25607
    ## 10 1986 -1.7622919 -316.39848
