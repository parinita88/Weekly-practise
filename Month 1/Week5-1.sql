/* Question 1 - Count the number of expensive facilities

Produce a count of the number of facilities that have a cost to guests of 10 or more.

https://pgexercises.com/questions/aggregates/count2.html
*/

SELECT 
    COUNT(*)
FROM
    cd.facilities
WHERE
    guestcost >= 10;
    
/* Question 2 - working with dates
Produce a count of the number of recommendations each member has made. Order by member ID.

https://pgexercises.com/questions/aggregates/count3.html
*/

SELECT 
    recommendedby, COUNT(*)
FROM
    cd.members
WHERE
    recommendedby IS NOT NULL
GROUP BY 1
ORDER BY 1;

/* Question 3 - List facilities with more than 1000 slots booked
Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and slots, sorted by facility id.

https://pgexercises.com/questions/aggregates/fachours1a.html
*/

SELECT 
    facid, SUM(slots) AS "Total Slots"
FROM
    cd.bookings
GROUP BY 1
HAVING SUM(slots) > 1000
ORDER BY 1;
