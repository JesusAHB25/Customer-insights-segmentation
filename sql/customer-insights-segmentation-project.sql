-- [1] Analyzing which customer segments generate the most profit and sales.

SELECT Segment, ROUND(SUM(Profit), 2) AS 'Total Profit', -- This query sums up total Profit 
ROUND((SUM(Profit) / (SELECT SUM(Profit) FROM projects.superstore) * 100),2) AS 'Percentage of Profit', -- It also calculates each segment’s percentage contribution to the overall Profit.
ROUND(SUM(Sales), 2) AS 'Total Sales', -- And Sales for each Segment.
ROUND((SUM(Sales) / (SELECT SUM(Sales) FROM projects.superstore) * 100),2) AS 'Percentage of Sales' -- It also calculates each segment’s percentage contribution to the overall Sales.
FROM projects.superstore
GROUP BY Segment
ORDER BY 'Total Sales', 'Total Profit'; -- Finally, the results are ordered by Total Sales and Total Profit to identify the top-performing segments.