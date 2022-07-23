test = list(
  name = "Question 10",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "That's a great start! You have successfully encoded **DepDel15** as a categorical variable.",
      failure_message = "Almost there. Ensure you modified **DepDel15** column to a factor/category variable.",
      code = {
        ## Test ##
        test_that('DepDel15 is a factor variable', {
          
          expect_equal(class(df_flights$DepDel15), "factor")
          
          
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Great job! You now have yourself a beautiful and informative box plot chart. As you can see, flights with a delayed departure have a higher median value for their arrival delay times. Indeed late departures tend to result in longer arrival delays. ",
      failure_message = "Let's give it another try. Ensure you have mapped the x aesthetic to **DepDel15**, y aesthetic to **ArrDelay** and fill aesthetic to **DepDel15**.",
      code = {
        ## Test ##
        
        test_that('plot has expected aesthetic mappings', {
          
          expect_equal(class(arr_delay_plot$layers[[1]]$geom)[1], "GeomBoxplot")
          
          expect_equal(arr_delay_plot$labels$x, "DepDel15")
          
          expect_equal(arr_delay_plot$labels$y, "ArrDelay")
          
          expect_equal(arr_delay_plot$labels$fill, "DepDel15")
          
          
          
        })
        
      }
    )
  )
)