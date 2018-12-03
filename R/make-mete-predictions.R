#' Generate METE predictions for SAD, IPD, iIPD
#'
#' Using meteR, generate the ESF for a given community dataset
#'
#' @param community_data dataframe of species ID and weights (1 for abundance only) by individuals
#' @param state_var logical: generate ESF using state variables (T) or community data vectors (F, default)
#' @return meteESF
#' @export

make_mete_ESF <- function(community_data, state_var = F){

  if(state_var) {
    nsp <- as.integer(length(unique(community_data$species)))
    nind <- as.integer(sum(community_data$abund))
    if(!anyNA(community_data$power)) {
      npow <- as.numeric(sum(community_data$power) / min(community_data$power))
      thisESF <- meteR::meteESF(S0 = nsp, N0 = nind, E0 = npow)
    } else {
      thisESF <- meteR::meteESF(S0 = nsp, N0 = nind)
    }
  }


  if(!state_var) {
    if(anyNA(community_data$power)) {
  thisESF <- meteR::meteESF(spp = as.vector(community_data$species),
                            abund = as.vector(community_data$abund))
  } else {
    thisESF <- meteR::meteESF(spp = as.vector(community_data$species),
                              abund = as.vector(community_data$abund),
                              power = as.vector((community_data$power) / min(community_data$power)))
  }
}

  return(thisESF)

}

#' Generate the iIPDs for a community as a list
#'
#' Using meteR, generate the iIPDs for all species in a community
#'
#' @param meteESF the meteESF object for the community
#' @return a list of meteDists for the iIPDs (also called SIPDs) for all species in a community.
#' @export

make_iIPDs <- function(meteESF){

  nspecies <- meteESF$state.var[1]

  these_ipds <- list()

  for(i in 1:nspecies) {
    these_ipds[[i]] <- meteR::sipd(meteESF, sppID = i)
  }

  return(these_ipds)

}
