test = list(
  name = "Question 1",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Excellent. You have successfully selected columns **DepDelay** and **DepDel15** and then filtered the data set to only include rows where the the value for **DepDel15** is NA.",
      failure_message = "Oops! Let's give it another try. Ensure you have selected columns **DepDelay** and **DepDel15** and then filtered the data set to only include rows where the the value for **DepDel15** is NA.",
      code = {
        suppressPackageStartupMessages({
          library(testthat)
          library(ottr)
        })

        ## Test ##
        test_that('the first column has no NA while the second has 2761 NAs', {
            expect_equal(sum(is.na(flights_depdel$DepDelay)), 0)
            expect_equal(sum(is.na(flights_depdel$DepDel15)), 2761)
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Fantastic. Your tibble dimensions are also correct.",
      failure_message = "Almost there! Ensure you have selected columns **DepDelay** and **DepDel15** and then filtered the data set to only include rows where the the value for **DepDel15** is NA.",
      code = {
        suppressPackageStartupMessages({
          library(testthat)
          library(ottr)
        })

        ## Test ##
        test_that('data dimensions correct', {
          expect_output(glimpse(flights_depdel), "Rows: 2,761\nColumns: 2")
  
        })
      }
    )
  )
)