
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

## Package structure

The major pieces of the structure are presented in the file tree below.
To make it more concise, an explanation for each are in-line for each
piece:

            Folder/File                                            Explanation
    --------------------------   -------------------------------------------------------------------------
    ├── R
    │   ├── common.R             Functions that the API actually executes. They need to be exported.
    │   └── test-api-utils.R     Functions that enable the test of the actual API endpoints
    ├── inst
    │   └── api1.R               The actual plumber API.  They call functions from this package.
    └── tests
        ├── testthat
        │   ├── test-api1.R      Runs API in a new R session, and performs the tests against running API
        │   └── test-common.R    Tests functions in common.R script
