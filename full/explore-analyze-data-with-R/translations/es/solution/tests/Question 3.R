test = list(
  name = "Question 3",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "¡Fantástico! Ha seleccionado correctamente la columna **DepDelay**",
      failure_message = "¡Casi allí! Asegúrate de haber seleccionado la columna **DepDelay**",
      code = {
        ## Test ##
        test_that('df_col corresponds to DepDelay', {
  
          expect_equal(colnames(df_col), "DepDelay")
          expect_output(glimpse(df_col), "Rows: 271,940\nColumns: 1")
  
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "¡Sus estadísticas resumidas también se ven muy bien!",
      failure_message = "¡Casi allí! Asegúrate de haber seleccionado la columna DepDelay para obtener las estadísticas de resumen deseadas.",
      code = {
        ## Test ##

        test_that('the distribution of DepDelay is correct', {
  
         expect_equal(show_distribution(var_data = df_col, binwidth = 100)[[1]], "Minimum: -63.00\nMean: 10.35\nMedian: -1.00\nMode: -3.00\nMaximum: 1425.00")
  
        })
      }
    )
  )
)