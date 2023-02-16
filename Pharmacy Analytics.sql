/* Question 1 - Top Proftable Drug

CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.

Write a query to find the top 3 most profitable drugs sold, and how much profit they made. Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.

Definition:

cogs stands for Cost of Goods Sold which is the direct cost associated with producing the drug.
Total Profit = Total Sales - Cost of Goods Sold

https://datalemur.com/questions/top-profitable-drugs

*/

SELECT 
    drug, total_sales - cogs AS total_profit
FROM
    pharmacy_sales
ORDER BY 2 DESC
LIMIT 3;

/* Question 2 - Non Proftable Drugs
Write a query to find out which manufacturer is associated with the drugs that were not profitable and how much money CVS lost on these drugs. 

Output the manufacturer, number of drugs and total losses. Total losses should be in absolute value. Display the results with the highest losses on top.

https://datalemur.com/questions/non-profitable-drugs
*/
SELECT 
    manufacturer,
    COUNT(*) AS drug_count,
    SUM(cogs) - SUM(total_sales) AS total_loss
FROM
    pharmacy_sales
WHERE
    cogs > total_sales
GROUP BY 1
ORDER BY 3 DESC;

/* Question 3 - Total Drug Sales
Write a query to find the total sales of drugs for each manufacturer. Round your answer to the closest million, and report your results in descending order of total sales.

Because this data is being directly fed into a dashboard which is being seen by business stakeholders, format your result like this: "$36 million".

https://datalemur.com/questions/total-drugs-sales
*/
SELECT 
    manufacturer,
    CONCAT('$',
            CAST(ROUND(SUM(total_sales) / 1000000, 0) AS TEXT),
            ' million') AS sale
FROM
    pharmacy_sales
GROUP BY 1
ORDER BY SUM(total_sales) DESC;