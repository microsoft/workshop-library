test = list(
  name = "Question 8",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "Fantastic! You have successfully used the trained model to make predictions for the test set and then binded the predictions to the test set.",
      failure_message = "Almost there! Generate predictions for the test data and then bind them to the test set. Hints: augment or predict + bind_cols functions. Also don't forget to rename your .pred column.",
      code = {
        ## Test ##
        test_that('the model specification is correct', {
          expect_equal(dim(results), c(123, 8))
          expect_equal(sort(colnames(results)), c("house_age", "latitude", "local_convenience_stores", "longitude", "predictions", "price_per_unit", "transaction_date", "transit_distance"))
          
          
        })
      }
    )
  )
)