-- Using postgresSQL --
/* Quesion 1 - Produce a list of costly bookings 

How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member formatted as a single column, and the cost. Order by descending cost, and do not use any subqueries.

https://pgexercises.com/questions/joins/threejoin2.html
*/

SELECT 
    (CASE
        WHEN b.memid = 0 THEN 'GUEST GUEST'
        ELSE CONCAT(firstname, ' ', surname)
    END) AS member,
    name,
    (CASE
        WHEN b.memid = 0 THEN guestcost * slots
        ELSE membercost * slots
    END) AS cost
FROM
    cd.bookings b
        LEFT JOIN
    cd.facilities USING (facid)
        LEFT JOIN
    cd.members USING (memid)
WHERE
	DATE_TRUNC('day', starttime :: DATE) = '2012-09-14' 
    AND
    (CASE
        WHEN b.memid = 0 THEN guestcost * slots
        ELSE membercost * slots
    END) > 30
ORDER BY 3 DESC; 

/* Question 2 - List the total slots booked per facility in a given month

Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.

https://pgexercises.com/questions/aggregates/fachoursbymonth.html
*/
SELECT facid, 
       SUM(slots) 
FROM   cd.bookings 
WHERE  DATE_TRUNC('month', starttime :: DATE) = '2012-09-01' 
GROUP  BY 1 
ORDER  BY 2; 

/* Question 3 - Produce a list of all members who have used a tennis court 

How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted as a single column. Ensure no duplicate data, and order by the member name followed by the facility name.

https://pgexercises.com/questions/joins/threejoin.html
*/

SELECT DISTINCT
    CONCAT(firstname, ' ', surname) AS member, NAME AS facility
FROM
    cd.members
        LEFT JOIN
    cd.bookings USING (memid)
        LEFT JOIN
    cd.facilities USING (facid)
WHERE
    LOWER(NAME) LIKE '%tennis court%'
ORDER BY 1 , 2