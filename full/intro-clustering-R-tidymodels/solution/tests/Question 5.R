test = list(
  name = "Question 5",
  cases = list(
    
    ottr::TestCase$new(
      hidden = TRUE,
      name = NA,
      points = 1.0,
      success_message = "Excellent! You have successfully augmented the Principal Components with corresponding cluster assignments.",
      failure_message = "Almost there! Let's take a look at this again. Ensure you have correctly used augment() to add cluster assignmnets to the Principal Components data.",
      code = {
        ## Test ##
        test_that('Principal Components are augmented with clustering results', {
          expect_equal(results %>% select(!contains("PC")) %>% pull() %>% as.numeric() %>% range(), c(1, 4))
          expect_equal(dim(results), c(1000, 3))
          
          
        })
      }
    ),
    
    ottr::TestCase$new(
      hidden = TRUE,
      name = NA,
      points = 1.0,
      success_message = "A fantastic visualization of the cluster assignmnets you have there!",
      failure_message = "Almost there! Let's take a look at this again. Ensure you have assigned the `shape` and `color` aesthetics to the cluster number (.cluster) assigned to each data point.",
      code = {
        ## Test ##
        test_that('Cluster plot is looking good', {
          expect_output(print(cluster_plot$layers[[1]]), "mapping: shape = ~.cluster, colour = ~.cluster \ngeom_point: na.rm = FALSE\nstat_identity: na.rm = FALSE\nposition_identity ")
          
          
          
        })
      }
    )
    
  )
)