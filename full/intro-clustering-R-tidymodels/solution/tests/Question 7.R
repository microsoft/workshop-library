test = list(
  name = "Question 7",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "Fantastic! You have successsfully augmented the Principal Components with cluster labels from Hierarchical Clustering process.",
      failure_message = "Almost there! Let's take a look at this again. Ensure you have extracted 4 groups of data obtained from the Hierarchical clustering process, assigned them to a column name `cluster_id` and encoded the column as a factor.",
      code = {
        ## Test ##
        test_that('hierarchical clustering was computed', {
          expect_equal(dim(results_hclust), c(1000, 3))
          expect_equal(class(results_hclust$cluster_id), "factor")
          expect_equal(range(as.numeric(results_hclust$cluster_id)), c(1, 4))
          
          
        })
      }
    )
  )
)