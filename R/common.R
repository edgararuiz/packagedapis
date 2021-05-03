
#' @export
show_data <- function() {
  mtcars
}

#' @export 
show_model <- function() {
  model <- lm(mpg ~ wt, data = mtcars)
  summary(model)$coefficients
}

#' @export 
get_prediction <- function(x) {
  model <- lm(mpg ~ wt, data = mtcars)
  predict(model, newdata = data.frame(wt = x))
}
