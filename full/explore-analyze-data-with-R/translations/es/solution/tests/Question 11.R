test = list(
  name = "Question 11",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "That's a great start! Your tibble dimensions are looking great!",
      failure_message = "Almost there. Let's check the tibble dimensions again. The output tibble should have columns **Route** and **ArrDelay**.",
      code = {
        ## Test ##
        test_that('summary tibble has correct dimensions', {
          
          expect_output(glimpse(df_route_arrdelay), "Rows: 2,479\nColumns: 2", fixed = TRUE)
          
          expect_equal(sort(names(df_route_arrdelay)), c("ArrDelay", "Route"))
          
          
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Fantastic! You have successfully grouped_by, summarized and arranged the observations in descending order of their mean Arrival delay times.",
      failure_message = "Almost there. Ensure the tibble is arranged in descending order of their mean delay time.",
      code = {
        ## Test ##
        
        test_that('summary tibble has correct values', {
          
          expect_equal(slice(df_route_arrdelay, 1)$ArrDelay, 24.5)
          
          expect_equal(slice(df_route_arrdelay, 2476)$Route, "Eppley Airfield>LaGuardia")
          
        })
        
      }
    )
  )
)