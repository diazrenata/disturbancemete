% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate-test-stats.R
\name{get_r2}
\alias{get_r2}
\title{Get an R2}
\usage{
get_r2(obs_ranked, meteR_dist)
}
\arguments{
\item{obs_ranked}{Vector of observed values, ranked decreasing}

\item{meteR_dist}{The meteR meteDist object for comparison}
}
\value{
R2 value
}
\description{
Get the R2 for an observed distribution (either empirical or simulated from METE) compared to the METE prediction.
R2 method after Xiao/McGlinn/White 2015:
}
