# ==============================================================================
#
# Tab 2 - Session Sources and Conversion by City
#
# ==============================================================================

# PLOT FUNCTION: Number of Sessions by Channel
# Call using:
# session_channel(channel_group_df)
session_channel <- function(graph_data){

        ggplot(graph_data) +
                aes(x = channelGrouping, 
                    y = sessions
                ) +
                geom_col(fill = "#08519c") +
                labs(
                        x = "\nChannel",
                        y = "Sessions\n",
                        title = "Sessions by Channel\n",
                        fill = "Channel"
                ) +
                my_theme() +
                theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
                scale_fill_brewer(palette = "Blues")
}

# PLOT FUNCTION: nummber of sessions by Social Network
# Call Using:
# session_social(social_group_df)
session_social <- function(graph_data){
        ggplot(graph_data) +
                aes(x = socialNetwork, 
                    y = sessions
                ) +
                geom_col(fill = "#08519c") +
                labs(
                        x = "\nSocial Network",
                        y = "Sessions\n",
                        title = "Social Channel by\nSocial Network\n",
                        fill = "Social Network"
                ) + 
                my_theme() +
                theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
                scale_fill_brewer(palette = "Blues")
        
}


# PLOT FUNCTION: comparison of goal conversion for Edinburgh and Glasgow by
# Social Network
# Call Using: social_conversion_comparison(gathered_social)
social_conversion_comparison <- function(graph_data){
        gathered_social <- graph_data %>% 
                select(socialNetwork, goal3ConversionRate, goal5ConversionRate) %>%
                gather(key = "location",
                       value = conversion, -socialNetwork
                )
        
        ggplot(gathered_social, aes(socialNetwork, conversion, fill=location)) +
                geom_bar(stat = "identity",position="dodge") +
                labs(
                        x = "\nSocial Network",
                        y = "Conversion (%)\n",
                        title = "Conversion by\nSocial Network\n"
                ) +
                my_theme() +
                theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
                scale_fill_manual(name = "Location", 
                        values = c("#6baed6", "#08306b"), 
                        labels = c("Glasgow", "Edinburgh")
                )
}



# PLOT FUNCTION: comparison of goal conversion for Edinburgh and Glasgow by 
# Channel
# CALL USING: channel_conversion_comparison(gathered_channel)
channel_conversion_comparison <- function(graph_data){
        gathered_channel <- graph_data %>%
                select(channelGrouping, goal3ConversionRate, goal5ConversionRate) %>%
                gather(key="location",
                       value = conversion, -channelGrouping)
        
        ggplot(gathered_channel, aes(channelGrouping, conversion, fill=location)) +
                geom_bar(stat = "identity",position="dodge") +
                labs(
                        x = "\nChannel",
                        y = "Conversion (%)\n",
                        title = "Session Conversion\nby Channel\n"
                ) +
                my_theme() +
                theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
                scale_fill_manual(name = "Location", 
                        values = c("#6baed6", "#08306b"), 
                        labels = c("Glasgow", "Edinburgh")
                )
}