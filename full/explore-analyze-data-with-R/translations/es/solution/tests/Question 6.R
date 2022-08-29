test = list(
  name = "Question 6",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "¡Eso es todo! Tienes los valores correctos para los percentiles 1 y 90.",
      failure_message = "¡Vamos a intentarlo de nuevo! Asegúrate de que tus _quantiles_ **DepDelay** correspondan a una probabilidad de 0,01 (1%) y 0,90 (90%)",
      code = {
        ## Test ##
        test_that('quantile values are correct', {
          expect_equal(depdelay_01pcntile, -12)
          expect_equal(depdelay_90pcntile, 17)
  
        })
      }
    )
  )
)