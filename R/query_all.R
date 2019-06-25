#' query_all
#'
#' Query to select all rows of 'pubs' table.
#' @return a dataframe
#' @export
#'
#' @examples
#' query_all()
query_all <- function() {
  "SELECT * FROM pubs;"
}
