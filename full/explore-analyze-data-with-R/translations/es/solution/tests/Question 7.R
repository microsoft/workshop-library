test = list(
  name = "Question 7",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "¡Bien hecho! Has filtrado con éxito los datos para incluir observaciones cuyo retraso de salida se encuentra dentro de los cuantiles 1 y 90.",
      failure_message = "¡Casi allí! Asegúrate de haber filtrado los datos **df_flights** para incluir solo filas en las que la entrada de la columna **DepDelay** sea mayor que **depdelay_01pcntile** y menor que **depdelay_90pcntile**",
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