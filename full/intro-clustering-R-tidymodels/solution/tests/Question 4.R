test = list(
  name = "Question 4",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Good job! You have successfully extracted the model object that separates the data into k = 4 clusters.",
      failure_message = "Almost there! Let's take a look at this again. Ensure you filter the data set to obtain a model whose k = 4.",
      code = {
        ## Test ##
        test_that('fitted cluster method is correct', {
          expect_equal(length(final_kmeans$cluster), nrow(clust_data))
          expect_equal(range(final_kmeans$cluster), c(1, 4))
          
          
        })
      }
    )
    
  )
)