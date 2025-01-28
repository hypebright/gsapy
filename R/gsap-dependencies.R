#' gsap dependencies utils
#'
#' @description This function attaches gsap. dependencies to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom htmltools tagList htmlDependency
#' @export
add_gsap_deps <- function(tag) {
 gsap_deps <- htmlDependency(
  name = "gsap",
  version = "3.12.7",
  src = c(file = "gsap-3.12.7"),
  script = "js/gsap.min.js",
  package = "gsapy",
 )
 tagList(tag, gsap_deps)
}
    
