test = list(
  name = "Question 3",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "success_message: Fantastic! Your tibble dimensions and corresponding columns are correct.",
      failure_message = "Almost there! Ensure you have selected columns transaction_date, local_convenience_stores and price_per_unit, and then pivoted the exsiting columns except price_per_unit to obtain two new columns **features** and **values**",
      code = {
        ## Test ##
        test_that('data dimensions correct', {
          expect_equal(dim(cat_features_long), c(816, 3))
          expect_equal(sort(colnames(cat_features_long)), c("features", "price_per_unit", "values"))
          
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Congratulations! You have successfully selected the desired columns, encoded some of them as categorical and restructured the data to a longer format.",
      failure_message = "Almost there! Ensure you have selected columns transaction_date, local_convenience_stores and price_per_unit, and then encoded transaction_date & local_convenience_stores as categorical, and then pivoted the data correctly.",
      code = {
        ## Test ##
        test_that('data contains the correct observations', {
          expect_equal(sort(unique(cat_features_long$features)), c("local_convenience_stores", "transaction_date"))
          expect_equal(class(cat_features_long$values), "factor")
          
        })
      }
    )
  )
)