test = list(
  name = "Question 3",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Fantatsic! You have successfully created a series of clustering models with an incrementing number of clusters (1-10), and then measured how tightly the data points are grouped within each cluster.",
      failure_message = "=Almost there! Let's take a look at this again. Expected tibble dimensions are [10 3] and desired metric was tot.withinss (total WCSS)",
      code = {
        ## Test ##
        test_that('cluster estimation is looking good', {
          expect_equal(dim(kclusts), c(10, 3))
          expect_true(identical(map_dbl(kclusts$model, ~ glance(.x)$tot.withinss), kclusts$tot.withinss))
          
          
        })
      }
    )
  )
)