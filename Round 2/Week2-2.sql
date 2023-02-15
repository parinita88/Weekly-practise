-- Using postgreSQL 
/* Question 1 - List the teachers who have NULL for their department.

https://sqlzoo.net/wiki/Using_Null
*/

SELECT 
    name
FROM
    teacher
WHERE
    dept IS NULL;
    

/* Question 2 - Subtract timestamps from each other

Find the result of subtracting the timestamp '2012-07-30 01:00:00' from the timestamp '2012-08-31 01:00:00'

https://pgexercises.com/questions/date/interval.html
*/
SELECT 
	timestamptz '2012-08-31 01:00:00' - timestamptz '2012-07-30 01:00:00' AS INTERVAL;
    
/* Question 3 - Return a count of bookings for each month

Return a count of bookings for each month, sorted by month

https://pgexercises.com/questions/date/bookingspermonth.html
*/
SELECT 
    DATE_TRUNC('month', starttime), COUNT(*)
FROM
    cd.bookings
GROUP BY 1
ORDER BY 1