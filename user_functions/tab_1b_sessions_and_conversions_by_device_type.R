# ==============================================================================
#
# Tab 1b - Sessions and Conversions by Device Type
#
# ==============================================================================

# Plotting the devices used from all sessions
get_all_sessions <- function(graph_data) {      
        ggplot(graph_data) +
                geom_col(aes(x = deviceCategory, 
                             y = sessions), 
                         fill = "#08519c"
                ) +
                scale_fill_manual(name = "Device\nCategory") +
                my_theme() +
                theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
                labs(
                        title = "Sessions by Device Used",
                        x = "\nType of Device",
                        y = "Number of sessions\n"
                )
}

# Plotting the devices used to book events
get_device_plot <- function(graph_data) {
        all_test <- graph_data %>%
                gather(goal, num_device, "goal3Completions":"goal5Completions")
        
        ggplot(all_test) +
                geom_bar(aes(x = deviceCategory, y = num_device, fill = goal),
                         stat = "identity", position = "dodge") +
                scale_fill_manual(values = c("#6baed6", "#08306b"),
                                  labels = c("G3_Glasgow", "G5_Edinburgh"),
                                  name = "Goal"
                ) +
                labs(
                        title = "Type of device used to book event", 
                        x = "\nType of Device", 
                        y = "Number of Events Booked\n"
                ) +
                my_theme() +
                theme(axis.text.x = element_text(angle = 45, hjust = 1))
        
}
