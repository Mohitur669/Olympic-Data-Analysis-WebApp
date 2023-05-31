# [120 Years of Olympics History: Exploratory Data Analysis with Python Web App](https://mohitur669-olympic-data-analysis-webapp-app-ahoyjx.streamlit.app/)
# 1. Introduction
This is a Exploratory Data Analysis project to analyze the modern Olympic Games, including all the Games from Athens 1896 to Rio 2016. This analysis provides an opportunity to ask questions about how the Olympics have evolved over time, including questions about the participation and performance of women, different nations, and different sports and events.

# 2. About the Dataset
The dataset is collected from [here](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results). The dataset contains two files: athlete_events.csv and noc_regions.csv. <br>
The file athlete_events.csv contains 271116 rows and 15 columns. Each row corresponds to an individual athlete competing in an individual Olympic event (athlete-events). The columns are:

1. ID - Unique number for each athlete
2. Name - Athlete's name
3. Sex - M or F
4. Age - Integer
5. Height - In centimeters
6. Weight - In kilograms
7. Team - Team name
8. NOC - National Olympic Committee 3-letter code
9. Games - Year and season
10. Year - Integer
11. Season - Summer or Winter
12. City - Host city
13. Sport - Sport
14. Event - Event
15. Medal - Gold, Silver, Bronze, or NA

The file noc_regions.csv contains 230 rows and 3 columns. Each row corresponds to an individual region. The columns are:

1. NOC (National Olympic Committee 3 letter code)
2. region
3. notes

# 3. Python Web App
This project is deployed on Streamlit Community Cloud. You can access the web app [here](https://mohitur669-olympic-data-analysis-webapp-app-ahoyjx.streamlit.app/).

# 4. Features of the Web App
The web app provides a brief overview of the dataset. It provide users to choose between 4 options to explore the dataset. The options are:

1. Medal Tally
2. Overall Analysis
3. Country-wise Analysis
4. Athlete-wise Analysis

## 4.1 Medal Tally
This section provides the medal tally of all the countries that have participated in the Olympics. The medal tally is displayed in a table format. The table can also be filtered by selecting the Country Name and Year from the dropdown list.

## 4.2 Overall Analysis
This section provides the overall analysis of the Olympics. It provides information like:
1. Top Statistics of the Olympics (Edition, Hosts, Sports, Events, Nations, Athletes)
2. No. of countries participating in the Olympics over the years (Line Graph)
3. No. of events organized over the years (Line Graph)
4. No. of athletes participating over the years (Line Graph)
5. Correlation between the no of Events for each and every Sport w.r.t Year (Heatmap)
6. Table of top 15 athletes who have won the most number of medals in the Olympics. This table can also be filtered by selecting the Sports Name from the dropdown list.

## 4.3 Country-wise Analysis
This section provides the country-wise analysis of the Olympics. It contains a dropdown list where user can select Country Name, based on that the section will display the following information:
1. Medal Tally over the years for that country (Line Graph)
2. In which sport the country excels the most (Heatmap)
3. Top 10 athletes of that country (Table)

## 4.4 Athlete-wise Analysis
This section provides the athlete-wise analysis of the Olympics.
1. Distribution of Age of the athletes for Winning Medals (Curves)
2. Distribution of Age w.r.t Sports only who have won Gold Medals (Curves)
3. Gender Ratio with Height vs Weight of the athletes. Here user can select a Sport as per their choice from the dropdown list. (Scatter Plot) 
4. Men Vs Women Participation Over the Years (Line Graph)

# 5. How to run the project locally
1. Clone the repository
2. Install the required libraries (mentioned in requirements.txt)
3. Run the command `streamlit run app.py` in the terminal
4. The web app will open in the browser