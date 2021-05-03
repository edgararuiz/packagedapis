
<!-- README.md is generated from README.Rmd. Please edit that file -->

# packagedapis

<!-- badges: start -->
<!-- badges: end -->

This package explores how the mechanics of testing would work to using
the R package structure to create and test APIs by moving functions to
the R folder, and the actual API to the `inst` folder.

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
    │   └── common.R              Functions that the API actually executes. They need to be exported.
    ├── inst
    │   └── api1.R                The actual plumber API.  They call functions from this package.
    └── tests
        ├── testthat
        │   ├── test-api1.R       Runs API in a new R session, and performs the tests against running API
        │   └── test-common.R     Tests functions in common.R script
