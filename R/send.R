send <- function(cli, end_point, body = NULL) {
  httr::POST(
    url = paste0(cli@base_url, end_point),
    httr::add_headers( get_headers(cli) ),
    body = body
  )
}


get_headers <- function(cli) {
  headers = c(
    Accept = "application/json",
    Authorization = cli@authorization,
    "Content-Type" = "application/json"
  )
}
