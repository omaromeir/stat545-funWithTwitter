testthat::context("getUserTimeline: check input")

testthat::test_that("Non numeric count throws an error", {
	testthat::expect_error(getUserTimeline(count = "h"), "Error")
})

testthat::test_that("count cannot be greater than 200", {
	testthat::expect_error(getUserTimeline(count = 201), "Error")
})

testthat::test_that("Non logical exclude_replies throws an error", {
	testthat::expect_error(getUserTimeline(exclude_replies = "true"), "Error")
})

testthat::test_that("Non logical include_rts throws an error", {
	testthat::expect_error(getUserTimeline(include_rts = "false"), "Error")
})

testthat::context("getUserTimeline: check output")

testthat::test_that("always returns character", {
	testthat::expect_is(getUserTimeline(count = 2), "character")
})

testthat::context("getTweet: check input")

testthat::test_that("Non numeric id throws an error", {
	testthat::expect_error(getTweet("HELLO"), "Error")
})

testthat::context("getTweet: check output")

testthat::test_that("always returns character", {
	testthat::expect_is(getTweet(), "character")
})

testthat::context("embedTweet: check input")

testthat::test_that("None numeric id throws an error", {
	testthat::expect_error(embedTweet("HELLO"), "Error")
})

