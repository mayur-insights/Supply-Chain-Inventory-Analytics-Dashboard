CREATE DATABASE supply_chain;
USE supply_chain;



SELECT COUNT(*) 
FROM mytable;
SELECT *
FROM mytable
LIMIT 10;
#Total Orders
SELECT 
CASE 
    WHEN COUNT(DISTINCT Order_ID) >= 1000000000 
        THEN CONCAT(ROUND(COUNT(DISTINCT Order_ID)/1000000000,0),'B')
    WHEN COUNT(DISTINCT Order_ID) >= 1000000 
        THEN CONCAT(ROUND(COUNT(DISTINCT Order_ID)/1000000,0),'M')
    WHEN COUNT(DISTINCT Order_ID) >= 1000 
        THEN CONCAT(ROUND(COUNT(DISTINCT Order_ID)/1000,0),'K')
    ELSE COUNT(DISTINCT Order_ID)
END AS Total_Orders
FROM mytable;
#Total Sales Revenue
SELECT 
CASE 
    WHEN SUM(Quantity * Unit_Price) >= 1000000000 
        THEN CONCAT(ROUND(SUM(Quantity * Unit_Price)/1000000000,0),'B')
    WHEN SUM(Quantity * Unit_Price) >= 1000000 
        THEN CONCAT(ROUND(SUM(Quantity * Unit_Price)/1000000,0),'M')
    WHEN SUM(Quantity * Unit_Price) >= 1000 
        THEN CONCAT(ROUND(SUM(Quantity * Unit_Price)/1000,0),'K')
    ELSE ROUND(SUM(Quantity * Unit_Price),0)
END AS Total_Sales_Revenue
FROM mytable;
#Total Supply Chain Cost
SELECT 
CASE 
    WHEN SUM(Total_Cost) >= 1000000000 
        THEN CONCAT(ROUND(SUM(Total_Cost)/1000000000,0),'B')
    WHEN SUM(Total_Cost) >= 1000000 
        THEN CONCAT(ROUND(SUM(Total_Cost)/1000000,0),'M')
    WHEN SUM(Total_Cost) >= 1000 
        THEN CONCAT(ROUND(SUM(Total_Cost)/1000,0),'K')
    ELSE ROUND(SUM(Total_Cost),0)
END AS Total_Supply_Chain_Cost
FROM mytable;

#Total Supply Chain Cost
SELECT 
CASE 
    WHEN SUM(Total_Cost) >= 1000000000 
        THEN CONCAT(ROUND(SUM(Total_Cost)/1000000000,0),'B')
    WHEN SUM(Total_Cost) >= 1000000 
        THEN CONCAT(ROUND(SUM(Total_Cost)/1000000,0),'M')
    WHEN SUM(Total_Cost) >= 1000 
        THEN CONCAT(ROUND(SUM(Total_Cost)/1000,0),'K')
    ELSE ROUND(SUM(Total_Cost),0)
END AS Total_Supply_Chain_Cost
FROM mytable;
#On-Time Delivery %
SELECT 
ROUND(
SUM(CASE 
WHEN Delivery_Status = 'On-Time' THEN 1 
ELSE 0 END) * 100 / COUNT(*)
,0) AS On_Time_Delivery_Percentage
FROM mytable;
#Average Delay (Days)
SELECT 
ROUND(AVG(Delay_Days),0) AS Average_Delay_Days
FROM mytable;
#Transportation Cost per Order
SELECT 
CONCAT('$',
ROUND(SUM(Transportation_Cost) / COUNT(DISTINCT Order_ID),0)
) AS Transportation_Cost_Per_Order
FROM mytable;



