test = list(
  name = "Question 6",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      code = {
        ## Test ##
        test_that('accuracy is correct', {
          expect_equal(accuracy$.metric, "accuracy")
          expect_equal(accuracy$.estimator, "multiclass")
          expect_true(is.numeric(accuracy$.estimate))
          
        })
      }
    ),
    
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      code = {
        ## Test ##
        test_that('precision is correct', {
          expect_equal(precision$.metric, "precision")
          expect_equal(precision$.estimator, "macro")
          expect_true(is.numeric(precision$.estimate))
          
        })
      }
    ),
    
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      code = {
        ## Test ##
        test_that('recall is correct', {
          expect_equal(recall$.metric, "recall")
          expect_equal(recall$.estimator, "macro")
          expect_true(is.numeric(recall$.estimate))
          
        })
      }
    )
    
  )
)