/* Question 1 - More Aggregation

You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?

https://pgexercises.com/questions/basic/agg2.html
*/
SELECT 
    firstname, surname, joindate
FROM
    cd.members
WHERE
    joindate = (SELECT 
            MAX(joindate)
        FROM
            cd.members);
            
/* Question 2 - Produce a list of all members, along with their recommender

How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).

https://pgexercises.com/questions/joins/self2.html
*/
SELECT 
    mem.firstname AS memfname,
    mem.surname AS memsname,
    rec.firstname AS recfname,
    rec.surname AS recsname
FROM
    cd.members mem
        LEFT JOIN
    cd.members rec ON mem.recommendedby = rec.memid
ORDER BY 2 , 1;


