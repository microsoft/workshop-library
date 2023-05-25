test = list(
  name = "Question 11",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "¡Ese es un gran comienzo! ¡Tus dimensiones tibble se ven geniales!",
      failure_message = "Casi allí. Revisemos de nuevo las dimensiones de tibble. El tibble de salida debe tener las columnas **Route** y **ArrDelay**.",
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
      success_message = "¡Fantástico! Ha agrupado _(grouped_by)_, resumido y organizado con éxito las observaciones en orden descendente de sus tiempos medios de retraso de llegada.",
      failure_message = "Casi allí. Asegúrate de que el tibble esté dispuesto en orden descendente de su tiempo medio de retraso.",
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