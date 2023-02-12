/* Question 1 - Classify results into buckets
How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost is more than $100? Return the name and monthly maintenance of the facilities in question.

https://pgexercises.com/questions/basic/classify.html
*/

SELECT 
    name,
    (CASE
        WHEN monthlymaintenance > 100 THEN 'expensive'
        ELSE 'cheap'
    END) AS cost
FROM
    cd.facilities;
    
/* Question 2 - working with dates
How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.

https://pgexercises.com/questions/basic/date.html
*/

SELECT 
    memid, surname, firstname, joindate
FROM
    cd.members
WHERE
    DATE_DIFF('days', joindate, '2012-09-01') >= 0;

/* Question 3 - Retrieve the start times of members' bookings
How can you produce a list of the start times for bookings by members named 'David Farrell'?

https://pgexercises.com/questions/joins/simplejoin.html
*/

SELECT 
    starttime
FROM
    cd.members
        JOIN
    cd.bookings USING (memid)
WHERE
    CONCAT(firstname, ' ', surname) = 'David Farrell';
