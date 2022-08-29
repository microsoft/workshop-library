test = list(
  name = "Question 2",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "¡Buen trabajo! No hay más valores faltantes en la columna DepDel15.",
      failure_message = "¡Casi allí! Asegúrate de que has reemplazado los valores que faltan en la columna DepDel15 por un 0. Tal vez intenta experimentar con **mutate** y **replace_na**.",
      code = {
        ## Test ##
        test_that('data has no missing values', {
          expect_false(anyNA(df_flights), FALSE)
  
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Fantástico. Sus dimensiones tibble también son correctas.",
      failure_message = "¡Casi allí! Asegurate de que está comenzando con tibble **df_flights** y luego reemplazó los valores que faltan en la columna **DepDel15** con un 0.",
      code = {
        ## Test ##
        test_that('data dimensions correct', {
          expect_output(glimpse(df_flights), "Rows: 271,940")
          expect_output(glimpse(df_flights), "Columns: 20")
  
        })
      }
    )
  )
)