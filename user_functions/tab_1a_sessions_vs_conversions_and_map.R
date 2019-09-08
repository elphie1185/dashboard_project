# ==============================================================================
#
# Tab 1a - Sessions Vs. Conversions and Map of Conversions
#
# ==============================================================================

get_goals_and_session <- function(data, start_date, end_date){
  data%>%
    filter(between(date, as_date(start_date), as_date(end_date)))
}



get_goal_daily <-  function(graph_data) {
        
        goal_daily <- graph_data %>%
                mutate(total_clicks = goal3Completions + goal5Completions) %>% 
                select(-sessions) %>%
                gather(goal, num_clicks, "goal3Completions":"total_clicks")
        
        ggplot(goal_daily) +
                aes(x = date, y = num_clicks, colour = goal) +
                geom_line() +
                geom_hline(aes(yintercept = 6.7),
                           colour = "orange",
                           size = 1, 
                           linetype = 2)  +
                scale_x_date(date_breaks = "5 days") +
                scale_y_continuous(breaks = seq(0, 12, 2)) +
                scale_colour_manual(name = "legend",
                                    breaks = c("goal3Completions", "goal5Completions", 
                                               "total_clicks"
                                    ),
                                    labels = c("G3_Glasgow","G5_Edinburgh", "total"), 
                                    values = c("#6baed6", "#08306b", "#08519c")
                ) +
                labs(
                        title = "Daily event booking",
                        y = "Number of Clicks\n",
                        x = "\nDate"
                ) +
                coord_cartesian(ylim = c(0, 12)) +
                my_theme() +
                theme(
                        panel.grid.minor = element_blank(),
                        axis.text.x = element_text(angle = 45, hjust = 1) 
                )
}

get_goal_weekly <- function(graph_data) {
        weekly_summary <- graph_data %>%
                mutate(week = week(date)) %>%
                mutate(total_clicks = goal3Completions + goal5Completions) %>%
                group_by(week) %>%
                summarise("G3_Glasgow" = sum(goal3Completions), 
                          "G5_Edinburgh" = sum(goal5Completions), 
                          "total" = sum(total_clicks),
                          "total_sessions" = sum(sessions)
                )
        
        goal_weekly <- gather(weekly_summary, goal, num_clicks, 
                              "G3_Glasgow":"total")
        
        ggplot(goal_weekly) +
                aes(x = week, y = num_clicks, colour = goal) +
                geom_line() +
                geom_hline(aes(yintercept = 50),
                           colour = "orange",
                           size = 1, 
                           linetype = 2
                )  +
                scale_colour_manual(values = c("#6baed6", "#08306b", "#08519c")) +
                labs(
                        title = "Weekly Event Booking",
                        y = "Number of Clicks\n",
                        x = "\nWeek number"
                ) +
                coord_cartesian(ylim = c(0, 60)) +
                my_theme()
}

get_goal_monthly <- function (graph_data){
        # plotting for the monthly targets
        # Preparing the data per month
        goal_summary <- graph_data %>%
                mutate(month = month(date, label = TRUE, abbr = TRUE)) %>%
                mutate(total_clicks = goal3Completions + goal5Completions) %>%
                group_by(month) %>%
                summarise("G3_Glasgow" = sum(goal3Completions), 
                          "G5_Edinburgh" = sum(goal5Completions), 
                          "total_sessions" = sum(sessions)
                )
        
        goal_monthly <- gather(goal_summary, goal, num_clicks, 
                               "G3_Glasgow":"G5_Edinburgh"
        )
        
        ggplot(goal_monthly) +
                geom_bar(aes(x = month, y = num_clicks, fill = goal), 
                         stat = "identity"
                ) +
                geom_hline(aes(yintercept = 200, colour = "orange"), 
                           size = 1, 
                           linetype = 2
                )  +
                geom_text(aes(x = month, y = 200, size = 10,
                              label = paste("Sessions:\n",
                                      total_sessions)
                ), 
                nudge_y = 20, 
                size = 3.1, 
                data = filter(goal_monthly, goal == "G5_Edinburgh")
                ) +
                scale_fill_manual(values = c("#6baed6", "#08306b", "#08519c")) +
                scale_colour_manual(name = "legend", 
                                    values = "orange", 
                                    labels = "target"
                ) +
                labs(
                        title = "Monthly Event Booking",
                        y = "Number of Clicks\n",
                        x = "\nMonth"
                ) +
                coord_cartesian(ylim = c(0, 250)) +
                my_theme() +
                theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

      
        
# format the data to create the map
get_goal_map <- function(graph_data){        
        goals_map <- graph_data %>%
                select("city", "latitude", "longitude", 
                       "goal3Completions", "goal5Completions") %>%
                mutate(total = goal3Completions + goal5Completions)
        colnames(goals_map) <- c("city", "latitude", "longitude", 
                                 "G3_Glasgow", "G5_Edinburgh", "total"
        )
        
        # create the map
        leaflet(goals_map) %>% 
                addTiles() %>%
                addMarkers(lng = as.numeric(goals_map$longitude), 
                           lat = as.numeric(goals_map$latitude), 
                           clusterOptions = markerClusterOptions(),        
                           popup = paste("City",  goals_map$city, "<br>",
                                         "G3_Glasgow", goals_map$G3_Glasgow, "<br>",
                                         "G5_Edinburgh", goals_map$G5_Edinburgh
                           )
                ) %>%
                setView(-4.140302, 56.6847, zoom = 5.6) 
} 
