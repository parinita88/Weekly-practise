/* Question 1 

How can you produce a list of facilities that charge a fee to members?

https://pgexercises.com/questions/basic/where.html
*/
SELECT 
    facid,
    name,
    membercost,
    guestcost,
    initialoutlay,
    monthlymaintenance
FROM
    cd.facilities
WHERE
    membercost > 0
ORDER BY 1;

/* Question 2

How can you produce a list of all facilities with the word 'Tennis' in their name?

https://pgexercises.com/questions/basic/where3.html
*/
SELECT 
    facid,
    name,
    membercost,
    guestcost,
    initialoutlay,
    monthlymaintenance
FROM
    cd.facilities
WHERE
    LOWER(name) LIKE '%tennis%';
    
/* Question 3

How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

https://pgexercises.com/questions/basic/where4.html
*/
SELECT 
    facid,
    name,
    membercost,
    guestcost,
    initialoutlay,
    monthlymaintenance
FROM
    cd.facilities
WHERE
    facid IN (1 , 5);

/* Question 4

Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD.
Output all details related to retrieved records.

https://platform.stratascratch.com/coding/10003-lyft-driver-wages?code_type=1
*/
SELECT 
    *
FROM
    lyft_drivers
WHERE
    yearly_salary <= 30000
        OR yearly_salary >= 70000;
        

/* Question 5
Count the number of movies that Abigail Breslin nominated for oscar

https://platform.stratascratch.com/coding/10128-count-the-number-of-movies-that-abigail-breslin-nominated-for-oscar?code_type=1
*/
SELECT 
    COUNT(*)
FROM
    oscar_nominees
WHERE
    LOWER(nominee) LIKE '%abigail breslin%';
