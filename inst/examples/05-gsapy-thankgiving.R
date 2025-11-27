library(shiny)
library(bslib)
library(gsapy)

ui <- page_fillable(
  title = "Happy Thanksgiving!",

  # Load Google Fonts (Poppins)
  tags$head(
    tags$link(
      href = "https://fonts.googleapis.com/css2?family=Poppins",
      rel = "stylesheet"
    ),
    tags$style(
      HTML(
        "
        body {
          font-family: 'Poppins', sans-serif;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
        }
        "
      )
    )
  ),
  withGsapy(
    animation = "waveText",
    div(
      h2("Happy Thanksgiving!"),
    ),
  ),
  withGsapy(
    id = "shiny",
    animation = "drawSVG",
    tags$img(
      src = "https://www.svgrepo.com/show/398528/turkey.svg",
      width = "100px"
    )
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)
