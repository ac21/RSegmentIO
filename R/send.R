send <- function(cli, end_point, body = NULL) {
  httr::POST(
    url = paste0(cli@base_url, end_point),
    httr::add_headers( get_headers(cli) ),
    body = body
  )
  Sys.sleep(1/50)  #prevent running more than 50 per second
}


get_headers <- function(cli) {
  headers = c(
    Accept = "application/json",
    Authorization = cli@authorization,
    "Content-Type" = "application/json"
  )
}
