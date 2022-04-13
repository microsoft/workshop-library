test = list(
  name = "Question 1",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Great start! Your tibble dimensions are correct.",
      failure_message = "Almost there! Ensure you have filtered correctly to obtain a subset whose observations of `price_per_unit` is less than `70`. Expected dimensions [408 7]",
      code = {
        suppressPackageStartupMessages({
          library(testthat)
          library(ottr)
        })

        ## Test ##
        test_that('data dimensions correct', {
          expect_equal(dim(estate_data), c(408, 7))
          
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Excellent. You have successfully created a subset whose observations of price_per_unit is less than 70.",
      failure_message = "Let's give this another try. Ensure your subset contains observations where **price_per_unit** is less than 70.",
      code = {
        

        ## Test ##
        test_that('the range of values for price per unit is within 7.6 and 69.7', {
          expect_equal(range(estate_data$price_per_unit), c(7.6, 69.7))
        })
      }
    )
  )
)