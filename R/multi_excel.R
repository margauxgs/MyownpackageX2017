#' Import all sheets from an xlsx file
#'
#' @param file the path to the excel file we want to import the sheets from
#'
#' @return a list
#' @export
#' @import readxl
#' @examples
#' \dontrun{
#' multi_excel("/path/to/file")
#' }
multi_excel <- function(file) {
  assert_that(has_extension(file,"xlsx"))
  assert_that(is.readable(file))
  all_sheets <- readxl::excel_sheets(file)
  result <- lapply(all_sheets, function(sheet) {
    readxl::read_excel(file, sheet = sheet)
  })
  return(result)
}
