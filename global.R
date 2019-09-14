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


# Pull in synthesised data
map_data <- read_csv("syn_data/map_data_syn.csv")
device_data <- read_csv("syn_data/device_data_syn.csv")
top_pages <- read_csv("syn_data/top_pages_syn.csv")
overall_goals_sessions <- read_csv("syn_data/overall_goals_sessions_syn.csv")
channel_split_data <-read_csv("syn_data/channel_split_data_syn.csv")

