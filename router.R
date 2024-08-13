print("Starting router.R script.")

# Load packages
library(plumber)
library(lubridate)

print("Printing available packages:")
print(search())
print("Proceeding to run a router.")

# Error handlers
error_handler_500 <- function(req, res, err) {
  res$status <- 500
  list(error = "Custom Error Message")
}

error_handler_404 <- function(req, res) {
  res$status <- 404
  list(Error_404 = "Page not found :(")
}

# Register the router and run the server
pr(
  file="/app/plumber.R"
) %>%
  pr_set_error(error_handler_500) %>%
  pr_set_404(error_handler_404) %>%
  pr_run(
    host = "0.0.0.0",
    port = 8080
    )