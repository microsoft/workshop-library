test = list(
  name = "Question 9",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "That's a great start! You have successfully encoded **DayOfWeek** as a categorical variable.",
      failure_message = "Almost there. Ensure you modified **DayOfWeek** column to a factor/category variable.",
      code = {
        ## Test ##
        test_that('DayOfWeek is a factor variable', {
          expect_equal(class(df_flights$DayOfWeek), "factor")
          
          })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Great job! You now have yourself a beautiful box plot chart. As you can see, there doesn't seem to be a great variation of departure delay among different days of the week.",
      failure_message = "Let's give it another try. Ensure you have mapped the x aesthetic to **DayOfWeek** and y aesthetic to **DepDelay**.",
      code = {
        ## Test ##
        
        test_that('plot has expected aesthetic mappings', {
          
          expect_equal(dep_delay_plot$labels$x, "DayOfWeek")
          
          expect_equal(dep_delay_plot$labels$y, "DepDelay")
          
          
          
        })
        
      }
    )
  )
)