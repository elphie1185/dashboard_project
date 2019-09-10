shinyServer(function(input, output) {
# ==============================================================================
#
# Top of page
#
# ==============================================================================

# Get the number of days between the start and end dates
span <- reactive({
    as.POSIXlt(input$date_range[2]) -
        as.POSIXlt(input$date_range[1])
})

# Create the text at the top showing the number of visitors to the
# website in the date range specified.
output$website_visitors <- renderText({
    validate(
        need(input$date_range[2] >= input$date_range[1],
             "End date is earlier than start date")
    )
    
    paste("Website visitors in the last ",
          span(),
          " days: "
    )
})

output$website_visitors_number <- renderText({
    paste(get_number_sessions(tab1_data, input$date_range[1], 
                              input$date_range[2])
        )
    })
    
# Create the text at the top showing the number of conversions to the
# website in the date range specified.
output$conversions <- renderText({
    validate(
        need(input$date_range[2] >= input$date_range[1],
            "End date is earlier than start date")
    )
        
    paste("Conversions in the last ",
          span(),
          " days: "
    )
})
output$conversions_number <- renderText({
    paste(0.5 * get_number_sessions(tab1_data, input$date_range[1], 
                              input$date_range[2])
        )
    })
    
# ==============================================================================
#
# Tab 1 - Event Goal Overview
#
# ==============================================================================
    
#get the data
goals_and_session <- reactive({
    get_goals_and_session(tab1_data, input$date_range[1], input$date_range[2])
})
    
output$goal_plot <- renderPlot({
    # Creating the plots
    if(input$time_range == "Monthly"){
        get_goal_monthly(goals_and_session())
    } else if (input$time_range == "Weekly") {
        get_goal_weekly(goals_and_session())
    } else if (input$time_range == "Daily") {
        get_goal_daily(goals_and_session())
    }
})
    
output$map_goal <- renderLeaflet({
    get_goal_map(goals_and_session())
})
    
# Plot of devices used to book events
output$device_plot = renderPlot({
    get_device_plot(goals_and_session())
})
    
# Plot of devices used for all sessions
output$all_sessions = renderPlot({
    get_all_sessions(goals_and_session())
})
    
# ==============================================================================
#
# Tab 2 - Session Sources and Conversion by City
#
# ==============================================================================
    
      
# Create plot for sessions by channel
output$session_channel <- renderPlot({
    session_channel(tab2_data)
})

# Create plot for Session by Social Network
output$session_social <- renderPlot({
    session_social(tab2_data)
})

# Create plot for conversion comparison by social network
output$social_conversion_comparison <- renderPlot({
    social_conversion_comparison(tab2_data)
})

# Create plot for conversion comparison by channel
output$channel_conversion_comparison <- renderPlot({
    channel_conversion_comparison(tab2_data)
})

# ==============================================================================
#
# Tab 3 - Map of sessions
#
# ==============================================================================

# Creates the map. In order to have the map render over the full page
# instead of the top half we have to use some javascript to dynamically
# get the height of the window. We then render a UI output to the UI of
# that size and the only element in that UI output is the leaflet map.
output$map_1 <- renderUI({
    leafletOutput("full_map",
                  width = "100%",
                  height = input$GetScreenHeight
    )
})

output$full_map <- renderLeaflet({
    create_map(tab3_data)
})        
    
# ==============================================================================
#
# Tab 4 - Top 20 Sessions and Exits
#
# ==============================================================================

# Create the most viewed pages output.
output$plot_5a <- renderPlot({
    create_plot_most_views(synthetic_most_view)
})
    
# Create the most exited pages output.
output$plot_5b <- renderPlot({
    create_plot_most_exits(synthetic_most_exit)
    })
})
