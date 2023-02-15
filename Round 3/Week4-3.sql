/* Question 1 - List each member's first booking after September 1st 2012

Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.

https://pgexercises.com/questions/aggregates/nbooking.html
*/

SELECT 
    surname, firstname, memid, MIN(starttime)
FROM
    cd.bookings
        LEFT JOIN
    cd.members USING (memid)
WHERE
    starttime > '2012-09-01 00:00:00'
GROUP BY 1 , 2 , 3
ORDER BY 3;
