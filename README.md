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

## Creating synthetic data
For the purpose of this public dashboard, synthetic data was created. 
Calls were made to the GoogleAnalytics API to extract the metrics and dimension of interest. The output data was put through the synthpop library in R.

The date range in this public dashboard is limited to a year to match the dates of the synthetic data.


## Dashboard
### Landing page - Goal Overview
The user has the option to select the dat range and see the monthly/weekly/daily number of events booking against the desired target as well as the geographical location of the users who have booked an event. 

![](/screenshots/goal_overview.jpg)


### Session and conversion by sources and city
This tab shos the number of session and conversion of events booking depending on the channel used to access the website or type of social network. 

![](/screenshots/session_conversion.jpg)

### Map of sessions
This tab shows the geographical location of he website users in the selected time frame. 

![](/screenshots/map_session.jpg)

### Top 20 sessions and exits
This tab shows the top 20 pages were users landed on the website and left the website. 

![](/screenshots/session_exit.jpg)

## Authors
Delphine Rabiller, Blair Fallis, John Binnie, Leah Hart
