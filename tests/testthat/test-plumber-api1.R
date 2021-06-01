library(callthat)

api_rs <- call_that_session_start(
  call_that_plumber_start(
    api_folder = system.file("plumber/api1", package = "packagedapis")
  ),
  call_that_rsc_connection("https://colorado.rstudio.com/rsc/packagedapis/api1")
)

test_that("data endpoint works", {
  
  resp_data <- call_that_api_get(api_rs, "data")  
  
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

test_that("model endpoint works", {
  
  resp_model <- call_that_api_get(api_rs, "model")
  
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

test_that("predict endpoint works", {
  
  resp_predict <- call_that_api_get(api_rs, "predict", list(weight = 2))
  
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

call_that_session_stop(api_rs)
