shinyUI(fluidPage(
  
# ==============================================================================
#
# Top of Page - Date picker, Total Sessions, Total Conversions.
#
# ==============================================================================
  
# Adds in the random bit of javascript that somehow makes the map tab
# size dynamically change with the sie of the window.
  tags$script(jscode),
  
# Add theme
  theme = shinythemes::shinytheme("cerulean"),
  
# Title
  titlePanel(tags$h2("Website Performance")),
  
# Creates heading row with date range picker and total sessions and
# conversions.
  sidebarLayout(
    sidebarPanel(
      width = 3,
      fluidPage(
        verticalLayout(
            dateRangeInput("date_range",
                         label = "Pick a date range",
                         start = Sys.Date() - 60,
                         end = Sys.Date(), 
                         min = as_date("2019-01-01"), 
                         max = as_date("2019-09-08")
            ), 
            infoBox(title = "Visitors", 
                    icon = icon("user"),
                    color = "blue", 
                    value = textOutput("website_visitors_number"), 
                    fill = TRUE
            ),
            infoBox(title = "Conversion", 
                    icon = icon("comment-dollar"),
                    color = "blue", 
                    value = textOutput("conversions_number"), 
                    fill = TRUE
            ),
            infoBox(title = "Website", 
                    icon = icon("globe"),
                    color = "blue", 
                    href = "https://github.com/elphie1185", 
                    fill = TRUE
             ),
            valueBox(value = "Data",
                     subtitle = "Synthetic Data", 
                    icon = icon("database"),
                    color = "blue"
            )
        )
      )
  ),
  
    
# ==============================================================================
#
# Tab 1 - Event Goal Overview
#
# ==============================================================================
  mainPanel(
    tabsetPanel(
      tabPanel("Event Goal Overview",
              fluidRow(
                  column(8,
                        radioButtons("time_range",
                                    "Display Type",
                                    choices = c("Monthly", "Weekly", "Daily"), 
                                    inline = TRUE
                        ), 
                        plotOutput("goal_plot")
                  ),
                  column(4, leafletOutput("map_goal"))
              ), 
         
              fluidRow(
                      column(6, 
                            plotOutput("device_plot")
                      ), 
                      column(6,
                            plotOutput("all_sessions")
                      )
              )
            ),

# ==============================================================================
#
# Tab 2 - Session Sources and Conversion by City
#
# ==============================================================================

        tabPanel("Session Sources\n and Conversion by City",
          fluidRow(
             column(6, 
                    plotOutput("session_channel")
             ),
           
              column(6,
                    plotOutput("session_social")
              )
          ),
         
         fluidRow(
              column(6, 
                     plotOutput("channel_conversion_comparison")
              ),
           
              column(6,
                    plotOutput("social_conversion_comparison")
              )
         )
      ),

# ==============================================================================
#
# Tab 3 - Map of sessions
#
# ==============================================================================

      tabPanel("Map of Sessions",
              uiOutput("map_1")
      ),

# ==============================================================================
#
# Tab 4 - Top 20 Sessions and Exits
#
# ==============================================================================
    
      tabPanel("Top 20 Sessions and Exits",
                plotOutput("plot_5a"),
                plotOutput("plot_5b")
      )
    )
  )
  )
)
)
