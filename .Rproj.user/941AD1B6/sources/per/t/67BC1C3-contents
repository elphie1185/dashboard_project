# ==============================================================================
#
# Tab 4 - Top 20 Sessions and Exits
#
# ==============================================================================

# Pulls a list of pages that have the most views within the defined date range
# in descending order from googe analytics, and then plots the top 20 as a
# flipped bar chart.
create_plot_most_views <- function(data) {
        
        # Pulls list from google analytics
        most_page_view <- data %>%
                arrange(desc(pageviews))

        
        # Plots flipped bar chart
        ggplot(most_page_view[c(1:20), ]) +
                aes(x = reorder(pagePath, pageviews),
                    y = pageviews
                ) +
                geom_bar(stat = "identity", fill = "#08519c") +
                coord_flip() +
                my_theme() +
                labs(
                        title = "Top 20 Most Visted Pages\n",
                        x = "Page URL\n",
                        y = "\nNumber of exits"
                )
}

# Pulls a list of pages that have the most exits within the defined date range
# in descending order from googe analytics, and then plots the top 20 as a
# flipped bar chart.
create_plot_most_exits <- function(data) {
        
        # Pulls list from google analytics
        most_exit_page <- data %>%
                arrange(desc(exits))
        
        # Plots flipped bar chart
        ggplot(most_exit_page[c(1:20), ]) +
                aes(x = reorder(pagePath, exits), y = exits, fill = exits) +
                geom_bar(stat = "identity", fill = "#08519c") +
                coord_flip()  +
                my_theme() +
                labs(
                        title = "Top 20 Pages by Exit\n",
                        x = "Page URL\n",
                        y = "\nNumber of Views"
                )
}