test = list(
  name = "Question 7",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "Good job! You have successfully quantified the ROC performance.",
      failure_message = "Almost there. Let's have a look at this again. Ensure you are calculating the roc_auc performance.",
      code = {
        ## Test ##
        test_that('recall is correct', {
          expect_equal(auc$.metric, "roc_auc")
          expect_equal(auc$.estimator, "hand_till")
          expect_true(is.numeric(auc$.estimate))
          
        })
      }
    )
  )
)