test = list(
  name = "Question 3",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Fantastic! You have successfully selected column **DepDelay**",
      failure_message = "Almost there! Ensure you have selected column **DepDelay**",
      code = {
        ## Test ##
        test_that('df_col corresponds to DepDelay', {
  
          expect_equal(colnames(df_col), "DepDelay")
          expect_output(glimpse(df_col), "Rows: 271,940\nColumns: 1")
  
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Your summary statistics are also looking great!",
      failure_message = "Almost there! Ensure that you selected column DepDelay to obtain the desired summary statistics.",
      code = {
        ## Test ##

        test_that('the distribution of DepDelay is correct', {
  
         expect_equal(show_distribution(var_data = df_col, binwidth = 100)[[1]], "Minimum: -63.00\nMean: 10.35\nMedian: -1.00\nMode: -3.00\nMaximum: 1425.00")
  
        })
      }
    )
  )
)