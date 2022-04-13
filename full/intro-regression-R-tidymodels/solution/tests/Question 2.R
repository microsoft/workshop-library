test = list(
  name = "Question 2",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Great start! Your tibble dimensions and corresponding columns are correct.",
      failure_message = "Almost there! Let's give this another shot.",
      code = {
        ## Test ##
        test_that('data dimensions correct', {
          expect_equal(dim(numeric_features_long), c(2448, 4))
          expect_equal(sort(colnames(numeric_features_long)), c("corr_coef", "features", "price_per_unit", "values"))
          
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Excellent! You have successfully pivoted the tibble and found the correlation between the existing numeric column values and the price per unit.",
      failure_message = "Let's give this another try. Ensure you have correctly pivoted the data to obtain two new columns **features** and **values** and then grouped by **features** and then added a new column **corr_coef** which is the correlation between **values** and **price_per_unit**. Lastly don't forget to ungroup :).",
      code = {
        ## Test ##
        test_that('the correlation coefficients are correct', {
          expect_equal(round(range(numeric_features_long$corr_coef), 7), c(-0.7087782, 0.6101017))
        })
      }
    )
  )
)