#' Generate simulated METE communities
#'
#' Generate simulations (draws from METE probability distributions) for a community.
#'
#' @param mete_distribution a meteDist object
#' @param nsims how many sims to pull
#' @param return_sims logical: return sims or just evaluate silently?
#' @param store logical: store or not?
#' @param store_path where to store the sims (end in .Rds)
#' @return list of 3: [[1]] is the type (sad, ipd, sipd), [[2]] is empirical vector; [[3]] is a list of nsims simulated vectors
#'
#' @export

generate_sims <- function(mete_distribution, nsims = 10000,
                          return_sims = F, store = T, store_path) {
  simDists <- list()
  simDists$type <- mete_distribution$type
  simDists$empirical <- mete_distribution$data

  statevar_n <- length(mete_distribution$data)
  statevar_sum <- sum(mete_distribution$data)

  simDists$sims <- replicate(nsims, pull_sim(mete_distribution = mete_distribution,
                                             svar_n = statevar_n,
                                             svar_sum = statevar_sum),
                             simplify = FALSE)
  if(store) {
    if(!is.null(store_path)) {
      save(simDists, file = store_path)
    }
  }

  if(return_sims) {
    return(simDists)
  } else {
    return(NULL)
  }
}



#' Sample a mete distribution
#'
#' Draws a vector from a mete probability distribution that conforms to given state variables.
#' Called by generate_sims().
#'
#' @param mete_distribution a meteDist object
#' @param svar_n how long the vector should be
#' @param svar_sum what the vector should sum to
#' @return a vector drawn from mete_distribution, of length svar_n and that sums to svar_sum.
#'
#' @export
pull_sim <- function(mete_distribution, svar_n, svar_sum) {
  close_enough <- F
  while(!close_enough) {
    attempt <- mete_distribution$r(svar_n)
    if(abs(sum(attempt) - svar_sum) < 0.001*svar_sum) close_enough <- T
  }
  attempt <- sort(attempt, decreasing= T)
  return(attempt)
}

