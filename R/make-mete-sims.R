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
