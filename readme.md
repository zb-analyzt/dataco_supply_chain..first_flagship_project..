# DataCo Smart Supply Chain Analytics Project

## Project Overview

This project analyzes the DataCo Smart Supply Chain dataset to uncover business insights related to sales performance, customer behavior, product profitability, shipping operations, and delivery efficiency.

The project follows a complete end-to-end data analytics workflow, including:

- Data Cleaning and Preprocessing (Python)
- Exploratory Data Analysis (EDA)
- SQL Business Analysis
- Interactive Power BI Dashboard Development
- Business Insights and Recommendations

The objective was to transform raw supply chain data into actionable insights that can support business decision-making and operational improvements.

---

## Business Problem

Modern supply chain organizations generate large volumes of transactional data. However, raw data alone does not provide decision-makers with meaningful information.

This project aims to answer key business questions such as:

- Which departments generate the highest revenue?
- Which customer segments contribute the most sales and profit?
- Which shipping methods are associated with delivery delays?
- How do discounts impact sales performance?
- Which product categories drive revenue growth?
- What operational factors affect customer satisfaction and delivery efficiency?

---

## Dataset Information

The dataset contains information related to:

### Customer Data

- Customer ID
- Customer Segment
- Customer Location
- Customer Information

### Order Data

- Order ID
- Order Status
- Order Quantity
- Sales
- Profit

### Product Data

- Product Name
- Product Category
- Product Price
- Department

### Shipping Data

- Shipping Mode
- Scheduled Shipping Days
- Actual Shipping Days
- Delivery Status
- Late Delivery Risk

### Geographic Data

- Country
- State
- Region
- Market

---

## Data Cleaning & Preprocessing

The dataset contained several data quality challenges that required preprocessing before analysis.

### Tasks Performed

#### Missing Value Handling

- Identified null values across multiple columns.
- Imputed missing values where appropriate.
- Investigated missing customer zip code records using customer city information.

#### Duplicate Analysis

- Checked for duplicate records.
- Evaluated whether duplicates represented actual business activity or data quality issues.

#### Data Type Corrections

- Converted date fields into proper datetime format.
- Corrected numeric columns for analysis.

#### Feature Engineering

Created additional analytical features including:

- Order Year
- Shipping Year
- Delivery Delay

Delivery Delay was calculated to compare scheduled shipping duration against actual shipping duration.

---

## Exploratory Data Analysis (EDA)

### Univariate Analysis

Performed analysis on:

- Customer Segments
- Delivery Status
- Order Status
- Product Price Distribution
- Shipping Modes

### Bivariate Analysis

Analyzed relationships between:

- Sales and Departments
- Sales and Customer Segments
- Shipping Mode and Customer Segment
- Order Status and Geographic Regions

### Multivariate Analysis

Explored interactions among:

- Sales
- Profit
- Customers
- Countries
- Product Categories
- Shipping Operations

---

## SQL Analysis

The cleaned dataset was imported into Microsoft SQL Server for business-focused analysis.

### SQL Concepts Applied

- Aggregations
- GROUP BY
- CASE Statements
- Filtering
- Ranking Concepts
- Business KPI Calculations

### Sample Business Questions Solved

- Which departments generate the highest sales?
- Which product categories contribute the most revenue?
- Which customer segments generate the highest profit?
- How do discounts impact sales performance?
- Which shipping modes experience the highest delivery risk?
- Which regions face the largest delivery delays?

---

## Power BI Dashboard

An interactive Power BI dashboard was developed to visualize business performance.

### Dashboard Features

#### KPI Cards

- Total Sales
- Total Profit
- Total Customers
- Total Orders
- Sales per Customer
- Discount-Based Orders

#### Interactive Filters

- Product Name
- Region
- Shipping Mode
- Customer Segment
- Customer State
- Order Status

#### Visualizations

- Monthly Sales Trend
- Sales by Department
- Sales & Profit by Customer Segment
- Customer Distribution by Category
- Profit by Product
- Delivery Performance by State
- Delivery Status and Late Delivery Risk by Customer Segment
- Late Delivery Risk by Shipping Mode

---

## Key Insights

### Sales Performance

- Sales declined by 21.3% in August compared to the previous month.

### Shipping Behavior

- Standard Class accounted for 69.4% of all shipments.

### Department Analysis

- Fan Shop generated approximately 50.01% of total revenue.

### Product Category Performance

- Cleats contributed 14.62% of total revenue.
- Tennis Racquets generated the lowest revenue contribution.

### Delivery Operations

- Standard Class accounted for 41.02% of late-delivery risk.

### Customer Segments

- Consumer customers generated the highest sales and revenue.
- Home Office customers contributed the lowest revenue.

---

## Business Recommendations

### 1. Improve Standard Class Shipping Efficiency

Since Standard Class is both the most frequently used shipping mode and a major contributor to late-delivery risk, logistics processes should be optimized to improve delivery performance.

### 2. Investigate the August Sales Decline

Analyze demand trends, inventory levels, and seasonal factors to identify causes behind the sales decrease.

### 3. Strengthen High-Performing Departments

Continue supporting the Fan Shop department through inventory planning and targeted promotional campaigns.

### 4. Improve Underperforming Categories

Review pricing, product assortment, and marketing strategies for low-performing categories such as Tennis Racquets.

### 5. Expand Revenue from Home Office Customers

Develop targeted campaigns to increase engagement and sales among Home Office customers.

---

## Tools & Technologies

### Programming & Analysis

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn

### Database

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

### Visualization

- Power BI

---

## Project Outcome

This project demonstrates the complete data analytics lifecycle, from raw data preprocessing to business intelligence reporting.

The analysis provides actionable insights into sales performance, customer behavior, product profitability, and supply chain operations, enabling data-driven decision-making for business stakeholders.
