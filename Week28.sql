# Data Lemur
/* Question 1

Sending vs. Opening Snaps [Snapchat SQL Interview Question]

Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps. Write a query to obtain a breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.

Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.

Notes:

You should calculate these percentages:
time sending / (time sending + time opening)
time opening / (time sending + time opening)
To avoid integer division in percentages, multiply by 100.0 and not 100.

https://datalemur.com/questions/time-spent-snaps
*/

WITH user_time AS
(
SELECT 
    user_id,
    SUM(CASE
        WHEN activity_type = 'send' THEN time_spent
        ELSE 0
    END) AS time_sent,
    SUM(CASE
        WHEN activity_type = 'open' THEN time_spent
        ELSE 0
    END) AS time_open,
    SUM(CASE
        WHEN activity_type = 'chat' THEN 0
        ELSE time_spent
    END) AS time_total
FROM
    activities
GROUP BY 1
)


SELECT 
    age_bucket,
    ROUND((SUM(time_sent) / SUM(time_total)) * 100.0,
            2) AS send_perc,
    ROUND((SUM(time_open) / SUM(time_total)) * 100.0,
            2) AS open_perc
FROM
    user_time
        LEFT JOIN
    age_breakdown USING (user_id)
GROUP BY 1;


/* Question 2 - Page With No Likes [Facebook SQL Interview Question]

Assume you are given the tables below about Facebook pages and page likes. Write a query to return the page IDs of all the Facebook pages that don't have any likes. The output should be in ascending order.

https://datalemur.com/questions/sql-page-with-no-likes
*/

SELECT 
    page_id
FROM
    pages
WHERE
    page_id NOT IN (SELECT DISTINCT
            page_id
        FROM
            page_likes);