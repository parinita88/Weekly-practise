/* Question 1 - Pharmacy Analytics (Part 1) [CVS Health SQL Interview Question]

CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.

Write a query to find the top 3 most profitable drugs sold, and how much profit they made. Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.

Definition:

cogs stands for Cost of Goods Sold which is the direct cost associated with producing the drug.
Total Profit = Total Sales - Cost of Goods Sold

https://datalemur.com/questions/top-profitable-drugs
*/

SELECT 
	drug, 
    total_sales - cogs AS total_profit 
FROM 
	pharmacy_sales
ORDER BY 2 DESC
LIMIT 3;

/* QUESTION 2 - Pharmacy Analytics (Part 2) [CVS Health SQL Interview Question]

CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.

Write a query to find out which manufacturer is associated with the drugs that were not profitable and how much money CVS lost on these drugs. 

Output the manufacturer, number of drugs and total losses. Total losses should be in absolute value. Display the results with the highest losses on top.

https://datalemur.com/questions/non-profitable-drugs
*/

SELECT 
	manufacturer, 
    count(*) AS drug_count, 
    sum(cogs) - sum(total_sales) AS total_loss
FROM 
	pharmacy_sales
WHERE 
	cogs > total_sales
GROUP BY 1 
ORDER BY 3 DESC;


