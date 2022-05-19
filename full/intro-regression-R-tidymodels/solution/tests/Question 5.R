test = list(
  name = "Question 5",
  cases = list(
    ottr::TestCase$new(
      hidden = TRUE,
      name = NA,
      points = 1.0,
      success_message = "Good job. You have correctly specified a recipe that will remove the `transaction_date` feature, transform `local_convenience_stores` feature into categorical (factor) and then center and scale all numeric predictors.",
      failure_message = "Almost there. Ensure your recipe specification will remove the `transaction_date` feature, transform `local_convenience_stores` feature into categorical (factor) and then center and scale all numeric predictors.",
      code = {
        ## Test ##
        test_that('recipe specification is correct', {
          
          # Test for step_rm
          expect_equal(attr(estate_recipe[["steps"]][[1]], "class"), c("step_rm","step"))
          expect_equal(as_label(estate_recipe[["steps"]][[1]][["terms"]][[1]]), "transaction_date")
          
          # Test for step_mutate
          expect_equal(attr(estate_recipe[["steps"]][[2]], "class"), c("step_mutate","step"))
          expect_equal(as_label(estate_recipe[["steps"]][[2]][["inputs"]][["local_convenience_stores"]]), "factor(local_convenience_stores)")
          
          # Test for step_normalize
          expect_equal(attr(estate_recipe[["steps"]][[3]], "class"), c("step_normalize","step"))
          expect_equal(as_label(estate_recipe[["steps"]][[3]][["terms"]][[1]]), "all_numeric_predictors()")
          
          
        })
      }
    )
  )
)