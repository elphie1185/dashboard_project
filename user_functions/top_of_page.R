# ==============================================================================
#
# Top of page
#
# ==============================================================================

# Returns the number of sessions in the chosen date range.
get_number_sessions <- function(data, start_date, end_date) {
        sum_session <- data %>%
          filter(between(date, as_date(start_date), as_date(end_date))) %>%
          summarise(sum(sessions))
        return(sum_session)
}

