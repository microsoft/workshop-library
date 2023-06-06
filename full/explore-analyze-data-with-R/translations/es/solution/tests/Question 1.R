test = list(
  name = "Question 1",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Excelente. Ha seleccionado correctamente las columnas **DepDelay** y **DepDel15** y, a continuación, ha filtrado el conjunto de datos para incluir solo filas en las que el valor de **DepDel15** es NA.",
      failure_message = "¡Vaya! Vamos a intentarlo de nuevo. Asegúrate de haber seleccionado las columnas **DepDelay** y **DepDel15** y, a continuación, filtrado el conjunto de datos para incluir solo filas donde el valor de **DepDel15** es NA.",
      code = {
        suppressPackageStartupMessages({
          library(testthat)
          library(ottr)
        })

        ## Test ##
        test_that('the first column has no NA while the second has 2761 NAs', {
            expect_equal(sum(is.na(flights_depdel$DepDelay)), 0)
            expect_equal(sum(is.na(flights_depdel$DepDel15)), 2761)
        })
      }
    ),
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "¡Fantástico! Sus dimensiones tibble también son correctas.",
      failure_message = "¡Casi allí! Asegúrate de haber seleccionado las columnas **DepDelay** y **DepDel15** y, a continuación, filtra el conjunto de datos para incluir solo filas donde el valor de **DepDel15** es NA.",
      code = {
        suppressPackageStartupMessages({
          library(testthat)
          library(ottr)
        })

        ## Test ##
        test_that('data dimensions correct', {
          expect_output(glimpse(flights_depdel), "Rows: 2,761\nColumns: 2")
  
        })
      }
    )
  )
)