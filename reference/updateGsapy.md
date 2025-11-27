# Update GSAP animation

You can use this function from the server side to change the animation
effect, for example from fadeIn to zoomIn.

## Usage

``` r
updateGsapy(id, animation, session = shiny::getDefaultReactiveDomain())
```

## Arguments

- id:

  The id of the GSAP animation to update.

- animation:

  The new animation to apply. Currently supported are

  - "fadeIn": Fade in elements that appear in the viewport on scroll,
    and fade out elements that disappear from the viewport.

  - "zoomIn": Zoom in (scale) elements that appear in the viewport on
    scroll, and zoom out elements that disappear from the viewport.

  - "stack": Stack elements when they disappear from the viewport.

  - "slideIn": Slide in elements that appear in the viewport on scroll,
    and slide out elements that disappear from the viewport.

  - "waveText": Reveal characters with a wave effect.

  - "fadeInText": Fade in text by words.
