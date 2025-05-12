library(shiny)
library(bslib)
library(gsapy)

ui <- page_fillable(
  title = "GSAP text adventures",
  # animation options
  layout_column_wrap(
    width = 1/2,
    max_height = "50px",
    selectInput("animation", "Choose animation",
                choices = c("waveText", "fadeInText", "flipInText"),
                selected = "waveText"),
    tagAppendAttributes(
      style = "margin-top: 25px",
      actionButton("run_again", "Run again")
    )
  ),
  withGsapy(
    id = "paragraphs",
    animation = "waveText",
    # random text paragraph with heading
    div(
      h2("Paragraph 1"),
      p("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ),
  ),
  p("Other content")
)

server <- function(input, output, session) {

  observe({
    updateGsapy("paragraphs", input$animation)
  }) |> bindEvent(input$run_again, ignoreInit = TRUE)

}

shinyApp(ui, server)
