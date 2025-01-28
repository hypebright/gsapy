#' Add gsapy dependencies
#'
#' @importFrom htmltools withTags
#' @return A tagList with the gsapy dependencies
#' @export

useGsapy <- function() {

  gsapyTag <- withTags(
    div(class = "gsapyDeps")
  )

  add_gsapy_deps(gsapyTag)

}
