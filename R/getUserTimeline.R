#' Get the timeline of a twitter user
#'
#' This function returns tweet ids of a twitter user's timeline in chronological order
#'
#' This is a function to return tweet ids from a twitter user's timeline starting from the most recent tweet.
#' The results can be used as input for `getTweet()` or `embedTweet()` functions.
#'
#'
#' @param screen_name Twitter username
#' @param count The number of tweets to return
#' @param exclude_replies if TRUE, do not include replies in results
#' @param include_rts if TRUE, include retweets in results
#' @return vector of character ids of tweets
#' @keywords misc
#' @note Adheres to the limitations imposed by the twitter api. For example, count limit is 200.
#' @export
#' @examples
#' getUserTimeline(screen_name = "STAT545", count = 5, exclude_replies = FALSE, include_rts = FALSE)

getUserTimeline  <- function(screen_name = "STAT545", count = 1, exclude_replies = TRUE, include_rts = TRUE) {
	# A few tests for the inputs:
	stopifnot(is.numeric(count))
	stopifnot(count <= 200)
	stopifnot(is.logical(exclude_replies))
	stopifnot(is.logical(include_rts))

	sig <- authenticate()

	# http request
	req <- httr::GET(paste0("https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=", screen_name,
													"&count=", count, "&exclude_replies=", exclude_replies,
													"&include_rts=", include_rts), sig)
	# stop if you encounter any well known http error, example: 404
	httr::stop_for_status(req)

	# Get the content of the http response in a list
	tweets <- httr::content(req, "parsed")

	# Give back the ids in a vector
	tweets_ids <- plyr::laply(tweets, function(e){
		e$id_str
	})
}
