library(scApiClient)

context("prepare_data")

test_that("prepare_data returns valid JSON data", {
  basic_json <- '{\"userId\":\"fake_uuid\",\"traits\":{\"status\":\"closed\"},\"context\":{\"active\":false,\"library\":{\"name\":\"analytics-r\",\"version\":\"#_VERSION_#"}}}'
  basic_json <- gsub(
    "#_VERSION_#",
    utils::packageDescription("RSegmentIO", fields = c("Version")),
    basic_json
  )

  expect_equal( prepare_data("fake_uuid", list(status = "closed") ), basic_json )
})
