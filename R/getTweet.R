#' Get a tweet from its ID
#'
#' This function returns a tweet's text, and the username
#'
#' This is a function to check a tweet from its id.
#' Enter an id and the function will return the usename and text of the tweet.
#'
#'
#' @param id a tweet's id
#' @return character string with the tweet text, and user name
#' @keywords misc
#' @note Tweet id can be obtained from the link to a tweet. Example: "https://twitter.com/STAT545/status/506900131086880768"
#' @export
#' @examples
#' getTweet(id = "506900131086880768")

getTweet  <- function(id = "506900131086880768") {
	# Would return NA if id contains a non-numeric value
	stopifnot(!is.na(as.numeric(id)))

	sig <- authenticate()

	# Call the twitter api
	req <- httr::GET(paste0("https://api.twitter.com/1.1/statuses/lookup.json?id=", id), sig)
	# stop if you encounter any well known http error, example: 404
	httr::stop_for_status(req)

	# Get the content of the http response in a list
	tweet <- httr::content(req, "parsed")

	screen_name <- tweet[[1]]$user$screen_name
	tweet_text <- tweet[[1]]$text

	paste0("@", screen_name, ": ", tweet_text)
}
