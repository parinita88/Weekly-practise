/* Question 1 - Total Cost of Orders

Find the total cost of each customer's orders. Output customer's id, first name, and the total order cost. Order records by customer's first name alphabetically.

https://platform.stratascratch.com/coding/10183-total-cost-of-orders?code_type=3
*/
SELECT 
    c.id, first_name, SUM(total_order_cost)
FROM
    customers c
        LEFT JOIN
    orders o ON c.id = o.cust_id
GROUP BY 1 , 2
ORDER BY 1;

/* Question 2 - Cities with most expensive homes

Write a query that identifies cities with higher than average home prices when compared to the national average. Output the city names.

https://platform.stratascratch.com/coding/10315-cities-with-the-most-expensive-homes?code_type=1
*/
SELECT DISTINCT
    city
FROM
    zillow_transactions
WHERE
    mkt_price > (SELECT 
            AVG(mkt_price)
        FROM
            zillow_transactions);

/* Question 3 - Reviews of Hotel Aerna 

Find the number of rows for each review score earned by 'Hotel Arena'. Output the hotel name (which should be 'Hotel Arena'), review score along with the corresponding number of rows with that score for the specified hotel.

https://platform.stratascratch.com/coding/10166-reviews-of-hotel-arena?code_type=1
*/

SELECT 
    hotel_name, reviewer_score, COUNT(*)
FROM
    hotel_reviews
WHERE
    hotel_name = 'Hotel Arena'
GROUP BY 1 , 2;