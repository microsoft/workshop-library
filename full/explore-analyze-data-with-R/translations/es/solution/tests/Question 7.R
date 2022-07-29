test = list(
  name = "Question 7",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "Well done! You have successfully filtered the data to include observations whose Departure Delay falls within the 1st and 90th quantiles.",
      failure_message = "Almost there! Ensure you have filtered the **df_flights** data to only include rows where the entry for **DepDelay** column is greater than **depdelay_01pcntile** and less than **depdelay_90pcntile**",
      code = {
        ## Test ##
        test_that('there are no outliers', {
          expect_equal(sum(df_flights$DepDelay < depdelay_01pcntile), 0)
          expect_equal(sum(df_flights$DepDelay > depdelay_90pcntile), 0)
  
        })
      }
    )
  )
)