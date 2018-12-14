library(disturbancemete)

portal_granivores <- load_rodent_data() # defaults to controls & power

thisyear <- unique(portal_granivores$year)[9]

one_year <- extract_portal_year(portal_granivores, chosen_year = thisyear)

esf_oneyr <- make_mete_ESF(one_year)

dists_oneyr <- make_mete_distributions(esf_oneyr)

generate_sims(dists_oneyr[[1]],
              nsims = 100000, # use more
              store_path = 'sim_storage/sad_sims.Rds')

load('sim_storage/sad_sims.Rds')
sad_sims_oneyr <- simDists
rm(simDists)

sad_sims_oneyr$empirical
sad_sims_oneyr$sims[[1]]

ll_emp <- get_logLik(sad_sims_oneyr$empirical, dists_oneyr[[1]])
ll_sim <- vapply(sad_sims_oneyr$sims, FUN = get_logLik,
                 FUN.VALUE = ll_emp, meteR_dist = dists_oneyr[[1]])
# might want to make this a function, to get just the emp_quant
# or the plot
# wait and see about within-dist stuff though
ll_ecdf <- ecdf(ll_sim)
emp_quant <- ll_ecdf(ll_emp)
plot(ll_ecdf)
abline(v = ll_emp, col = 'red')


