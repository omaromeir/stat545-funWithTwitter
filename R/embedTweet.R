#' Embed a tweet into your R markdown
#'
#' This function returns a tweet's text, the username, and the user's avatar wrapped in html code
#'
#' This function solves a simple problem. You want to embed a tweet into your R markdown to impress
#' your professor and your peers?
#' You can do that by simply calling the functions from this package.
#'
#' @param id a tweet's id
#' @return prints a tweet html object to be embedded in R markdown.
#' @keywords misc
#' @note Tweet id can be obtained from the link to a tweet. Example: "https://twitter.com/STAT545/status/506900131086880768". The markdown chunk must have results = 'asis'.
#' @export
#' @examples
#' embedTweet(id = "506900131086880768")

embedTweet  <- function(id = "506900131086880768") {
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
	profile_image <- tweet[[1]]$user$profile_image_url

	# Print the internal style and html of the tweet
 	cat("<style>
			#tweet {
			border: 1px solid;
			border-color: #9f9f9f;
			border-radius: 5px;
			background-color:#f1f1f1;
			padding:5px;
			}
			img {
			border-radius: 5px;
			border: 1px solid;
			margin-right:5px;
			}
			#tweet-text {
			border-radius: 5px;
			background-color:#ffffff;
			padding:5px;
			}
			#tweet a {
			text-decoration:none;
			color:9f9f9f;
			}
			#link {
			font-size:8px;
			color:9f9f9f;
			}
			</style>")
	cat("<div id=\"tweet\">")
	cat(paste0("<img src = \"", profile_image, "\"/>"))
	cat(paste0("<a href = \"https://twitter.com/", screen_name,"\"> @", screen_name, "</a>"))
	cat("<p id=\"tweet-text\">")
	cat(tweet_text)
	cat("</p>")
	cat(paste0("<a id = \"link\" href= \"", "https://twitter.com/", screen_name,"/status/", id ,"\">link</a>"))
	cat("</div>")
}
