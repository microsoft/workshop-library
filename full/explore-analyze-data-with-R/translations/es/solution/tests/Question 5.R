test = list(
  name = "Question 5",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "Well done! You have successfully filtered the data to include observations whose Arrival Delay falls within the 1st and 90th quantiles.",
      failure_message = "¡Casi allí! Asegúrate de haber filtrado los datos **df_flights** para incluir solo filas en las que la entrada para la columna **ArrDelay** sea mayor que **arrdelay_01pcntile** y menor que **arrdelay_90pcntile**",
      code = {
        ## Test ##
        test_that('there are no outliers', {
          expect_equal(sum(df_flights$ArrDelay < arrdelay_01pcntile), 0)
          expect_equal(sum(df_flights$ArrDelay > arrdelay_90pcntile), 0)
  
        })
      }
    )
  )
)