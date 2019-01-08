Variation in p
================
Renata Diaz
1/7/2019

Motivation
----------

I get different values of p for the same year for different simulations. I want to explore how many sims I needto pull before the ps get reasonably consistent.

Or maybe, these numbers are too small for the p to be really accurate?

### Load data

    ## Loading in data version 1.74.0

    ##   year species abund     power
    ## 1 1977      DM     1  90.50181
    ## 2 1977      DM     1 103.76316
    ## 3 1977      DM     1  71.10674
    ## 4 1977      DM     1 100.50337
    ## 5 1977      DM     1  83.62558
    ## 6 1977      DO     1 110.18305

### Extract a year

``` r
chosen_year = 1994 #arbitrary
 rodent_community <- extract_portal_year(portal_granivores, chosen_year= chosen_year)
```

### Set up sim storage directories

I store the sims outside the repo, because the files can get too big for git to handle.

``` r
if(!dir.exists('/Users/renatadiaz/Desktop/dm-sims/1000_it')) {
dir.create('/Users/renatadiaz/Desktop/dm-sims/1000_it')
}

if(!dir.exists('/Users/renatadiaz/Desktop/dm-sims/100_it')) {
dir.create('/Users/renatadiaz/Desktop/dm-sims/100_it')
}
```

### Pull sims

Function to repeatedly get probabilities

``` r
get_probs <- function(i, community, main_path, ndraws) {
  thispath = paste0(main_path, '/', i)
  dir.create(thispath)
  
probs <- get_community_prob(community, thispath, ndraws)

return(probs)
}
```

Get probabilities from pulling 1000 sims 100 times:

``` r
# 
# its <- 1:100
# 
# print(date())
# 
# ps_1000_draws <- lapply(its, get_probs,
#                         community = rodent_community,
#                         main_path = '/Users/renatadiaz/Desktop/dm-sims/1000_it',
#                         ndraws = 1000)
# 
# save(ps_1000_draws, file = '/Users/renatadiaz/Desktop/dm-sims/1000_it/ps.Rds')
# 
# rm(ps_1000_draws)
# print(date())

load('/Users/renatadiaz/Desktop/dm-sims/1000_it/ps.Rds')

get_distp_from_list <- function(iteration, list_of_ps, dist_index) {
return(as.numeric(list_of_ps[[iteration]][dist_index]))
  }

ps_1000_df <- data.frame(it = 1:100)

ps_1000_df$sad_p <- vapply(ps_1000_df$it, FUN = get_distp_from_list,
                             list_of_ps = ps_1000_draws, dist_index = 1, FUN.VALUE = as.numeric(ps_1000_draws[[1]][1]))


ps_1000_df$ipd_p <- vapply(ps_1000_df$it, FUN = get_distp_from_list,
                             list_of_ps = ps_1000_draws, dist_index = 2, FUN.VALUE = as.numeric(ps_1000_draws[[1]][1]))

write.csv(ps_1000_df, file= '/Users/renatadiaz/Desktop/dm-sims/1000_it/ps_df.csv')
rm(ps_1000_draws)

hist(ps_1000_df$sad_p)
```

![](variation_in_p_files/figure-markdown_github/1000%20draws-1.png)

``` r
mean(ps_1000_df$sad_p)
```

    ## [1] -2.290688

``` r
sd(ps_1000_df$sad_p)
```

    ## [1] 0.07610534

``` r
sd(ps_1000_df$sad_p)/mean(ps_1000_df$sad_p)
```

    ## [1] -0.03322379

``` r
hist(ps_1000_df$ipd_p)
```

![](variation_in_p_files/figure-markdown_github/1000%20draws-2.png)

``` r
mean(ps_1000_df$ipd_p)
```

    ## [1] -171.4677

``` r
sd(ps_1000_df$ipd_p)
```

    ## [1] 6.570772

``` r
sd(ps_1000_df$ipd_p)/mean(ps_1000_df$ipd_p)
```

    ## [1] -0.03832076

Get probabilities from pulling 100 sims 100 times:

``` r
its <- 1:100

print(date())
```

    ## [1] "Mon Jan  7 16:16:05 2019"

``` r
ps_100_draws <- lapply(its, get_probs,
                        community = rodent_community,
                        main_path = '/Users/renatadiaz/Desktop/dm-sims/100_it',
                        ndraws = 100)

save(ps_100_draws, file = '/Users/renatadiaz/Desktop/dm-sims/100_it/ps.Rds')

rm(ps_100_draws)
print(date())
```

    ## [1] "Mon Jan  7 16:45:49 2019"

``` r
load('/Users/renatadiaz/Desktop/dm-sims/100_it/ps.Rds')

get_distp_from_list <- function(iteration, list_of_ps, dist_index) {
return(as.numeric(list_of_ps[[iteration]][dist_index]))
  }

ps_100_df <- data.frame(it = 1:100)

ps_100_df$sad_p <- vapply(ps_100_df$it, FUN = get_distp_from_list,
                             list_of_ps = ps_100_draws, dist_index = 1, FUN.VALUE = as.numeric(ps_100_draws[[1]][1]))


ps_100_df$ipd_p <- vapply(ps_100_df$it, FUN = get_distp_from_list,
                             list_of_ps = ps_100_draws, dist_index = 2, FUN.VALUE = as.numeric(ps_100_draws[[1]][1]))

write.csv(ps_100_df, file= '/Users/renatadiaz/Desktop/dm-sims/100_it/ps_df.csv')
rm(ps_100_draws)

hist(ps_100_df$sad_p)
```

![](variation_in_p_files/figure-markdown_github/100%20draws-1.png)

``` r
mean(ps_100_df$sad_p)
```

    ## [1] -2.292046

``` r
sd(ps_100_df$sad_p)
```

    ## [1] 0.2145753

``` r
sd(ps_100_df$sad_p)/mean(ps_100_df$sad_p)
```

    ## [1] -0.09361736

``` r
hist(ps_100_df$ipd_p)
```

![](variation_in_p_files/figure-markdown_github/100%20draws-2.png)

``` r
mean(ps_100_df$ipd_p)
```

    ## [1] -173.1789

``` r
sd(ps_100_df$ipd_p)
```

    ## [1] 25.02433

``` r
sd(ps_100_df$ipd_p)/mean(ps_100_df$ipd_p)
```

    ## [1] -0.1444999
