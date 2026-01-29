Pizza Sales SQL Queries

Pizza Sales Analysis Project

Database Tool: MS SQL Server

Environment: SQL Server Management Studio (SSMS)

A. KPIs

1. Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
 
2. Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales
 
3. Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales
 
4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
 
5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM pizza_sales

B.Charts Requirements
 
6. Daily Trend( Total order each day of week)
SELECT DATENAME(DW, order_date) AS Orday_Day, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY DATENAME(DW, order_date)
 
7. Hourly Trend for Total Orders
SELECT DATEPART(HOUR, order_time) AS Order_Hours, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales GROUP BY DATEPART(HOUR, order_time) ORDER BY DATEPART(HOUR, order_time)
 
8. Percentage of Sales by Pizza Category
SELECT pizza_category AS Pizza_Category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Percentage_of_Sales FROM pizza_sales GROUP BY pizza_category
 
9. Percentage of Sales by Pizza Size
SELECT pizza_size AS Pizza_Size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) 
FROM pizza_sales) AS DECIMAL(10,2)) AS Percentage_of_Sales FROM pizza_sales 
GROUP BY pizza_size ORDER BY Percentage_of_Sales DESC
 
10. Total Pizzas Sold by Pizza Category
SELECT pizza_category AS Pizza_Category, CAST(SUM(quantity) AS DECIMAL(10,2)) AS Total_Pizza_Sold FROM pizza_sales GROUP BY pizza_category
 
11. Top 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name AS Name_of_Pizza, SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales 
GROUP BY pizza_name ORDER BY Total_Pizzas_Sold DESC
 
12. Botton 5 Worst Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name AS Name_of_Pizza, SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales 
GROUP BY pizza_name ORDER BY Total_Pizzas_Sold
 

