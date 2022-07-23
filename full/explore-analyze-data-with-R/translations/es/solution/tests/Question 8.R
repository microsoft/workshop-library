test = list(
  name = "Question 8",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "Fantastic! You have successfully found the mean Delay time across **DepDelay** and **ArrDelay** columns.",
      failure_message = "Let's give it another shot! Ensure that starting with **df_flights** you are creating a summary table which contains the mean across columns **DepDelay** and **ArrDelay**.",
      code = {
        ## Test ##
        test_that('summary tibble has correct values', {
          expect_output(glimpse(df_delays), "Rows: 1\nColumns: 2", fixed = TRUE)
          expect_equal(df_delays$DepDelay, -0.921692)
  
  
        })
      }
    )
  )
)