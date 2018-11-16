library(disturbancemete)

portal_granivores <- load_rodent_data() # defaults to controls & power

one_year <- extract_portal_year(portal_granivores, year = 1995)

head(one_year)

esf1995 <- make_mete_ESF(one_year)

sad1995 <- meteR::sad(esf1995)

str(sad1995)

ipd1995 <- meteR::ipd(esf1995)

str(ipd1995)

sipds1995 <- make_iIPDs(esf1995)

str(sipds1995)
