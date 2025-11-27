# Add GSAP animation to given element(s)

Choose from a range of built-in animations or create your own custom
animations with [GSAP](https://greensock.com/gsap).

## Usage

``` r
withGsapy(element, id = NULL, animation = "fadeIn", loop = FALSE, duration = 1)
```

## Arguments

- element:

  UI element to animate

- id:

  Optional id to attach to element with the GSAP animation. This id will
  be stored as a data attribute on the element and can be used to target
  the element in custom JavaScript code.

- animation:

  Name of the animation to apply. Currently supported are

  - "fadeIn": Fade in elements that appear in the viewport on scroll,
    and fade out elements that disappear from the viewport.

  - "zoomIn": Zoom in (scale) elements that appear in the viewport on
    scroll, and zoom out elements that disappear from the viewport.

  - "stack": Stack elements when they disappear from the viewport.

  - "slideIn": Slide in elements that appear in the viewport on scroll,
    and slide out elements that disappear from the viewport.

  - "waveText": Reveal characters with a wave effect.

  - "fadeInText": Fade in text by words.

- loop:

  Boolean indicating whether the animation should repeat or is a one-off

- duration:

  Duration of the animation in seconds

## Examples

``` r
library(shiny)
#> Error in library(shiny): there is no package called ‘shiny’
library(bslib)
#> 
#> Attaching package: ‘bslib’
#> The following object is masked from ‘package:utils’:
#> 
#>     page
library(gsapy)

ui <- page_fillable(
  title = "GSAP scroll adventures",
  # animation options
  selectInput("animation", "Choose animation",
              choices = c("fadeIn", "zoomIn", "stack", "slideIn"),
              selected = "fadeIn"),
  withGsapy(
    id = "divs",
    animation = "fadeIn",
    lapply(1:10, function(i) {
      # simple div with header and random image
      div(
        h3(paste0("Beatiful image ", i)),
        img(src = paste0("https://picsum.photos/600/300?random=", i))
      )
    })
  ),
  p("Other content")
)
#> Error in loadNamespace(x): there is no package called ‘shiny’

server <- function(input, output, session) {

  observe({
    updateGsapy("divs", input$animation)
  }) |> bindEvent(input$animation, ignoreInit = TRUE)

}

shinyApp(ui, server)
#> Error in shinyApp(ui, server): could not find function "shinyApp"
```
