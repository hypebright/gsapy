<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

# gsapy
R Shiny interface for GSAP – wildly robust JavaScript animations ✨

# Installation
You can install the development version of `gsapy` from GitHub with:

```r
pak::pak("hypebright/gsapy")
```

# Animations
With `gsapy` you can bring GSAP animations to your Shiny elements without any JavaScript knowledge. The aim is to provide an R interface for common and simple GSAP animations. Currently we support the following animations:

| Animation | Plugin | Description |
| --- | --- | --- |
| `fadeIn` | ScrollTrigger | Fade in/out |
| `zoomIn` | ScrollTrigger | Zoom in/out |
| `slideIn` | ScrollTrigger | Slide in/out |
| `accordion` | ScrollTrigger | Stack elements |

# Using gsapy

To add an animation, you can call `withGsapy` in your Shiny UI. This function takes an `element`, or a tagList of elements, and an `animation` argument. Here's an example of how you can use `gsapy` to animate multiple `div` elements with the `fadeIn` animation:

```r
library(shiny)
library(bslib)
library(gsapy)

ui <- page_fillable(
  title = "gsap scroll adventures",
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
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
```

Updating from the server side is also possible by using the `id` argument:

```r
library(shiny)
library(bslib)
library(gsapy)

ui <- page_fillable(
  title = "gsap scroll adventures",
  # animation options
  selectInput("animation", "Choose animation",
              choices = c("fadeIn", "zoomIn", "accordion", "slideIn"),
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
  )
)

server <- function(input, output, session) {

  observe({
    updateGsapy("divs", input$animation)
  }) |> bindEvent(input$animation, ignoreInit = TRUE)

}

shinyApp(ui, server)
```

In the above examples we work with plain divs, but you can also apply animations to other elements like `card` from `blisb`. A complete demo can be found in `inst/examples/01-gsapy-scrolltrigger-cards.R`.

# Licensing
This R package provides an R interface to [GSAP (GreenSock Animation Platform)](https://github.com/greensock/GSAP). The package itself is licensed under the MIT License, meaning you are free to use, modify, and distribute it under permissive terms.

However, GSAP has its own licensing requirements that you must comply with when using this package:

* GSAP is free for most use cases, including personal projects and non-commercial applications.
* If you use GSAP in a commercial product where customers pay to access the animations, you *may* need a GreenSock Club membership with a paid license.

For full details, please review the [GSAP licensing terms](https://gsap.com/licensing/).

By using this package, you acknowledge that it does not grant you a license to GSAP itself. You are responsible for ensuring compliance with GSAP’s terms when integrating it into your projects. Interested in why GSAP doesn't use the MIT license? You can read more [here](https://gsap.com/blog/why-license/).
