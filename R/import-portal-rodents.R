#' Load Portal granivores data
#'
#' All individual captures and the year. Reported as individuals (weights all = 1) or power (weight column is estimated metabolic rate, as 5.69 * (biomass ^ 0.75), after White et al 2004).
#' Non-granivorous species, and individuals not identified to species, are removed.
#'
#' @param treatment Whether to load "exclosure" or "control" rodents
#' @param currency Whether to report weight as 'abundance' (all weights = 1) or 'power'. Note that if currency = 'power' individuals missing weight measurements will be removed, and they will not be removed if currency = 'abundance'.
#' @return dataframe of year, species ID, and weight (1 for just abundances, power for power) for all individuals captured.
#'
#' @export
load_rodent_data <- function(treatment = 'control', currency = 'power') {

  # download data from repo
  portal_tables <- portalr::load_data(path = 'repo')

  rodent_data <- portal_tables[[1]]
  species_table <- portal_tables[[2]]
  trapping_table <- portal_tables[[3]]
  newmoons_table <- portal_tables[[4]]
  plots_table <- portal_tables[[5]]

  rm(portal_tables)

  # filter to granivores and remove unknown individuals,
  # nontarget species
  # select relevant columns from rodents table

  known_granivores <- species_table %>%
    dplyr::filter(granivore == 1, censustarget == 1,
                  unidentified == 0) %>%
    dplyr::select(species)

  granivores <- rodent_data %>%
    dplyr::filter(species %in% known_granivores$species) %>%
    dplyr::select(month, year, period, plot, species, wgt)

  # add treatment column and filter to selected treatment
  # remove unnecessary month, period, plot, treatment columns
  # convert weight to power if currency = power
  # otherwise convert weights to 1

  rodent_treatments <- plots_table %>%
    dplyr::select(year, month, plot, treatment) %>%
    dplyr::distinct()

  granivores <- granivores %>%
    dplyr::left_join(rodent_treatments,
                     by = c('month', 'year', 'plot')) %>%
    dplyr::filter(treatment == treatment) %>%
    dplyr::select(year, species, wgt)

  if(currency == 'abundance') {
    granivores <- granivores %>%
      dplyr::mutate(weight = 1) %>%
      dplyr::select(-wgt)
  } else if(currency == 'power') {
    granivores <- granivores %>%
      dplyr::filter(!is.na(wgt)) %>%
      dplyr::mutate(weight = 5.69 * (wgt ^ 0.75)) %>%
      dplyr::select(-wgt)
  }

  return(granivores)

}
#' Extract observations for a given year
#'
#'
#' @param granivores Dataframe of year, species, and weight
#' @param year Which year
#' @return dataframe of species ID and weight (1 for just abundances, power for power) for all records from that year.
#'
#' @export
extract_portal_year <- function(granivores, year = 1985){
  this_year <- granivores %>%
    dplyr::filter(year == year) %>%
    dplyr::select(-year)
  return(this_year)
}