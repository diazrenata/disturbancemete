library(disturbancemete)

portal_granivores <- load_rodent_data() # defaults to controls & power

thisyear <- unique(portal_granivores$year)[9]

one_year <- extract_portal_year(portal_granivores, chosen_year = thisyear)

esf_oneyr <- make_mete_ESF(one_year)

dists_oneyr <- make_mete_distributions(esf_oneyr)

generate_sims(dists_oneyr[[2]],
              nsims = 1000, # use more
              store_path = 'sim_storage/ipd_sims.Rds')

load('sim_storage/ipd_sims.Rds')
ipd_sims_oneyr <- simDists
rm(simDists)

ipd_sims_oneyr$empirical
ipd_sims_oneyr$sims[[1]]

ll_emp <- get_logLik(ipd_sims_oneyr$empirical, dists_oneyr[[2]])
ll_sim <- vapply(ipd_sims_oneyr$sims, FUN = get_logLik,
                 FUN.VALUE = ll_emp, meteR_dist = dists_oneyr[[2]])

ll_quantile <- get_quantile(c(ll_emp, ll_sim), 1) # does not work for IPD - too far off


# theoretical p of empirical compared to sims
theoretical_p <- get_theoretical_quantile(c(ll_emp, ll_sim), 1, 'norm')

# within-distribution - this is about ranks
quantile_ranks <- get_rank_quantile(ipd_sims_oneyr)

# just looking at the ipd
# ipd_df <- cbind(ipd_sims_oneyr$empirical, ipd_sims_oneyr$sims[[1]])
# ipd_df <- as.data.frame(ipd_df)
# colnames(ipd_df) <- c('emp', 'sim')
# ipd_df$rank <- 1:nrow(ipd_df)
#
# plot(ipd_df$rank, ipd_df$emp)
# points(ipd_df$rank, ipd_df$sim)
#
# ipd_quantiles <- as.data.frame(quantile_ranks)
# ipd_quantiles$rank <- 1:nrow(ipd_quantiles)
#
# plot(ipd_quantiles$rank, ipd_quantiles$quantile_ranks)


