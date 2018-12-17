#' Get rank quantiles for a whole distribution
#'
#' Get the probability of the empirical value at all ranks in a
#' distribution relative to the distribution of values for each rank
#' for sims drawn from the METE prediction
#'
#' @param sim_dists from `generate_sims`
#' @return Vector of quantiles of observed vs. sim distribution
#'
#' @export

get_rank_quantile <- function(sim_dists) {
  empirical_ranked <- sim_dists$empirical
  sims_ranked <- sim_dists$sims
  nranks <- as.numeric(length(empirical_ranked))
  nsims <- as.numeric(length(sims_ranked))
  sims_ranked <- matrix(data = as.vector(unlist(sims_ranked)),
                        nrow = nsims,
                        ncol = nranks,
                        byrow = T)
  all_ranked <- rbind(empirical_ranked, sims_ranked)
  rank_quantiles <- apply(all_ranked,
                          MARGIN = 2,
                          FUN = get_quantile,
                          empirical_row = 1)
  return(rank_quantiles)
}

#' Get rank quantile for a single rank in a distribution
#'
#' Get the probability of the empirical value compared to a
#' vector of sim values.
#'
#'
#' @param all_values vector of all values, including the empirical value
#' @param empirical_row index of the empirical value
#' @return probability of empirical value given ecdf of sim values
#'
#' @export
#'

get_quantile <- function(all_values, empirical_row){
  empirical_value <- all_values[empirical_row]
  sim_values <- all_values[-empirical_row]
  sim_ecdf <- ecdf(sim_values)
  emp_quant <- sim_ecdf(empirical_value)
  return(emp_quant)
}
