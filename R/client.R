library(base64enc)

#' An S4 class to represent a client connection
#' @slot authorization the Base64 encoded authorization string
#' @slot base_url the url for c
setClass(
  'SegmentIOClient',
  representation(
    authorization='character',
    base_url='character'
  ),
  prototype(authorization='')
)


#' Create a client connection to the Segment.IO API
#'
#' @export
#' @param url The URL to the Segment.IO API service
#' @param writekey the writekey for authorization to post to Segment.IO
#' @param debugging set to TRUE to increase stdout logging and provide additional debugging detail
#' @examples
#' client(
#'   writekey = 'fake_key'
#' )
client <- function(url = 'https://api.segment.io', writekey = Sys.getenv("SEGMENT_WRITEKEY"), debugging = FALSE) {
  client <- methods::new("SegmentIOClient")
  client@authorization = paste("Basic", base64enc::base64encode( charToRaw(paste0(writekey, ":"))))
  client@base_url = url

  return(client)
}
