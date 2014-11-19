#' Get a tweet from its ID
#'
#' This function returns a tweet's text, and the username
#'
#' This function solves a simple problem. You want to embed a tweet into your R markdown to impress
#' your professor and your peers?
#' You can do that by simply calling the functions from this package.
#'
#' @param id
#' @return character string with the tweet text, and user name
#' @keywords misc
#' @note tweet id can be obtained from the link to a tweet. Example: "https://twitter.com/STAT545/status/506900131086880768"
#' @export
#' @examples
#' getTweet(id = "506900131086880768")

getTweet  <- function(id = "506900131086880768") {
	authenticate()
	tweet <- twitteR::showStatus(id)
	paste0(tweet$screenName, ": ", tweet$text)
}
