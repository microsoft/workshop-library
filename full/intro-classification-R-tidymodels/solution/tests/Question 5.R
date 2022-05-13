test = list(
  name = "Question 5",
  cases = list(
    ottr::TestCase$new(
      hidden = TRUE,
      name = NA,
      points = 1.0,
      success_message = "Fantastic! You have successfully used the trained model to make hard class and probability predictions on the test set.",
      failure_message = "Let's have a look at this again! Ensure you have used your trained model to make hard class and probability predictions on the test set. Also add the true outcomes to the results. 
Hints: augment or predict + bind_cols functions.",
      code = {
        ## Test ##
        test_that('results contain true values, hard class predictions and probabilities', {
          expect_equal(sum(c("wine_variety", ".pred_class", ".pred_0", ".pred_1", ".pred_2") %in% names(results)), 5)
          
        })
      }
    )
  )
)