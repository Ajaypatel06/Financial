Create database Financial;

Use Financial;

select count(*) from financial_data;

select * from financial_data;

-- Calculate Total Profit for Each Segment:

SELECT Segment, SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Segment;


-- Average Units Sold Per Product:

SELECT Product, AVG(Units_Sold) AS Average_Units_Sold
FROM Financial_data
GROUP BY Product;


-- Yearly Sales Trend:

SELECT Year, SUM(Sales) AS Total_Sales
FROM Financial_data
GROUP BY Year
ORDER BY Year;


-- Month-wise Sales Distribution:

SELECT Month_Name, SUM(Sales) AS Total_Sales
FROM Financial_data
GROUP BY Month_Name
ORDER BY Month_Name;


-- Highest Gross Sales in Each Country:

SELECT Country, MAX(Gross_Sales) AS Max_Gross_Sales
FROM Financial_data
GROUP BY Country;


-- Top 5 Products by Total Profit:

SELECT Product, SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 5;


-- Calculate Gross Margin for Each Product:

SELECT Product, (SUM(Gross_Sales) - SUM(COGS)) / SUM(Gross_Sales) AS Gross_Margin
FROM Financial_data
GROUP BY Product;


-- Quarterly Sales by Segment:

SELECT Segment, 
       CASE 
           WHEN Month_Number IN (1, 2, 3) THEN 'Q1'
           WHEN Month_Number IN (4, 5, 6) THEN 'Q2'
           WHEN Month_Number IN (7, 8, 9) THEN 'Q3'
           ELSE 'Q4'
       END AS Quarter,
       SUM(Sales) AS Total_Sales
FROM Financial_data
GROUP BY Segment, Quarter;


-- Total Units Sold by Country:

SELECT Country, SUM(Units_Sold) AS Total_Units_Sold
FROM Financial_data
GROUP BY Country;


-- Profit Contribution by Product Type:

SELECT Product, (SUM(Profit) / (SELECT SUM(Profit) FROM Financial_data)) * 100 AS Profit_Contribution_Percentage
FROM Financial_data
GROUP BY Product;


-- Sales Performance Comparison Between Years:

SELECT Year, SUM(Sales) AS Total_Sales
FROM Financial_data
GROUP BY Year
ORDER BY Year;


-- Identify Months with the Highest Discounts:

SELECT Month_Name, SUM(Discounts) AS Total_Discounts
FROM Financial_data
GROUP BY Month_Name
ORDER BY Total_Discounts DESC;


-- Average Manufacturing Price by Segment:

SELECT Segment, AVG(Manufacturing_Price) AS Avg_Manufacturing_Price
FROM Financial_data
GROUP BY Segment;


-- Sales Growth Rate by Year:

SELECT Year, 
       (SUM(Sales) - LAG(SUM(Sales)) OVER (ORDER BY Year)) / LAG(SUM(Sales)) OVER (ORDER BY Year) AS Growth_Rate
FROM Financial_data
GROUP BY Year;


-- Segment-Wise Profitability Index:

SELECT Segment, (SUM(Profit) / SUM(COGS)) AS Profitability_Index
FROM Financial_data
GROUP BY Segment;


-- Country-wise Sales Distribution:

SELECT Country, SUM(Sales) AS Total_Sales
FROM Financial_data
GROUP BY Country
ORDER BY Total_Sales DESC;


-- Product Performance Over Time:

SELECT Product, Year, SUM(Sales) AS Total_Sales
FROM Financial_data
GROUP BY Product, Year
ORDER BY Product, Year;


-- Average Profit Margin by Country:

SELECT Country, AVG((Profit / Sales) * 100) AS Avg_Profit_Margin
FROM Financial_data
GROUP BY Country;


-- Seasonal Sales Analysis:

SELECT 
       CASE 
           WHEN Month_Number IN (12, 1, 2) THEN 'Winter'
           WHEN Month_Number IN (3, 4, 5) THEN 'Spring'
           WHEN Month_Number IN (6, 7, 8) THEN 'Summer'
           ELSE 'Fall'
       END AS Season,
       SUM(Sales) AS Total_Sales
FROM Financial_data
GROUP BY Season;


-- Highest Profit Generating Countries:

SELECT Country, SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Country
ORDER BY Total_Profit DESC
LIMIT 5;


-- Year-on-Year Growth for Each Product:

SELECT Product, Year, 
       (SUM(Sales) - LAG(SUM(Sales)) OVER (PARTITION BY Product ORDER BY Year)) / LAG(SUM(Sales)) OVER (PARTITION BY Product ORDER BY Year) AS Yearly_Growth
FROM Financial_data
GROUP BY Product, Year;


-- Monthly Profit Analysis:

SELECT Month_Name, SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Month_Name
ORDER BY Month_Name;


-- Identify the Most Profitable Product in Each Segment:

SELECT Segment, Product, MAX(Profit) AS Max_Profit
FROM Financial_data
GROUP BY Segment, Product
ORDER BY Max_Profit DESC;


-- Total COGS by Year:

SELECT Year, SUM(COGS) AS Total_COGS
FROM Financial_data
GROUP BY Year
ORDER BY Year;


-- Country-wise Units Sold Distribution:

SELECT Country, SUM(Units_Sold) AS Total_Units_Sold
FROM Financial_data
GROUP BY Country;


