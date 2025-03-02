1. Retrieve Total Sales, Profit, and Discount by Product
SELECT 
    p.Product_Name, 
    SUM(f.Units_Sold) AS Total_Units_Sold, 
    SUM(f.Total_Sales) AS Total_Sales, 
    SUM(f.Discount_Value) AS Total_Discount, 
    SUM(f.Profit) AS Total_Profit
FROM FactTable f
JOIN Products p ON f.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Sales DESC;

2. Find the Top 5 Best-Selling Cities by Revenue
SELECT 
    c.City, 
    SUM(f.Total_Sales) AS Total_Sales, 
    SUM(f.Profit) AS Total_Profit
FROM FactTable f
JOIN Customers c ON f.Customer_ID = c.Customer_ID
GROUP BY c.City
ORDER BY Total_Sales DESC
LIMIT 5;

3. Analyze the Impact of Promotions on Sales
SELECT 
    pr.Promotion_Name, 
    COUNT(f.Promotion_ID) AS Total_Transactions, 
    SUM(f.Total_Sales) AS Total_Sales, 
    SUM(f.Discount_Value) AS Total_Discount, 
    SUM(f.Profit) AS Total_Profit
FROM FactTable f
JOIN Promotions pr ON f.Promotion_ID = pr.Promotion_ID
GROUP BY pr.Promotion_Name
ORDER BY Total_Sales DESC;

4. Get Monthly Sales Trend Over Time
SELECT 
    DATE_FORMAT(f.Sale_Date, '%Y-%m') AS Sales_Month, 
    SUM(f.Total_Sales) AS Monthly_Sales, 
    SUM(f.Profit) AS Monthly_Profit
FROM FactTable f
GROUP BY Sales_Month
ORDER BY Sales_Month;

5. Identify High-Profit Product Categories
SELECT 
    p.Category, 
    SUM(f.Total_Sales) AS Total_Sales, 
    SUM(f.Profit) AS Total_Profit, 
    (SUM(f.Profit) / SUM(f.Total_Sales)) * 100 AS Profit_Margin_Percentage
FROM FactTable f
JOIN Products p ON f.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Profit DESC;

