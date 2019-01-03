#' Get probabilities of empirical coming from mete for a whole community.
#'
#' Currently uses loglikelihood and assumes the loglikelihoods of sim distributions|METE are normally distributed.
#'
#' @param community_data_frame dataframe of species, abundance, power for all individuals
#' @param sim_storage_path storage path for stashing sims
#' @return list of p of SAD, p of IPD coming from METE predictions based on community data
#'
#' @export

get_community_prob <- function(community_data_frame, sim_storage_path) {
  this_esf <- make_mete_ESF(community_data_frame)

  dists_oneyr <- make_mete_distributions(this_esf)

  # Generate and save SAD sims
  if(!file.exists(paste0(sim_storage_path, '/sad_sims.Rds'))) {
  generate_sims(dists_oneyr[[1]],
                nsims = 1000, # use more
                store_path = paste0(sim_storage_path, '/sad_sims.Rds'))
}
  load(paste0(sim_storage_path, '/sad_sims.Rds'))
  sad_sims_oneyr <- simDists
  rm(simDists)

 sad_ll_emp <- get_logLik(sad_sims_oneyr$empirical, dists_oneyr[[1]])
  sad_ll_sim <- vapply(sad_sims_oneyr$sims, FUN = get_logLik,
                   FUN.VALUE = sad_ll_emp, meteR_dist = dists_oneyr[[1]])

 # sad_ll_quantile <- get_quantile(c(ll_emp, ll_sim), 1)
# theoretical p of empirical compared to sims
  sad_theoretical_p <- get_theoretical_quantile(c(sad_ll_emp, sad_ll_sim), 1, 'norm')

  # Generate and save IPD sims
  if(!file.exists(paste0(sim_storage_path, '/ipd_sims.Rds'))) {
  generate_sims(dists_oneyr[[2]],
                nsims = 1000, # use more
                store_path = paste0(sim_storage_path, '/ipd_sims.Rds'))
  }

  load(paste0(sim_storage_path, '/ipd_sims.Rds'))
  ipd_sims_oneyr <- simDists
  rm(simDists)

  ipd_ll_emp <- get_logLik(ipd_sims_oneyr$empirical, dists_oneyr[[2]])
  ipd_ll_sim <- vapply(ipd_sims_oneyr$sims, FUN = get_logLik,
                       FUN.VALUE = ipd_ll_emp, meteR_dist = dists_oneyr[[2]])

  # theoretical p of empirical compared to sims
  ipd_theoretical_p <- get_theoretical_quantile(c(ipd_ll_emp, ipd_ll_sim), 1, 'norm')

  ps <- list(sad_theoretical_p, ipd_theoretical_p)

  return(ps)
}
