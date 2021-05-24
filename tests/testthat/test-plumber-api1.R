library(callthat)

api_rs <- call_that_plumber_start(
  root_folder = system.file("plumber/api1", package = "packagedapis")
  )

resp_data <- call_that_api_get(api_rs, "data")

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

resp_model <- call_that_api_get(api_rs, "model")

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

resp_predict <- call_that_api_get(api_rs, "predict", list(weight = 2))

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


call_that_plumber_stop(api_rs)

