test = list(
  name = "Question 4",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Fantastic! You have successfully selected column **ArrDelay**",
      failure_message = "Almost there! Ensure you have selected column **ArrDelay**",
      code = {
        ## Test ##
        test_that('df_col corresponds to ArrDelay', {
  
          expect_equal(colnames(df_col), "ArrDelay")
          expect_output(glimpse(df_col), "Rows: 271,940\nColumns: 1")
  
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Your summary statistics are also looking great!",
      failure_message = "Almost there! Ensure that you selected column ArrDelay to obtain the desired summary statistics.",
      code = {
        ## Test ##

        test_that('the distribution of ArrDelay is correct', {
  
         expect_equal(show_distribution(var_data = df_col, binwidth = 100)[[1]], "Minimum: -75.00\nMean: 6.50\nMedian: -3.00\nMode: 0.00\nMaximum: 1440.00")
  
        })

      }
    )
  )
)