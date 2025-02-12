library(shiny)
library(bslib)
library(gsapy)

ui <- page_navbar(
  # TODO: Optional, might be handy for server side animations
  # header = tagList(
  #   useGsapy()
  # ),
  fillable = FALSE,
  id = "navbar_id",
  title = "gsap scroll adventures",
  theme = bs_theme(brand = FALSE,
                   preset = "zephyr"),
  nav_panel("ScrollTrigger",
            icon = icon("medal"),
            layout_column_wrap(
              max_height = "150px",
              value_box(
                title = "Metric 1",
                showcase = bsicons::bs_icon("book"),
                value = "100",
                theme = "secondary",
                id = "value_box_one"
              ),
              value_box(
                title = "Metric 2",
                showcase = bsicons::bs_icon("cup-hot"),
                value = "200",
                theme = "secondary",
                id = "value_box_two"
              ),
              value_box(
                title = "Metric 3",
                showcase = bsicons::bs_icon("music-note-list"),
                value = "300",
                theme = "secondary",
                id = "value_box_three"
              )
            ),
            # dynamic UI that shows only when button is clicked
            textInput("name_dynamic_ui", "Card header"),
            actionButton("show_dynamic_ui", "Add card"),
            uiOutput("dynamic_ui"),
            br(),
            withGsapy(
              animation = "zoomIn",
              lapply(1:10, function(i) {
                card(
                  card_header(paste0("Card ", i), class = "bg-primary"),
                  card_body(
                    p("This is some text"),
                    p("This is other text"),
                    p("This is some very long lorem ipsum text: lorem ipsum
                    dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
                    minim veniam, quis nostrud exercitation ullamco laboris nisi
                    ut aliquip ex ea commodo consequat. Duis aute irure dolor in
                    reprehenderit in voluptate velit esse cillum dolore eu fugiat
                    nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                    sunt in culpa qui officia deserunt mollit anim id est laborum.")
                  ),
                  card_footer("Fooooter")
                )
              })
            )
  ),
  nav_panel("ScrollSmoother",
            icon = icon("running")
  ),
  nav_menu(title = "Flip",
           align = "right",
           icon = icon("basketball-ball"),
           nav_panel(title = "Set-up",
                     icon = icon("cogs")
           )
  )

)

server <- function(input, output, session) {

  output$dynamic_ui <- renderUI({
    req(input$show_dynamic_ui, input$name_dynamic_ui)
    withGsapy(
      tagAppendAttributes(
        style = "margin-top: 30px",
        card(
          card_header(input$name_dynamic_ui, class = "bg-secondary"),
          card_body(
            p("This is some very long lorem ipsum text: lorem ipsum
          dolor sit amet, consectetur adipiscing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
          minim veniam, quis nostrud exercitation ullamco laboris nisi
          ut aliquip ex ea commodo consequat. Duis aute irure dolor in
          reprehenderit in voluptate velit esse cillum dolore eu fugiat
          nulla pariatur. Excepteur sint occaecat cupidatat non proident,
          sunt in culpa qui officia deserunt mollit anim id est laborum.")
          )
        )
      )
    )
  })

}

shinyApp(ui, server)
