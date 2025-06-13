library(shiny)
library(bslib)
library(gsapy)

ui <- page_fillable(
  title = "GSAP scroll adventures",

  # Load Google Fonts (Poppins)
  tags$head(
    tags$link(
      href = "https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap",
      rel = "stylesheet"
    ),
    tags$style(HTML(
      "
      body {
        font-family: 'Poppins', sans-serif;
      }

      h3 {
        font-weight: 600;
        font-size: 1.8em;
        color: #2c3e50;
        margin-bottom: 10px;
        margin-top: 10px;
      }

      img {
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        max-width: 100%;
        height: auto;
        transition: transform 0.3s ease;
      }

      img:hover {
        transform: scale(1.03);
      }

      #divs > div {
        margin-bottom: 40px;
        text-align: center;
      }
    "
    ))
  ),

  # animation options
  selectInput(
    "animation",
    "Choose animation",
    choices = c("fadeIn", "zoomIn", "stack", "slideIn"),
    selected = "fadeIn"
  ),
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

server <- function(input, output, session) {
  observe({
    updateGsapy("divs", input$animation)
  }) |>
    bindEvent(input$animation, ignoreInit = TRUE)
}

shinyApp(ui, server)
