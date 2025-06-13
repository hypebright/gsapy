#' gsapy dependencies utils
#'
#' @description This function attaches gsapy dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom utils packageVersion
#' @importFrom htmltools tagList htmlDependency
#' @export
add_gsapy_deps <- function(tag) {
  gsapy_deps <- htmlDependency(
    name = "gsapy",
    version = "0.0.0.9000",
    src = c(file = "gsapy-0.0.0.9000"),
    script = "dist/gsapy.min.js",
    stylesheet = "dist/gsapy.min.css",
    package = "gsapy",
  )
  tagList(tag, gsapy_deps)
}
