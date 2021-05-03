test_that("Functions work",{
  expect_s3_class(
    show_data(),
    "data.frame"
  )
  expect_type(
    show_model(),
    "double"
  )
  expect_equal(
    floor(get_prediction(30)),
    -124,
    ignore_attr = TRUE
  )
})