-- Impact of Discounts on Sales:

SELECT Discount_Band, SUM(Sales) AS Total_Sales
FROM Financial_data
GROUP BY Discount_Band
ORDER BY Total_Sales DESC;


-- Analyze Profit Trends by Product:

SELECT Product, Year, SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Product, Year
ORDER BY Product, Year;


-- Segment-Wise Sales Contribution:

SELECT Segment, (SUM(Sales) / (SELECT SUM(Sales) FROM Financial_data)) * 100 AS Sales_Contribution_Percentage
FROM Financial_data
GROUP BY Segment;


-- Yearly Profit Margins:

SELECT Year, AVG((Profit / Sales) * 100) AS Avg_Profit_Margin
FROM Financial_data
GROUP BY Year;


-- Identify the Most Sold Product:

SELECT Product, SUM(Units_Sold) AS Total_Units_Sold
FROM Financial_data
GROUP BY Product
ORDER BY Total_Units_Sold DESC
LIMIT 1;


-- Sales Variance by Month:

SELECT Month_Name, VARIANCE(Sales) AS Sales_Variance
FROM Financial_data
GROUP BY Month_Name
ORDER BY Month_Name;


-- Top 3 Countries by Total Gross Sales:

SELECT Country, SUM(Gross_Sales) AS Total_Gross_Sales
FROM Financial_data
GROUP BY Country
ORDER BY Total_Gross_Sales DESC
LIMIT 3;


-- Average Units Sold Per Segment:

SELECT Segment, AVG(Units_Sold) AS Avg_Units_Sold
FROM Financial_data
GROUP BY Segment;


-- Month-on-Month Sales Growth:

SELECT Year, Month_Name, 
       (SUM(Sales) - LAG(SUM(Sales)) OVER (ORDER BY Year, Month_Name)) / LAG(SUM(Sales)) OVER (ORDER BY Year, Month_Name) AS MoM_Growth
FROM Financial_data
GROUP BY Year, Month_Name
ORDER BY Year, Month_Name;


-- Identify the Lowest Profit Generating Product:

SELECT Product, SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Product
ORDER BY Total_Profit ASC
LIMIT 1;


-- Segment-Wise Discount Analysis:

SELECT Segment, SUM(Discounts) AS Total_Discounts
FROM Financial_data
GROUP BY Segment
ORDER BY Total_Discounts DESC;


-- Profit Distribution by Country:

SELECT Country, SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Country
ORDER BY Total_Profit DESC;


-- Product Sales Trend Over the Years:

SELECT Product, Year, SUM(Sales) AS Total_Sales
FROM Financial_data
GROUP BY Product, Year
ORDER BY Product, Year;


-- Calculate Average COGS per Product:

SELECT Product, AVG(COGS) AS Avg_COGS
FROM Financial_data
GROUP BY Product;


-- Quarterly Profit Analysis:

SELECT 
       CASE 
           WHEN Month_Number IN (1, 2, 3) THEN 'Q1'
           WHEN Month_Number IN (4, 5, 6) THEN 'Q2'
           WHEN Month_Number IN (7, 8, 9) THEN 'Q3'
           ELSE 'Q4'
       END AS Quarter,
       SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Quarter;


-- Identify the Most Profitable Segment:

SELECT Segment, SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Segment
ORDER BY Total_Profit DESC
LIMIT 1;


-- Country-Wise Gross Sales Contribution:

SELECT Country, (SUM(Gross_Sales) / (SELECT SUM(Gross_Sales) FROM Financial_data)) * 100 AS Gross_Sales_Contribution_Percentage
FROM Financial_data
GROUP BY Country;


-- Impact of Manufacturing Price on Profit:

SELECT Manufacturing_Price, SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Manufacturing_Price
ORDER BY Manufacturing_Price;


-- Monthly Units Sold Analysis:

SELECT Month_Name, SUM(Units_Sold) AS Total_Units_Sold
FROM Financial_data
GROUP BY Month_Name
ORDER BY Month_Name;


-- Yearly Discounts Analysis:

SELECT Year, SUM(Discounts) AS Total_Discounts
FROM Financial_data
GROUP BY Year
ORDER BY Year;


-- Top 3 Segments by Profit:

SELECT Segment, SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Segment
ORDER BY Total_Profit DESC
LIMIT 3;


-- Seasonal Profit Contribution:

SELECT 
       CASE 
           WHEN Month_Number IN (12, 1, 2) THEN 'Winter'
           WHEN Month_Number IN (3, 4, 5) THEN 'Spring'
           WHEN Month_Number IN (6, 7, 8) THEN 'Summer'
           ELSE 'Fall'
       END AS Season,
       SUM(Profit) AS Total_Profit
FROM Financial_data
GROUP BY Season;


-- Identify Products with Zero Discounts:

SELECT Product, COUNT(*) AS Count
FROM Financial_data
WHERE Discounts = 0
GROUP BY Product;


-- Calculate Profit Margin by Product:

SELECT Product, (SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin
FROM Financial_data
GROUP BY Product;


-- Yearly Profit Growth Rate:

SELECT Year, 
       (SUM(Profit) - LAG(SUM(Profit)) OVER (ORDER BY Year)) / LAG(SUM(Profit)) OVER (ORDER BY Year) AS Profit_Growth_Rate
FROM Financial_data
GROUP BY Year;