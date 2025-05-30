#' Add gsapy dependencies
#'
#' @importFrom htmltools withTags div
#' @return A tagList with the gsapy dependencies
#' @export

useGsapy <- function() {

  gsapyTag <- htmltools::withTags(
    htmltools::div(class = "gsapyDeps")
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
#' @param animation Name of the animation to apply. Currently supported are
#' - "fadeIn": Fade in elements that appear in the viewport on scroll, and
#' fade out elements that disappear from the viewport.
#' - "zoomIn": Zoom in (scale) elements that appear in the viewport on scroll,
#' and zoom out elements that disappear from the viewport.
#' - "stack": Stack elements when they disappear from the viewport.
#' - "slideIn": Slide in elements that appear in the viewport on scroll,
#' and slide out elements that disappear from the viewport.
#' - "waveText": Reveal characters with a wave effect.
#' - "fadeInText": Fade in text by words.
#' @param loop Boolean indicating whether the animation should repeat or is a one-off
#' @param duration Duration of the animation in seconds
#'
#' @importFrom digest digest
#' @importFrom htmltools tagAppendAttributes
#'
#' @export
#'
#' @example inst/examples/02-gsapy-scrolltrigger-divs.R

withGsapy <- function(element, id = NULL,
                      animation = "fadeIn", loop = FALSE,
                      duration = 1) {

  # TODO: loop, duration args
  # TODO: options argument?
  # TODO: add custom animations

  # Check for allowed animations
  animation <- match.arg(animation, c("fadeIn", "zoomIn", "stack", "slideIn", "waveText", "fadeInText", "flipInText"))

  # Attach special data attribute to element, containing an unique gsapy id
  # this id is being used to target the element on the JS side
  if (is.null(id)) {
    id <- paste0("gsapy-", digest::digest(element))
  }

  # Does the element consist of multiple Shiny UI elements?
 if(all(sapply(element, inherits, "shiny.tag"))) {
    parent <- TRUE
  } else {
    parent <- FALSE
  }

  if (parent) {
    # If multiple UI elements, add unique id to each child element
    # This is useful if multiple cards are targeted with the same animation,
    # for example using a tagList or a lapply call
    element <- lapply(seq_along(element), function(i) {
      el <- element[[i]]
      if (inherits(el, "shiny.tag") || inherits(el, "shiny.tag.list")) {
        # if last element, add .last-child class
        if (i == length(element)) {
          class <- "gsapy last-child"
        } else {
          class <- "gsapy"
        }

        htmltools::tagAppendAttributes(el,
                                       class = class,
                                       `data-gsapy-id` = id,
                                       `data-gsapy-animation` = animation,
                                       `data-gsapy-level` = "child")
      }
    })

    # Wrap the elements in a div with class gsapy-wrapper and gsapy-content
    # This is useful for e.g. ScrollSmoother
    element <- htmltools::tagList(
      htmltools::div(
        class = "gsapy-wrapper",
        id = paste0("gsapy-wrapper-", digest::digest(element)),
        htmltools::div(
          class = "gsapy-content",
          id = paste0("gsapy-content-", digest::digest(element)),
          htmltools::div(
            class = "gsapy-animations",
            id = paste0("gsapy-animations-", digest::digest(element)),
            element
          )
        )
      )
    )


  } else {
    # If single element, add unique id to element
    element <- htmltools::tagAppendAttributes(element,
                                              class = "gsapy",
                                              `data-gsapy-id` = id,
                                              `data-gsapy-animation` = animation,
                                              `data-gsapy-level` = "parent")
  }

  # Return element with new attributes, and attach dependencies
  return(
    add_gsapy_deps(
      element
    )
  )

}

#' Update GSAP animation
#'
#' You can use this function from the server side to change the
#' animation effect, for example from fadeIn to zoomIn.
#'
#' @param id The id of the GSAP animation to update.
#' @param animation The new animation to apply. Currently supported are
#' - "fadeIn": Fade in elements that appear in the viewport on scroll, and
#' fade out elements that disappear from the viewport.
#' - "zoomIn": Zoom in (scale) elements that appear in the viewport on scroll,
#' and zoom out elements that disappear from the viewport.
#' - "stack": Stack elements when they disappear from the viewport.
#' - "slideIn": Slide in elements that appear in the viewport on scroll,
#' and slide out elements that disappear from the viewport.
#' - "waveText": Reveal characters with a wave effect.
#' - "fadeInText": Fade in text by words.
#'
#' @export
#'
updateGsapy <- function(id, animation, session = shiny::getDefaultReactiveDomain()) {

  animation <- match.arg(animation, c("fadeIn", "zoomIn", "stack", "slideIn", "waveText", "fadeInText", "flipInText"))

  # send message to JavaScript with the id
  session$sendCustomMessage("update-gsapy", list(id = id,
                                                 animation = animation))
}
