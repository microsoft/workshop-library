test = list(
  name = "Question 2",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Congratulations! You have successfully pivoted the data to a longer format suitable for plotting facets.",
      failure_message = "Almost there! Ensure you pivoted the exsiting columns except wine_variety to obtain two new columns **features** and **values**",
      code = {
        test_that('data dimensions correct', {
          expect_equal(dim(wine_data_long), c(2314, 3))
          expect_equal(sort(colnames(wine_data_long)), c("features", "values", "wine_variety"))
          
          expect_equal(sort(unique(wine_data_long$features)) %>% paste(collapse = ", "), "alcalinity, alcohol, ash, color_intensity, flavanoids, hue, magnesium, malic_acid, nonflavanoids, od280_315_of_diluted_wines, phenols, proanthocyanins, proline")
          
        })
      }
    )
  )
)