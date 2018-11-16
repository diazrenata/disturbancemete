#' Generate METE predictions for SAD, IPD, iIPD
#'
#' Using meteR, generate the predicted distribution (SAD, IPD, iIPD) for a given community dataset
#'
#' @param community_data dataframe of species ID and weights (1 for abundance only) by individuals
#' @param distribution "SAD", "IPD", or "iIPD"; which METE distribution to make the prediction for
#' @return appropriate meteDist object (see meteR documentation for details)
#'
#' @export

make_mete_distribution <- function(community_data,
                                   distribution = 'SAD'){
  thisESF <- meteR::meteESF()



}
