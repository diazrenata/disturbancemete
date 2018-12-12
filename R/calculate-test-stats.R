#' Get an R2
#'
#' Get the R2 for an observed distribution (either empirical or simulated from METE) compared to the METE prediction.
#' R2 method after Xiao/McGlinn/White 2015:
#'
#'
#' @param obs_ranked Vector of observed values, ranked decreasing
#' @param meteR_dist The meteR meteDist object for comparison
#' @return R2 value
#'
#' @export

get_r2 <- function(obs_ranked, meteR_dist) {

  predicted_ranked = meteR::meteDist2Rank(meteR_dist)
  predicted_ranked = sort(predicted_ranked, decreasing = T)

  r2 = 1 - (
    (sum((log10(obs_ranked) - log10(predicted_ranked))^2)) /
      sum((log10(obs_ranked) - mean(log10(obs_ranked)))^2)
  )

  return(r2)
}


#' Get a logLik
#'
#' Get the log-likelihood of an observed vector (either empirical or simulated from METE) and a meteR meteDist object
#'
#' Code adapted from the logLik function in meteR.
#'
#' @param obs_ranked Vector of observed values, ranked decreasing
#' @param meteR_dist The meteR meteDist object for comparison
#' @return logLik value
#'
#' @export

get_logLik <- function(obs_ranked, meteR_dist) {
  lik <- sum(meteR_dist$d(obs_ranked,log=TRUE))
  attr(lik, 'df') <- length(meteR_dist$La)
  class(lik) <- 'logLik'
  return(lik)
}



#' Get a Kolmogorov-Smirnov D
#' Get a Kolmogorov-Smirnov D to compare an observed distribution to a predicted METE distribution.
#'
#' @param obs_ranked Vector of observed values, ranked decreasing
#' @param meteR_dist The meteR meteDist object for comparison
#' @return ks-D value
#'
#' @export

get_ksD <- function(obs_ranked, meteR_dist) {
  obs_ecdf = ecdf(obs_ranked)
  pred_ecdf = meteR_dist$p

  d  =
    (max(abs(obs_ecdf((obs_ranked)) - pred_ecdf((obs_ranked)))))
  return(d)
}
