test = list(
  name = "Question 2",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Good job! No more missing values in column DepDel15.",
      failure_message = "Almost there! Ensure you have replaced the missing values in the column DepDel15 with a 0. Perhaps try experimenting with **mutate** and **replace_na**.",
      code = {
        ## Test ##
        test_that('data has no missing values', {
          expect_false(anyNA(df_flights), FALSE)
  
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Fantastic. Your tibble dimensions are also correct.",
      failure_message = "Almost there! Ensure you are starting with tibble **df_flights** then replaced the missing values in the column **DepDel15** with a 0.",
      code = {
        ## Test ##
        test_that('data dimensions correct', {
          expect_output(glimpse(df_flights), "Rows: 271,940")
          expect_output(glimpse(df_flights), "Columns: 20")
  
        })
      }
    )
  )
)