#' Embed a tweet into your R markdown
#'
#' This function returns a tweet's text, the username, and the user's avatar wrapped in html code
#'
#' This function solves a simple problem. You want to embed a tweet into your R markdown to impress
#' your professor and your peers?
#' You can do that by simply calling the functions from this package.
#'
#' @param id
#' @return string html object with a tweet's text, username, and user avatar
#' @keywords misc
#' @note tweet id can be obtained from the link to a tweet. Example: "https://twitter.com/STAT545/status/506900131086880768"
#' @export
#' @examples
#' embedTweet(id = "506900131086880768")

embedTweet  <- function(id = "506900131086880768") {
	sig <- authenticate()

	req <- httr::GET(paste0("https://api.twitter.com/1.1/statuses/lookup.json?id=", id), sig)
	httr::stop_for_status(req)

	tweet <- httr::content(req, "parsed")

	screen_name <- tweet[[1]]$user$screen_name
	tweet_text <- tweet[[1]]$text
	profile_image <- tweet[[1]]$user$profile_image_url

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
