#' Authenticate with twitter api
#'
#' This function authenticates with the twitter api using the `httr` package.
#'
#' @param none
#' @return oauth signature object to be used in future requests
#' @keywords misc

authenticate  <- function(){
	internet_connection()

	myapp <- suppressMessages(httr::oauth_app("twitter", key = "NL0xDi3yXpa19Dm3vNJGsj4zR", secret = "Q26uYQpBE1Vt2HnlQNkjW0C3xFqlq4mJgLGsrI9ZoTvtULKFcN"))

	sig <- httr::sign_oauth1.0(myapp,
											 token = "2904949567-plGutDw278GUwi3luxG5tGNzoMtNWGvbpHiDoQS",
											 token_secret = "upOZNTQEBraGg5ZJ2FAj3Bt55G4NgExbLWMbky0zx7zuH")

}
