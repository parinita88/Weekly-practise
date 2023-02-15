/* Question 1 - Format the names of members 

Output the names of all members, formatted as 'Surname, Firstname'

https://pgexercises.com/questions/string/concat.html
*/
SELECT 
    CONCAT(surname, ', ', firstname)
FROM
    cd.members;
    
/* Question 2 - Clean up telephone numbers

The telephone numbers in the database are very inconsistently formatted. You'd like to print a list of member ids and numbers that have had '-','(',')', and ' ' characters removed. Order by member id.

https://pgexercises.com/questions/string/translate.html
*/

SELECT 
    memid, TRANSLATE(telephone, '-()', '')
FROM
    cd.members
ORDER BY 1;