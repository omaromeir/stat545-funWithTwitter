#' Checks the internet connection
#'
#' This function checks the internet connection
#'
#' @return nothing
#' @keywords misc

internet_connection <- function() {
	tryCatch({RCurl::getURL("www.google.com"); TRUE},
					 error = function(err) FALSE)
}
