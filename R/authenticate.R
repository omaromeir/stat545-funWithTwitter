#' Authenticate with twitter api
#'
#' This function authenticates with the twitter api
#'
#' @param none
#' @return oauth signature object to be used in future requests
#' @keywords misc

# 	aSecret <- "SvXz1NRoCko7dpd4LZpPGilnPjLXnlJUA9nobSS00Xs"
# 	cSecret <- "0qmh6lgMARSCuL2L2o2FUbjhoE1wCaR1jtL3KQtTQ48"

authenticate  <- function(){
	myapp <- suppressMessages(httr::oauth_app("twitter", key = "9HAoJuJarZgSe46CtYoOg", secret = "0qmh6lgMARSCuL2L2o2FUbjhoE1wCaR1jtL3KQtTQ48")

	sig <- httr::sign_oauth1.0(myapp,
											 token = "220169719-uLcKYLzU1Np9F13xNPh4pr0ZKwPAASH56BkkygiY",
											 token_secret = "SvXz1NRoCko7dpd4LZpPGilnPjLXnlJUA9nobSS00Xs")
# 											 token_secret = Sys.getenv("TWITTER_TOKEN_SECRET"))
}
