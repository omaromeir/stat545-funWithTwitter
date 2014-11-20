#' Authenticate with twitter api
#'
#' This function authenticates with the twitter api
#'
#' @param none
#' @return oauth signature object to be used in future requests
#' @keywords misc

# authenticate  <- function(){
# 	aToken <- "220169719-uLcKYLzU1Np9F13xNPh4pr0ZKwPAASH56BkkygiY"
# 	aSecret <- "SvXz1NRoCko7dpd4LZpPGilnPjLXnlJUA9nobSS00Xs"
# 	cKey <- "9HAoJuJarZgSe46CtYoOg"
# 	cSecret <- "0qmh6lgMARSCuL2L2o2FUbjhoE1wCaR1jtL3KQtTQ48"
#
# 	capture.output(twitteR::setup_twitter_oauth(consumer_key = cKey, consumer_secret = cSecret,
# 											access_token = aToken, access_secret = aSecret))
# }

authenticate  <- function(){
	myapp <- suppressMessages(httr::oauth_app("twitter", key = "9HAoJuJarZgSe46CtYoOg"))

	sig <- httr::sign_oauth1.0(myapp,
											 token = "220169719-uLcKYLzU1Np9F13xNPh4pr0ZKwPAASH56BkkygiY",
											 token_secret = Sys.getenv("TWITTER_TOKEN_SECRET"))
}
