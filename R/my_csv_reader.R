#' Takes all the csv from a folder, import them and put them in a list
#'
#' @param folder the folder which contains all the csv files to be imported
#'
#' @return a list
#' @export
#' @importFrom utils read.csv2
#'
#' @examples
#' \dontrun{
#' my_csv_reader(name of the folder containing the csv files)
#' }
my_csv_reader <- function (folder){
  l <- list.files(path=folder, pattern = ".*csv$", full.names = TRUE )
  result <- lapply(l, read.csv2)
  return (result)
}
