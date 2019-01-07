library(disturbancemete)

# Load data
portal_granivores <- load_rodent_data() # defaults to controls & power

thisyear <- unique(portal_granivores$year)[9]

one_year <- extract_portal_year(portal_granivores, chosen_year = 1980)


# Using wrapper function
probs_test <- list()
for(i in 1:10) {
  probs_test[[i]] <- get_community_prob(one_year, paste0('sim_storage/', i, '_10'), 10)
}
probs_test_df_10it <- as.data.frame(1:10)
colnames(probs_test_df_10it) <- 'i'
get_distp_from_list <- function(i, list_of_ps, dist_index) {
  return(as.numeric(list_of_ps[[i]][dist_index]))
}

probs_test_df_10it$sad_p <- vapply(probs_test_df_10it$i, FUN = get_distp_from_list,
                                   list_of_ps = probs_test, dist_index = 1, FUN.VALUE = as.numeric(probs_test[[1]][1]))

probs_test_df_10it$ipd_p <- vapply(probs_test_df_10it$i, FUN = get_distp_from_list,
                                   list_of_ps = probs_test, dist_index = 2, FUN.VALUE = as.numeric(probs_test[[1]][1]))

probs_test_df_10it

# Now try it with stepping thru
probs_stepthru <- list()

for(i in 1:10){
  thispath = paste0('sim_storage/', i, '_10')
  load(paste0(thispath, '/sad_sims.Rds'))
  sad_sims_oneyr <- simDists
  rm(simDists)

  sad_ll_emp <- get_logLik(sad_sims_oneyr$empirical, dists_oneyr[[1]])
  sad_ll_sim <- vapply(sad_sims_oneyr$sims, FUN = get_logLik,
                       FUN.VALUE = sad_ll_emp, meteR_dist = dists_oneyr[[1]])
 sad_p <- get_theoretical_quantile(c(sad_ll_emp, sad_ll_sim), 1, 'norm')

  load(paste0(thispath, '/ipd_sims.Rds'))
  ipd_sims_oneyr <- simDists
  rm(simDists)

  ipd_ll_emp <- get_logLik(ipd_sims_oneyr$empirical, dists_oneyr[[2]])
  ipd_ll_sim <- vapply(ipd_sims_oneyr$sims, FUN = get_logLik,
                       FUN.VALUE = ipd_ll_emp, meteR_dist = dists_oneyr[[2]])
  ipd_p <- get_theoretical_quantile(c(ipd_ll_emp, ipd_ll_sim), 1, 'norm')

  ps <- list(sad_p, ipd_p)
  probs_stepthru[[i]] <- ps
}

probs_stepthru_df <- as.data.frame(1:10)
colnames(probs_stepthru_df) <- 'i'
get_distp_from_list <- function(i, list_of_ps, dist_index) {
  return(as.numeric(list_of_ps[[i]][dist_index]))
}

probs_stepthru_df$sad_p <- vapply(probs_stepthru_df$i, FUN = get_distp_from_list,
                                   list_of_ps = probs_stepthru, dist_index = 1, FUN.VALUE = as.numeric(probs_test[[1]][1]))

probs_stepthru_df$ipd_p <- vapply(probs_stepthru_df$i, FUN = get_distp_from_list,
                                   list_of_ps = probs_stepthru, dist_index = 2, FUN.VALUE = as.numeric(probs_test[[1]][1]))

probs_stepthru_df == probs_test_df_10it

# ok so these match.
# I bet it gave different answers because of the iterations problem.


esf_oneyr <- make_mete_ESF(one_year)

dists_oneyr <- make_mete_distributions(esf_oneyr)

generate_sims(dists_oneyr[[1]],
              nsims = 1000, # use more
              store_path = 'sim_storage/ipd_sims.Rds')

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


