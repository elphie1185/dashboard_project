# Load required libraries.
library(dplyr)
library(ggplot2)
library(leaflet)
library(lubridate)
library(shiny)
library(stringr)
library(tidyverse)
library(shinydashboard)


#Source in files containing functions.
source("user_functions/plot_theme.R")
source("user_functions/top_of_page.R")
source("user_functions/tab_1a_sessions_vs_conversions_and_map.R")
source("user_functions/tab_1b_sessions_and_conversions_by_device_type.R")
source("user_functions/tab_2_sessions_and_conversions_by_city.R")
source("user_functions/tab_3_map_of_sessions.R")
source("user_functions/tab_4_top_sessions_and_exits.R")

# Random javascript code that allows dynamic resizing of the map.
jscode <- '$(document).on("shiny:connected", function(e) {
        var jsHeight = window.innerHeight;
        Shiny.onInputChange("GetScreenHeight",jsHeight);
});'

# Source the data
tab1_data <- read_csv("synthetic_tab1.csv")
tab2_data <- read_csv("synthetic_tab2.csv")
tab3_data <- read_csv("synthetic_tab3.csv")
synthetic_most_view <- read_csv("synthetic_most_view.csv")
synthetic_most_exit <- read_csv("synthetic_most_exit.csv")
