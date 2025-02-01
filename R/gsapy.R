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

#' Add GSAP animation to given element(s)
#'
#' Choose from a range of built-in animations or create your own custom animations
#' with [GSAP](https://greensock.com/gsap).
#'
#' @param element UI element to animate
#' @param id Optional id to attach to element with the GSAP animation. This
#' id will be stored as a data attribute on the element and can be used to
#' target the element in custom JavaScript code.
#' @param animation Name of the animation to apply
#' @param loop Boolean indicating whether the animation should repeat or is a one-off
#' @param duration Duration of the animation in seconds
#'
#' @importFrom digest digest
#' @importFrom htmltools tagAppendAttributes
#'
#' @export

withGsapy <- function(element, id = NULL,
                      animation = "fadeIn", loop = FALSE,
                      duration = 1) {

  # TODO: loop, duration args
  # TODO: dynamic UI handling
  # TODO: add custom animations

  # Attach special data attribute to element, containing an unique gsapy id
  # this id is being used to target the element on the JS side
  if (is.null(id)) {
    id <- paste0("gsapy-", digest::digest(element))
  }

  if (length(element) > 1) {
    # If multiple elements, add unique id to each child element
    # This is useful if multiple cards are targetted with the same animation
    element <- lapply(element, function(el) {
      htmltools::tagAppendAttributes(el,
                                     `data-gsapy-id` = id,
                                     `data-gsapy-animation` = animation)
    })


  } else {
    # If single element, add unique id to element
    element <- htmltools::tagAppendAttributes(element,
                                              `data-gsapy-id` = id,
                                              `data-gsapy-animation` = animation)
  }

  # Return element with new attributes, and attach dependencies
  return(
    add_gsapy_deps(
      element
    )
  )

}
