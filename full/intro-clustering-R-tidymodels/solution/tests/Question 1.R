test = list(
  name = "Question 1",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Great start! You have successfully created a recipe specification that will: Normalize all predictors and convert them into **two** principal components.",
      failure_message = "Almost there! Let's take a look at this again. Ensure your recipe specifies that all predictors should be normalized and then converted into two principal components.",
      code = {
        suppressPackageStartupMessages({
          library(testthat)
          library(ottr)
        })

        ## Test ##
        ## Test ##
        test_that('recipe specification is correct', {
          
          # Test for step_normalize
          expect_equal(attr(pca_rec[["steps"]][[1]], "class"), c("step_normalize","step"))
          expect_equal(as_label(pca_rec[["steps"]][[1]][["terms"]][[1]]), "all_predictors()")
          
          # Test for step_pca
          expect_equal(attr(pca_rec[["steps"]][[2]], "class"), c("step_pca","step"))
          expect_equal(pca_rec[["steps"]][[2]]$num_comp, 2)
          expect_equal(as_label(pca_rec[["steps"]][[2]][["terms"]][[1]]), "all_predictors()")
          
        })
      }
    )
  )
)