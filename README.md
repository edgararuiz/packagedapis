
<!-- README.md is generated from README.Rmd. Please edit that file -->

# packagedapis

<!-- badges: start -->

[![R-CMD-check](https://github.com/edgararuiz/packagedapis/workflows/R-CMD-check/badge.svg)](https://github.com/edgararuiz/packagedapis/actions)
<!-- badges: end -->

This package explores the mechanics of managing APIs within an R
package. The idea is to separate the functions and the API endpoint
code. This will allow to also test the functions and the endpoints
independently. The idea is for the R package test and checks will test
the endpoints as part of the verification process.

## Please clone, don’t install

This package is meant to be an example for those who want to develop a
package to maintain their APIs. The best way to take advantage of it is
to clone the repo, and then try running the tests and checks locally.
