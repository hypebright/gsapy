library(shiny)
library(bslib)
library(gsapy)
library(httr2)

ui <- page_navbar(
  header = tagList(
    useGsapy()
  ),
  fillable = FALSE,
  id = "navbar_id",
  title = "gsap scroll adventures",
  theme = bs_theme(brand = FALSE, preset = "zephyr"),
  nav_panel(
    "ScrollTrigger",
    icon = icon("medal"),
    # Use renderUI to create dynamic UI elements
    selectInput(
      "animation",
      "Choose animation",
      choices = c("waveText", "fadeInText", "flipInText"),
      selected = "fadeInText"
    ),
    uiOutput("dynamic_ui")
  )
)

server <- function(input, output, session) {
  output$dynamic_ui <- renderUI({
    # Retrieve some text from API using httr2
    response <- request(
      "https://corporatelorem.kovah.de/api/2"
    ) |>
      req_perform() |>
      resp_body_json()

    ui <- card(
      card_header(input$name_dynamic_ui, class = "bg-secondary"),
      card_body(
        withGsapy(
          animation = input$animation,
          id = "paragraphs",
          div(
            # loop over paragraphs
            lapply(response$paragraphs, function(paragraph) {
              HTML(paragraph)
            })
          )
        )
      )
    )

    animation <- input$animation

    # Schedule animation message *after* UI is sent to browser
    session$onFlushed(
      function() {
        updateGsapy(
          session,
          id = "paragraphs",
          animation = animation
        )
      },
      once = TRUE
    )

    ui
  })
}

shinyApp(ui, server)
