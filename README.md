# 🛒 E-Commerce Sales Data Analysis Using Power BI

**Author:** Rahul Das Dasari  
**Tech Stack:** Power BI, SQL, Excel, Data Modeling  

## 📖 Project Overview  
This project is an **E-Commerce Sales Data Analysis Dashboard** built using **Power BI**. It provides insights into **sales trends, customer purchasing patterns, promotional effectiveness, and profitability analysis**.

### 🔍 Objective:  
- To analyze **sales trends, customer insights, and promotional impacts**.  
- To identify **top-performing and underperforming products, cities, and promotions**.  
- To generate **actionable recommendations to improve sales and profitability**.  

---

## 📊 Data Source & Model Structure  
The dataset was sourced from **Kaggle** and consists of three main tables:  

1. **Customers Table**  
   - Customer ID, Name, City, Country, Age Group, Gender  

2. **Products Table**  
   - Product ID, Product Name, Category, Price  

3. **Promotions Table**  
   - Promotion ID, Promotion Name, Discount %  

4. **Fact Table (Created using Data Transformation in Power BI)**  
   - Customer ID, Promotion ID, Product ID  
   - **Units Sold, Price Per Unit, Total Sales**  
   - **Discount Percentage, Discount Value, Net Sales, Profit**  

### 🔗 Data Model Relationships  
- **One-to-Many Relationships Established:**  
  - Customers → Fact Table (Customer ID)  
  - Products → Fact Table (Product ID)  
  - Promotions → Fact Table (Promotion ID)  

---

## 📈 Key Insights & Visualizations  

### 1️⃣ Top & Bottom 5 Products Analysis  
- **Top 5 Products (By Sales & Profit):**  
  ✅ Sony Bravia 55" TV, Apple MacBook Air, Samsung Galaxy S21, Apple iPhone 14, HP Pavilion Laptop.  
- **Bottom 5 Products (By Sales & Profit):**  
  ❌ Zara Casual Shirt, Dove Soap Pack, L'Oreal Shampoo, Colgate Toothpaste, Nivea Body Lotion.  

### 2️⃣ Sales Trend by Period  
- Sales **peaked in 2022**, showing seasonal trends in Q4 (likely due to holiday shopping).  
- A **dip in sales was observed in Q1 of 2023**, suggesting lower demand or reduced marketing efforts.

### 3️⃣ Promotions & Discounts Analysis  
- **Clearance Sales & Festive Diwali promotions** offered the **highest average discount values**, but some promotions led to **low profitability**.  
- Promotions helped in increasing sales **but impacted net profit negatively** in some cases.

### 4️⃣ Sales by City & Geographical Analysis  
- **Top-performing cities:** Bhopal, Kanpur, Indore, Lucknow, and Patna.  
- **Cities with low sales require localized marketing efforts and better product availability.**  

### 5️⃣ Profit vs. Net Sales Comparison  
- Despite high net sales, profit margins varied significantly across **product categories**.  
- Electronics had the highest sales, but categories like **personal care and kitchenware had lower profitability**.  

---

## 🔥 Key Suggestions to Improve Sales & Profitability  

### 📌 1. Optimize Promotions for Maximum Profitability  
✅ Focus on **targeted discounts** rather than **flat rate discounts** on all products.  
✅ Adjust **discounts on low-margin products** to prevent loss-making promotions.  
✅ Use **data-driven promotions** during high-demand seasons.

### 📌 2. Expand Sales in Low-Performing Cities  
✅ Increase marketing efforts in **low-sales cities** through **localized promotions & better product availability**.  
✅ Improve **logistics and delivery speed** in these regions.

### 📌 3. Price Adjustments for High-Demand Products  
✅ **Slightly increase** the prices of **high-demand products** that have strong customer demand but low profit margins.  
✅ Implement **bundle pricing strategies** to upsell related products.

### 📌 4. Optimize Inventory & Supply Chain for Fast-Moving Products  
✅ Ensure that **best-selling products remain in stock** to prevent missed sales opportunities.  
✅ **Monitor demand fluctuations** and adjust **inventory accordingly**.

### 📌 5. Improve Customer Retention with Loyalty Programs  
✅ Introduce **loyalty programs & personalized recommendations** for frequent buyers.  
✅ Provide **exclusive early access to sales** for returning customers.

### 📌 6. Leverage Seasonal Trends for Sales Growth  
✅ Launch **special promotions** during high-sales periods (Q4 & holiday seasons).  
✅ Offer **personalized discounts** to repeat customers **based on past purchases**.

---

## 🛠 Tools & Technologies Used  
✅ **Power BI** – Data Cleaning, Data Modeling, Dashboard Creation  
✅ **SQL** – Querying & Data Preprocessing  
✅ **Excel** – Initial Data Exploration  

---

## 📥 How to Use This Project  
1. Download the **Power BI .pbix file** from the repository.  
2. Open the file in **Power BI Desktop**.  
3. Explore **interactive dashboards** by using different filters.  

---

## 🔍 SQL Queries Used in This Project  

### 1️⃣ Retrieve Total Sales, Profit, and Discount by Product  
```sql
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
```  

### 2️⃣ Find the Top 5 Best-Selling Cities by Revenue  
```sql
SELECT 
    c.City, 
    SUM(f.Total_Sales) AS Total_Sales, 
    SUM(f.Profit) AS Total_Profit
FROM FactTable f
JOIN Customers c ON f.Customer_ID = c.Customer_ID
GROUP BY c.City
ORDER BY Total_Sales DESC
LIMIT 5;
```  

### 3️⃣ Analyze the Impact of Promotions on Sales  
```sql
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
```  

### 4️⃣ Get Monthly Sales Trend Over Time  
```sql
SELECT 
    DATE_FORMAT(f.Sale_Date, '%Y-%m') AS Sales_Month, 
    SUM(f.Total_Sales) AS Monthly_Sales, 
    SUM(f.Profit) AS Monthly_Profit
FROM FactTable f
GROUP BY Sales_Month
ORDER BY Sales_Month;
```  

### 5️⃣ Identify High-Profit Product Categories  
```sql
SELECT 
    p.Category, 
    SUM(f.Total_Sales) AS Total_Sales, 
    SUM(f.Profit) AS Total_Profit, 
    (SUM(f.Profit) / SUM(f.Total_Sales)) * 100 AS Profit_Margin_Percentage
FROM FactTable f
JOIN Products p ON f.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Profit DESC;
```  



