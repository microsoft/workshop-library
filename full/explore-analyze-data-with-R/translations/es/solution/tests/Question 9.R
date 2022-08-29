test = list(
  name = "Question 9",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "¡Ese es un gran comienzo! Ha codificado correctamente **DayOfWeek** como variable categórica.",
      failure_message = "Casi allí. Asegúrate de haber modificado la columna **DayOfWeek** a una variable de factor/categoría.",
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
      success_message = "¡Gran trabajo! Ahora tienes un hermoso gráfico de caja. Como puedes ver, no parece haber una gran variación de retraso de salida entre los diferentes días de la semana.",
      failure_message = "Vamos a intentarlo de nuevo. Asegúrate de haber asignado la estética _x_ a **DayOfWeek** y la estética _y_ a **DepDelay**.",
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