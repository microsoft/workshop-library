test = list(
  name = "Question 8",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "¡Fantástico! Has encontrado con éxito el tiempo de atraso medio en las columnas **DepDelay** y **ArrDelay**.",
      failure_message = "¡Vamos a intentarlo de nuevo! Asegúrate de que a partir de **df_flights** estas creando una tabla de resumen que contiene la media entre las columnas **DepDelay** y **ArrDelay**.",
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