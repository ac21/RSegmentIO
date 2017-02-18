send <- function(client, end_point, body = NULL) {
  httr::POST(
    url = paste0(client@base_url, end_point),
    httr::add_headers( get_headers(client) ),
    body = body
  )
}


get_headers <- function(client) {
  headers = c(
    Accept = "application/json",
    Authorization = client@authorization,
    "Content-Type" = "application/json"
  )
}
