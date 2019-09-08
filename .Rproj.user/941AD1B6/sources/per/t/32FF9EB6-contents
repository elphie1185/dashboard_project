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
fluidRow(
  column(4,
         dateRangeInput("date_range",
                        label = "Pick a date range",
                        start = Sys.Date() - 60,
                        end = Sys.Date(), 
                        min = as_date("2019-01-01"), 
                        max = as_date("2019-09-08")
           )
    ),
  column(4,
         span(tags$h5(textOutput("website_visitors")),
              align = "center"
         ),
         span(tags$b(textOutput("website_visitors_number")),
              style = "color:orange", align = "center"
         )
  ),
  column(4,
         span(tags$h5(textOutput("conversions")),
              align = "center"
         ),
         span(tags$b(textOutput("conversions_number")),
              style = "color:orange", align = "center"
         )
  )
),
  
# Add the left hand navigation panel
navlistPanel(
  "Choose a visualisation:",
  widths = c(3, 9),
    
# ==============================================================================
#
# Tab 1 - Event Goal Overview
#
# ==============================================================================

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
         uiOutput("map_1")),

# ==============================================================================
#
# Tab 4 - Top 20 Sessions and Exits
#
# ==============================================================================
    
tabPanel("Top 20 Sessions and Exits",
         plotOutput("plot_5a"),
         plotOutput("plot_5b")
),
    
# ==============================================================================
#
# Tab 5 - Website link
#
# ==============================================================================

tabPanel(tags$a("Website Link", href = "https://github.com/elphie1185"))
)
))