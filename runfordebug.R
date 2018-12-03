library(disturbancemete)

portal_granivores <- load_rodent_data() # defaults to controls & power


thisyear <- unique(portal_granivores$year)[9]

one_year <- extract_portal_year(portal_granivores, chosen_year = thisyear)

head(one_year)

esf_oneyr<- make_mete_ESF(one_year)

sad_oneyear   <- meteR::sad(esf_oneyr)


