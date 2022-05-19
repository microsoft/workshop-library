test = list(
  name = "Question 7",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 1.0,
      success_message = "",
      failure_message = "",
      code = {
        ## Test ##
        test_that('workflow specification is correct', {
          
          # Test for step_rm
          expect_equal(attr(rf_workflow[["pre"]][["actions"]][["recipe"]][["recipe"]][["steps"]][[1]], "class"), c("step_rm","step"))
          expect_equal(as_label(rf_workflow[["pre"]][["actions"]][["recipe"]][["recipe"]][["steps"]][[1]][["terms"]][[1]]), "transaction_date")
          
          # Test for step_mutate
          expect_equal(attr(rf_workflow[["pre"]][["actions"]][["recipe"]][["recipe"]][["steps"]][[2]], "class"), c("step_mutate","step"))
          expect_equal(as_label(rf_workflow[["pre"]][["actions"]][["recipe"]][["recipe"]][["steps"]][[2]][["inputs"]][["local_convenience_stores"]]), "factor(local_convenience_stores)")
          
          # Test for step_normalize
          expect_equal(attr(rf_workflow[["pre"]][["actions"]][["recipe"]][["recipe"]][["steps"]][[3]], "class"), c("step_normalize","step"))
          expect_equal(as_label(rf_workflow[["pre"]][["actions"]][["recipe"]][["recipe"]][["steps"]][[3]][["terms"]][[1]]), "all_numeric_predictors()")
          
          
          
        })
      }
    )
  )
)