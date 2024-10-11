# coffee-sales-analysis

- Welcome to the Coffee Sales Data Analysis repository! This project contains SQL queries that analyze various aspects of coffee sales data, providing valuable business insights into consumer behavior, market trends, sales performance, and potential growth opportunities.
- 
# Strategic Recommendations
1. High-Potential Markets: Pune and Chennai show high sales and manageable rent costs, making them ideal for new investments and expansion.
2. Targeted Marketing: **Bangalore, Delhi, and Mumbai** have large coffee-consuming populations, indicating strong potential for coffee-centric product promotions.
3. Cost Efficiency: Cities like **Pune** have lower average rent per customer, suggesting a favorable environment for long-term profitability.

# Top 3 Cities for Expansion
Identified **Pune, Chennai, and Jaipur** as top cities for business expansion based on high total sales, robust customer bases, and balanced rent-to-customer ratios.

# Table of Contents
1. Project Overview
2. Data Model
3. Key Analyses
4. Technologies Used
5. How to Use
6. Insights and Business Recommendations
7. Future Improvements

# Project Overview
This project focuses on analyzing coffee sales across various cities, aiming to uncover trends and patterns that can drive strategic business decisions. The SQL queries in this repository help answer critical business questions such as which cities have the highest coffee consumer potential, which products are performing best, and how sales are growing over time.

The data-driven approach provides actionable insights into:

- Market segmentation based on coffee consumption and customer purchasing behavior.
- Sales performance across different cities and products.
- Growth opportunities in cities with high potential coffee consumers.

# Data Model
The analysis uses a relational database consisting of the following key tables:

- city: Contains city information, including population, estimated rent, and city ranking.
- customers: Stores customer details like city affiliation.
- sales: Tracks sales transactions, linking to customers and products.
- products: Includes information about various coffee products sold.

# Key Analyses
The project consists of the following SQL queries to provide insights:

1. Coffee Consumers Count
- Estimates the number of coffee consumers (25% of the population) in each city.
2. Total Revenue from Coffee Sales
- Calculates total sales revenue by city for Q4 2023.
3. Sales Count for Each Product
-Identifies the total units sold for each coffee product across cities.
4. Average Sales Amount per City
- Determines the average sales amount per customer in each city.
5. City Population and Coffee Consumers
- Lists city populations, estimated coffee consumers, and the number of unique customers per city.
6. Top-Selling Products by City
- Identifies the top 3 best-selling coffee products in each city.
7. Customer Segmentation by City
- Provides the number of unique customers purchasing coffee in each city.
8. Average Sale vs Rent
- Compares the average sale per customer with average rent in each city.
9. Monthly Sales Growth
- Calculates the monthly growth (or decline) in sales for each city, giving insights into market trends.
10. Market Potential Analysis
- Identifies the top 3 cities based on total sales, rent, number of customers, and coffee consumption potential.

# Technologies Used
- SQL: PostgreSQL for all queries and analysis.
- pgAdmin 4: SQL environment used for query execution and database management.
- Database Design: Leveraged relational database structure for effective analysis of sales, customers, and products.

# Insights and Business Recommendations
1. Target High-Potential Cities: Focus on cities like Pune, Chennai, and Bangalore, which show the highest sales and large coffee-consuming populations.

2. Product Promotions: Leverage insights from the top-selling products in each city to craft tailored marketing campaigns.

3. Optimize Resource Allocation: Use the "Average Sale vs Rent" analysis to ensure resources are allocated to cities where the profitability (high sales, low rent) is maximized.

4. Monitor Sales Growth: Track monthly sales growth to identify which cities are experiencing an upward trend, allowing for proactive decision-making.

