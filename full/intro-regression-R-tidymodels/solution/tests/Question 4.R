test = list(
  name = "Question 4",
  cases = list(
    ottr::TestCase$new(
      hidden = FALSE,
      name = NA,
      points = 0.5,
      success_message = "Fantastic! You have successfully split the data and extracted the training (70%) and testing sets (30%).",
      failure_message = "Almost there. Let's have a look at this again.Ensure that the splitting specification dictates that 70% of the data should go to training and the rest to testing.",
      code = {
        ## Test ##
        test_that('data dimensions correct', {
          expect_equal(dim(estate_train), c(285, 7))
          expect_equal(dim(estate_test), c(123, 7))
          
        })
      }
    )
    
  )
)