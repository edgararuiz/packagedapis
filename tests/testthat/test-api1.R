# Using callr to start a new R session that will run the API
# Putting inside a function to make it easier to read and debug
run_api1 <- function() {
  rs <- callr::r_session$new()
  rs$call(function() {
    ar <- plumber::plumb(system.file("api1.R", package = "packagedapis"))
    plumber::pr_run(ar, port = 1212, quiet = TRUE, docs = FALSE)
  })
  rs
}

# Starting the API outside of any test_that() function
api_rs <- run_api1()

# Testing the data endpoint using callr::r() to avoid
# getting blocked by internal firewall
resp_data <- callr::r(function() httr::GET("http://127.0.0.1:1212/data"))
# Running a status test, and a expected value test for the results
test_that("data endpoint works", {
  
  # Expect status is 200
  expect_equal(
    resp_data$status_code,
    200
  )
  
  # Expect at least the first data var is 'mpg'
  resp_content <- httr::content(resp_data)
  resp_names <- names(resp_content[[1]])
  expect_true(
    any(resp_names == "mpg")
  )
  
})

resp_model <- callr::r(function() httr::GET("http://127.0.0.1:1212/model"))

test_that("model endpoint works", {
  
  # Expect status is 200
  expect_equal(
    resp_model$status_code,
    200
  )
  
  # Expect that at least the first value is a number
  resp_content <- httr::content(resp_model)
  expect_true(
    is.numeric(resp_content[[1]][[1]])
  )  
})

  
resp_predict <- callr::r(function() httr::GET("http://127.0.0.1:1212/predict?weight=2"))

test_that("predict endpoint works", {
  
  # Expect status is 200
  expect_equal(
    resp_predict$status_code,
    200
  )
  
  # Expect that the prediction returned is about 26
  resp_content <- httr::content(resp_predict)
  expect_true(
    floor(resp_content[[1]]) == 26
  )
})


api_rs$close()

