test = list(
  name = "Question 2",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Fantatsic! You have successfully prepped a recipe and baked it to obtain the fitted PC transformation of our features.",
      failure_message = "Almost there! Let's take a look at this again. Ensure you call `prep()` which estimates the statistics required by PCA and apply them to our data using `bake(new_data = NULL)`.",
      code = {
        test_that('recipe specification is correct', {
          # Test for step_normalize
          expect_equal(attr(pca_estimates[["steps"]][[1]], "class"), c("step_normalize","step"))
          expect_equal(as_label(pca_estimates[["steps"]][[1]][["terms"]][[1]]), "all_predictors()")
          expect_true(pca_estimates[["steps"]][[1]]$trained)
          
          # Test for step_pca
          expect_equal(attr(pca_estimates[["steps"]][[2]], "class"), c("step_pca","step"))
          expect_equal(pca_estimates[["steps"]][[2]]$num_comp, 2)
          expect_equal(as_label(pca_estimates[["steps"]][[2]][["terms"]][[1]]), "all_predictors()")
          expect_true(pca_estimates[["steps"]][[2]]$trained)
          
          # Test dimension of PCA results
          expect_equal(dim(features_2d), c(1000, 2))
          
        })
      }
    )
  )
)