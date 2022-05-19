test = list(
  name = "Question 1",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Great start! Your tibble dimensions are correct.",
      failure_message = "Almost there! Let's take a look at this again. Expected dimensions [178 14]",
      code = {
        suppressPackageStartupMessages({
          library(testthat)
          library(ottr)
        })

        ## Test ##
        test_that('data dimensions correct', {
          expect_equal(dim(wine_data), c(178, 14))
          
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Excellent! You have successfully encoded the **wine_variety** column as a factor variable with levels 0, 1, 2.",
      failure_message = "Almost there! Ensure the **wine_variety column is encoded as a factor with levels 0, 1, 2. Hint: factor(..., levels = c(...))",
      code = {
        

        ## Test ##
        test_that('wine_variety is encoded as categorical', {
          expect_equal(class(wine_data$wine_variety), "factor")
          expect_equal(levels(wine_data$wine_variety), c("0", "1", "2"))
          
          
        })
      }
    )
  )
)