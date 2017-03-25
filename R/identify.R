#' Create a client connection to the Sittercity API
#'
#' @export
#' @param userId a unique string to identify user who should be identified
#' @param traits a list of items to write as traits of the provided user
#' @param cli the Segment.IO client [created from ::client]
#' @examples
#' identify(
#'   userId = 'fake_uuid',
#'   traits = list(status = 'closed')
#' )
identify <- function(userId, traits = list(), cli = client() ) {
  end_point <- '/v1/identify'

  result <- send(
    cli = cli,
    end_point = end_point,
    body = prepare_data(userId, traits)
  )

  return(result)
}

prepare_data <- function(userId, traits) {
  data <- list(
    userId = userId,
    traits = traits,
    context = prepare_context()
  )
  return( rjson::toJSON(data) )
}

prepare_context <- function() {
  list(
    active = FALSE,
    library = list(
      name = "analytics-r",
      version = utils::packageDescription("RSegmentIO", fields = c("Version"))
    )
  )
}
