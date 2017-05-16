#!/bin/bash
Rscript -e "options(repos=structure(c(CRAN='https://cran.rstudio.com')));install.packages(c('checkpoint','shiny'))"
