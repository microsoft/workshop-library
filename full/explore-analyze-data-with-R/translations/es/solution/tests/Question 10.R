test = list(
  name = "Question 10",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "¡Ese es un gran comienzo! Ha codificado correctamente **DepDel15** como variable categórica.",
      failure_message = "Casi allí. Asegúrate de haber modificado la columna **DepDel15** a una variable de factor/categoría.",
      code = {
        ## Prueba ##
        test_that('DepDel15 is a factor variable', {
          
          expect_equal(class(df_flights$DepDel15), "factor")
          
          
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "¡Gran trabajo! Ahora tienes un hermoso e informativo gráfico de diagrama de caja. Como puedes ver, los vuelos con una salida retrasada tienen un valor medio más alto para sus tiempos de retraso de llegada. De hecho, las salidas tardías tienden a dar lugar a retrasos de llegada más largos. ",
      failure_message = "Vamos a intentarlo de nuevo. Asegúrate de haber asignado la estética x a **DepDel15**, y la estética a **ArrDelay** y la estética de relleno a **DepDel15**.",
      code = {
        ## Prueba ##
        
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