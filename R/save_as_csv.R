#' Title
#'
#' @param dataset name of the data frame to be saved as csv
#' @param filename name of the csv file in which the data frame will be saved
#' @param row.names TRUE if you want the row names of the data frame to be included in the csv file, FALSE otherwise
#' @param ... other arguments that can be specified such as sep, na, dec...
#'
#' @return path to csv file
#' @export
#' @importFrom utils write.csv2
#' @import assertthat
#'
#' @examples
#' \dontrun{
#' save_as_csv(iris, "outputiris.csv", row.names = FALSE, ...)
#' }
save_as_csv <- function(dataset, filename, row.names = FALSE, ...) {
  assert_that(has_extension(filename,"csv"))
  assert_that(is.dir(dirname(filename)))
  assert_that(is.writeable(dirname(filename)))
  assert_that(not_empty(dataset))
  assert_that(is.data.frame(dataset))

  write.csv2(x = dataset, file = filename, row.names = row.names, ...)
  invisible(normalizePath(filename))

}
