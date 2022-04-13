test = list(
  name = "Question 6",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "Excellent! Your model specification is looking great!",
      failure_message = "Let's have a look at this again. Ensure you have set your engine to **randomForest** and the mode to **regression**.",
      code = {
        ## Test ##
        test_that('the model specification is correct', {
          expect_equal(rf_spec$mode, "regression")
          expect_equal(rf_spec$engine, "randomForest")
          
          
        })
      }
    )
  )
)