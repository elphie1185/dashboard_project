# Dashboard_Project - Website Performance

## Project_scope

The client would like to better understand how their website users were navigating the site, with a focus on driving visitors 
to sign up for events. The website sees roughly 9000 visitors per month. However, only a small number of these visitors - 
about 100 per month - use the website book an event.

To illustrate this the dashboard answers the following questions (for a selected date range): 
  - How many events booking were completed?
  - Where were these events booking made from (geographically)?
  - From what type of device?
  - How do user lnd on the website?
  - On which page do they land, and which page do they exit?
  - Where are visitors from?

## Tools

The data was extracted using the google_analytics API.

For the purpose of this public dashboard, synthetic data was created. 

The dashboard was created in R using shinydashboard. The following libraries were used: 
- library(leaflet)
- library(lubridate)
- library(shiny)
- library(tidyverse)
- library(shinydashboard)

## Dashboard
### Landing page - Goal Overview
The user has the option to select the dat range and see the monthly/weekly/daily number of events booking against the desired target as well as the geographical location of the users who have booked an event. 



### Session and conversion by sources and city
This tab shos the number of session and conversion of events booking depending on the channel used to access the website or type of social network. 



### Map of sessions
This tab shows the geographical location of he website users in the selected time frame. 



### Top 20 sessions and exits
This tab shows the top 20 pages were users landed on the website and left the website. 

## Authors
Delphine Rabiller, Blair Fallis, John Binnie, Leah Hart
