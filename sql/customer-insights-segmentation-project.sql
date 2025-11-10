-- [1] Analyzing which customer segments generate the most profit and sales.

SELECT Segment, ROUND(SUM(Profit), 2) AS 'Total Profit', -- This query sums up total Profit 
ROUND((SUM(Profit) / (SELECT SUM(Profit) FROM projects.superstore) * 100),2) AS 'Percentage of Profit', -- It also calculates each segment’s percentage contribution to the overall Profit.
ROUND(SUM(Sales), 2) AS 'Total Sales', -- And Sales for each Segment.
ROUND((SUM(Sales) / (SELECT SUM(Sales) FROM projects.superstore) * 100),2) AS 'Percentage of Sales' -- It also calculates each segment’s percentage contribution to the overall Sales.
FROM projects.superstore
GROUP BY Segment
ORDER BY 'Total Sales', 'Total Profit'; -- Finally, the results are ordered by Total Sales and Total Profit to identify the top-performing segments.

-- [2] Who are the top 10 customers contributing most to revenue?

SELECT `Customer Name`, ROUND(SUM(Sales), 2) AS `Total Revenue` -- Select the customer name and calculate their total revenue using the sum of sales.
-- , ROUND(SUM(Sales) / (SELECT SUM(SALES) FROM projects.superstore) * 100, 2) AS `% of Total Revenue` -- Optionally, compute each customer's percentage contribution to overall sales.
FROM projects.superstore
GROUP BY `Customer Name`
ORDER BY `Total Revenue` DESC
LIMIT 10; -- Limit results to the top 10 highest-spending customers.

-- [3] What's the average profit margin and discount by segment or region?

SELECT Segment, ROUND(AVG(Profit/Sales * 100), 2) AS `Average Profit Margin %`,
ROUND(AVG(Discount * 100), 2) AS `Average Discount %` -- Multiplied discount by 100 because it's a percentage.
FROM projects.superstore
GROUP BY Segment
ORDER BY `Average Profit Margin %` DESC;

-- [4] How many unique customers did we serve per month or quarter?

SELECT DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m%d%Y'), '%Y-%m') AS `Month`, -- Format the Date because it was formatted as STR.
COUNT(DISTINCT(`Customer Name`)) AS `Unique Customers` -- Count each Unique customer by month.
FROM projects.superstore
GROUP BY `Month`
ORDER BY `Month` ASC; -- Ordered by oldest year to most recent, and first to last month of each year.

-- [5] Do customers in some regions or segments buy more frequently or in larger quantities?

SELECT Region, Segment, COUNT(`Order ID`) AS `Amount of Orders` -- Select the amount of orders per Region and Segment
FROM projects.superstore
GROUP BY Region, Segment
ORDER BY `Amount of Orders` DESC;
