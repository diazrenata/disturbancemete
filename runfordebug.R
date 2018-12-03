library(disturbancemete)

portal_granivores <- load_rodent_data() # defaults to controls & power

thisyear <- unique(portal_granivores$year)[9]

one_year <- extract_portal_year(portal_granivores, chosen_year = thisyear)

esf_oneyr <- make_mete_ESF(one_year)

dists_oneyr <- make_mete_distributions(esf_oneyr)

generate_sims(dists_oneyr[[1]],
              nsims = 1000, # use more
              store_path = 'sim_storage/sad_sims.Rds')

load('sim_storage/sad_sims.Rds')
sad_sims_oneyr <- simDists
rm(simDists)

sad_sims_oneyr$empirical
sad_sims_oneyr$sims[[1]]


