/* Question 1 - Find the total revenue of each facility

Produce a list of facilities along with their total revenue. The output table should consist of facility name and revenue, sorted by revenue. Remember that there's a different cost for guests and members!

https://pgexercises.com/questions/aggregates/facrev.html
*/

SELECT 
    name,
    (SUM(CASE
        WHEN memid = 0 THEN 0
        ELSE slots
    END) * membercost + SUM(CASE
        WHEN memid != 0 THEN 0
        ELSE slots
    END) * guestcost) AS revenue
FROM
    cd.bookings
        JOIN
    cd.facilities USING (facid)
GROUP BY 1 , membercost , guestcost
ORDER BY 2;