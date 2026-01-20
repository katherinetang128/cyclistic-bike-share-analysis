**Cyclistic Bike-Share Analysis**

**Project Overview**

This project analyzes historical Cyclistic bike-share data to understand behavioral differences between casual riders and annual members. The goal is to identify actionable insights that can help Cyclistic convert casual riders into long-term members.

This analysis is based on the Google Data Analytics Capstone Case Study and follows a complete end-to-end data analytics workflow.

Business Question

How do annual members and casual riders use Cyclistic bikes differently, and how can these insights help increase membership conversions?

Tools \& Technologies

•	Excel — Initial data inspection and pivot table analysis

•	R (tidyverse, lubridate) Data cleaning, transformation, aggregation, and visualization

•	GitHub — Version control and portfolio hosting

**Dataset**

The dataset contains multiple monthly Divvy bike-share CSV files with trip-level ride information including: - Start and end timestamps - Ride duration - Station information - Rider type (member vs casual)

The files were combined and processed programmatically using R.

**Data Cleaning \& Preparation**

The following cleaning and feature engineering steps were performed:

•	Combine multiple monthly CSV files into one dataset.

•	Removed missing start and end timestamps.

•	Calculated ride duration in minutes

•	Removed rides shorter than 1 minute to eliminate system errors and outliers.

•	Created a day-of-week feature from trip start time.

•	Standardized inconsistent rider type columns across dataset versions

A unified column (user\_type\_clean) was created to ensure consistency between older and newer Divvy datasets.

**Key Analysis Steps**

1\. Average Ride Length by User Type

Compared average trip duration between casual riders and members.

2\. Ride Volume by Day of Week

Analyzed usage frequency patterns across weekdays and weekends.

3\. Ride Length Patterns by Day

Evaluated how trip duration changes across days for each rider type.

Created charts to visualize ride volume and ride length distributions.

**Key Findings**

•	Casual riders take longer trips on average compared to annual members, suggesting leisure-focused usage.

•	Annual members show more consistent ride activity during weekdays, indicating commuter or routine usage patterns.

•	Casual rider activity increases significantly on weekends, both in ride volume and ride duration.

These patterns highlight clear behavioral differences between rider groups.

**Business Recommendations**

Based on the analysis, Cyclistic can increase membership conversions by:

1\.	Targeting weekend riders with membership promotionsFocus marketing efforts when casual rider activity is highest.

2\.	Using ride-based digital triggers

3\.	Deliver in-app membership offers after long or frequent rides.

4.	Highlighting cost savings and convenience

5\.	Promote unlimited ride access and reduced per-ride cost compared to single-use purchases.

**Repository Structure**

Cyclistic-Analysis

│

├── analysis.R

├── README.md

├── data

│   └── Raw CSV files

│

└── visuals

&nbsp;   ├── rides\_by\_day.pdf

&nbsp;   └── ride\_length\_distribution.pdf

**How To Run This Project**

1\.	Clone this repository.

2\.	Place all raw CSV files inside the data folder.

3\.	Open analysis.R in RStudio

4\.	Install required packages:

install.packages(c("tidyverse", "lubridate"))

5\.	Run the script to reproduce the analysis and visualizations.

**Author Katherine Tang**

**Aspiring Data Analyst**



**Skills Demonstrated**

•	Data cleaning and preprocessing

•	Multi-file dataset ingestion

•	Feature engineering

•	Exploratory data analysis

•	Data visualization

•	Business insight generation

•	Version control and documentation

**Contact**

For questions or collaboration opportunities, feel free to connect via GitHub or LinkedIn.



