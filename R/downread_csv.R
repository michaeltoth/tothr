#' Download and Read a .csv File
#'
#' This function will check to see whether the csv file has been downloaded, and
#' if not it will download the file. It will then load the file using the read_csv
#' function.
#' 
#' @param path A character string with the name where the downloaded file is saved.
#' @param url A character string naming the URL of a resource to be downloaded.
#' 
#' @return A tibble 
#' 
#' @examples
#' downread_csv('~/iris.csv', 'https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/iris.csv')
#' 
#' @export
downread_csv <- function(path, url) {
    if (!file.exists(path)) {
        download.file(url, destfile = path)
    }
    readr::read_csv(file = path)
}