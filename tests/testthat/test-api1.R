api_rs <- test_api_start()

resp_data <- test_api_endpoint_GET("data", api_rs)

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

resp_model <- test_api_endpoint_GET("model", api_rs)

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

resp_predict <- test_api_endpoint_GET("predict", api_rs, list(weight = 2))

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


test_api_stop(api_rs)

