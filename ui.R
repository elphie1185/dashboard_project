shinyUI(fluidPage(
  
# ==============================================================================
#
# Top of Page - Date picker, Total Sessions, Total Conversions.
#
# ==============================================================================
  
# Adds in the random bit of javascript that somehow makes the map tab
# size dynamically change with the sie of the window.
  tags$script(jscode),

tags$head(
  tags$style(HTML("/*
 * Component: Info Box
                    * -------------------
                    */
                    .info-box {
                    display: block;
                    min-height: 90px;
                    background: #fff;
                    width: 100%;
                    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
                    border-radius: 2px;
                    margin-bottom: 15px;
                    }
                    .info-box small {
                    font-size: 14px;
                    }
                    .info-box .progress {
                    background: rgba(0, 0, 0, 0.2);
                    margin: 5px -10px 5px -10px;
                    height: 2px;
                    }
                    .info-box .progress,
                    .info-box .progress .progress-bar {
                    border-radius: 0;
                    }
                    .info-box .progress .progress-bar {
                    background: #fff;
                    }
                    .info-box-icon {
                    border-top-left-radius: 2px;
                    border-top-right-radius: 0;
                    border-bottom-right-radius: 0;
                    border-bottom-left-radius: 2px;
                    display: block;
                    float: left;
                    height: 90px;
                    width: 90px;
                    text-align: center;
                    font-size: 45px;
                    line-height: 90px;
                    background: rgba(0, 0, 0, 0.2);
                    }
                    .info-box-icon > img {
                    max-width: 100%;
                    }
                    .info-box-content {
                    padding: 5px 10px;
                    margin-left: 90px;
                    }
                    .info-box-number {
                    display: block;
                    font-weight: bold;
                    font-size: 18px;
                    }
                    .progress-description,
                    .info-box-text {
                    display: block;
                    font-size: 14px;
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    }
                    .info-box-text {
                    text-transform: uppercase;
                    }
                    .info-box-more {
                    display: block;
                    }
                    .progress-description {
                    margin: 0;
                    }

                    .bg-blue,
                    .callout.callout-warning,
                    .alert-warning,
                    .label-warning,
                    .modal-warning .modal-body {
                      background-color: #12f3f3 !important;
                    }

                    "))
),

# Add theme
  theme = shinythemes::shinytheme("cerulean"),
  
# Creates row with Title and date picker
  fluidRow(
    column(9, 
           titlePanel(tags$h2("Website Performance"))
    ),
    column(3, 
           dateRangeInput("date_range",
                          label = "Pick a date range",
                          start = as_date("2019-09-08") - 60,
                          end = as_date("2019-09-08"), 
                          min = as_date("2019-01-01"), 
                          max = as_date("2019-09-08"))
    )
  ),

# crates rw with info boxes
  fluidRow(
    column(3, 
           infoBox(title = "Visitors", 
                   icon = icon("user"),
                   color = "blue", 
                   value = textOutput("website_visitors_number"))
    ),
    column(3, 
           infoBox(title = "Conversion", 
                   icon = icon("comment-dollar"),
                   color = "blue", 
                   value = textOutput("conversions_number"))
    ),
    column(3, 
           infoBox(title = "Website", 
                   icon = icon("globe"),
                   color = "blue", 
                   href = "https://github.com/elphie1185")
    ),
    column(3, 
           infoBox(title =  "Data",
                   value = "Synthetic Data", 
                   icon = icon("database"),
                   color = "blue")
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

