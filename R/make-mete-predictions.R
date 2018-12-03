#' Generate METE ESF
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

#' Generate the METE distributions for a community as a list
#'
#' Using meteR, generate the iIPDs for all species in a community
#'
#' @param meteESF the meteESF object for the community
#' @param power_dists logical: whether or not to include IPD and SIPD. Use F if no power data.
#' @return a list of meteDists for the community: sad, ipd, sipds
#' @export

make_mete_distributions <- function(this_ESF, power_dists = T){

  mete_sad   <- meteR::sad(this_ESF)
  if(power_dists) {
    mete_ipd <- meteR::ipd(this_ESF)

    mete_sipds <- list()
    mete_sipds$species_names <- unique(this_ESF$data$s)
    for(i in 1:length(mete_sipds$species_names)) {
      mete_sipds[[i+1]] <- meteR::sipd(this_ESF, mete_sipds$species_names[i])
    }
  }
  if(!power_dists) {
    mete_ipd <- NULL
    mete_sipds <- NULL
  }

  mete_distributions <- list(mete_sad, mete_ipd, mete_sipds)

  return(mete_distributions)

}
