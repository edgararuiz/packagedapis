#' Returns the mtcars data set
#' @export
show_data <- function() {
  datasets::mtcars
}

#' Fits a linear regression model over mtcars
#' @export 
show_model <- function() {
  model <- stats::lm(mpg ~ wt, data = datasets::mtcars)
  summary(model)$coefficients
}

#' Retuns a preduction based on a provided Weight
#' @param x Value for the weight of the car
#' @export 
get_prediction <- function(x) {
  model <- stats::lm(mpg ~ wt, data = datasets::mtcars)
  stats::predict(model, newdata = data.frame(wt = x))
}
