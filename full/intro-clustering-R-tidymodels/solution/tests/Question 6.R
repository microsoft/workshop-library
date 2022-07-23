test = list(
  name = "Question 6",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Fantastic! You have successsfully performed hierarchical clustering using the Ward linkage method.",
      failure_message = "Almost there! Let's take a look at this again. Ensure you have used the Ward linkage method to perform Hierarchical clustering and the underlying distance metric used was the Euclidean distance.",
      code = {
        ## Test ##
        test_that('hierarchical clustering was computed', {
          expect_equal(hclust_ward$dist.method, "euclidean")
          expect_equal(hclust_ward$method, "ward.D2")
          
          
        })
      }
    )
    
  )
)