#' Uppercase the First Character of Each Word in a String
#'
#' This function takes in a string of arbitrary length and returns a string of the 
#' same length with the first character in each word capitalized, assuming that 
#' character is alphabetic
#' 
#' @param string String to modify
#' 
#' @return Returns a string with the first character of each word capitalized, if that character is alphabetic.
#' 
#' @examples
#' toupper_first('new york')
#' ## -> [1] "New York"
#' 
#' toupper_first('NEW YORK')
#' ## -> [1] "New York"
#' 
#' toupper_first('5th avenue')
#' ## -> [1] "5th Avenue"
#' 
#' @export
toupper_first <- function(string) {
    s <- tolower(strsplit(string, " ")[[1]])
    paste0(toupper(substring(s, 1, 1)), substring(s, 2), collapse = " ")
}