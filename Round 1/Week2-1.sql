/*
Question 1 - Workers With The Highest Salaries

Find the titles of workers that earn the highest salary. Output the highest-paid title or multiple titles that share the highest salary.

https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?code_type=3
*/

SELECT 
    worker_title AS 'best_paid_title'
FROM
    title t
        LEFT JOIN
    worker w ON t.worker_ref_id = w.worker_id
WHERE
    salary = (SELECT 
            MAX(salary)
        FROM
            worker);


/* Question 2 - 
Number Of Units Per Nationality

Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.
*/

WITH unique_host_under30 AS (SELECT DISTINCT
    host_id, nationality
FROM
    airbnb_hosts
WHERE
    age < 30)

SELECT 
    nationality, COUNT(*) AS 'apartment_count'
FROM
    unique_host_under30 uh
        LEFT JOIN
    airbnb_units u USING (host_id)
WHERE
    LOWER(unit_type) = 'apartment'
GROUP BY 1;

/* Question 3 - Find the top 10 ranked songs in 2010

What were the top 10 ranked songs in 2010?
Output the rank, group name, and song name but do not show the same song twice.
Sort the result based on the year_rank in ascending order.
*/

SELECT DISTINCT
    year_rank, group_name, song_name
FROM
    billboard_top_100_year_end
WHERE
    year = 2010 AND year_rank <= 10
ORDER BY year_rank;