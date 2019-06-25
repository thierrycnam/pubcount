#' get_df
#'
#' Returns a dataframe built from several sqlite files
#' @param infiles vector of filenames
#'
#' @return
#' @export
#' @import RSQLite
#' @import dplyr
#'
#' @examples
#' infile_1 <- system.file("extdata", "example.db", package = "pubcount")
#' infile_2 <- system.file("extdata", "dengue_paris.db", package = "pubcount")
#' get_df(c(infile_1, infile_2))
get_df <- function(infiles) {
  lapply(infiles, function(infile) {
    con  <- dbConnect(RSQLite::SQLite(), infile)
    df_1 <- dbGetQuery(con, query_all())
    dbDisconnect(con)
    df_1
  }) %>%
  bind_rows()
}
