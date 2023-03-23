/* Question 1 - Tweets' Rolling Averages [Twitter SQL Interview Question]

The table below contains information about tweets over a given period of time. Calculate the 3-day rolling average of tweets published by each user for each date that a tweet was posted. Output the user id, tweet date, and rolling averages rounded to 2 decimal places.

Important Assumptions:

Rows in this table are consecutive and ordered by date.
Each row represents a different day
A day that does not correspond to a row in this table is not counted. The most recent day is the next row above the current row.
Note: Rolling average is a metric that helps us analyze data points by creating a series of averages based on different subsets of a dataset. It is also known as a moving average, running average, moving mean, or rolling mean.

https://datalemur.com/questions/rolling-average-tweets
*/

SELECT 
    user_id, tweet_date, 
    ROUND(AVG(COUNT(DISTINCT tweet_id)) OVER (PARTITION BY user_id ORDER BY user_id, tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_avg_3d
FROM
    tweets
GROUP BY 1 , 2;



/* Question 2 - Cities With Completed Trades [Robinhood SQL Interview Question]

You are given the tables below containing information on Robinhood trades and users. Write a query to list the top three cities that have the most completed trade orders in descending order.

Output the city and number of orders.

https://datalemur.com/questions/completed-trades
*/

SELECT 
	CITY, 
    count(*) AS total_orders
FROM 
	users u
	LEFT JOIN trades t ON u.user_id = t.user_id
	AND t.status = 'Completed'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3

