/* Question 1 - Top 5 Artists [Spotify SQL Interview Question]

Assume there are three Spotify tables containing information about the artists, songs, and music charts. Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times. From now on, we'll refer to this ranking number as "song appearances".

Output the top 5 artist names in ascending order along with their song appearances ranking (not the number of song appearances, but the rank of who has the most appearances). The order of the rank should take precedence.

For example, Ed Sheeran's songs appeared 5 times in Top 10 list of the global song rank table; this is the highest number of appearances, so he is ranked 1st. Bad Bunny's songs appeared in the list 4, so he comes in at a close 2nd.

Assumptions:

If two artists' songs have the same number of appearances, the artists should have the same rank.
The rank number should be continuous (1, 2, 2, 3, 4, 5) and not skipped (1, 2, 2, 4, 5).

https://datalemur.com/questions/top-fans-rank
*/

WITH song_count_cte AS (
SELECT 
    artist_name, COUNT(song_id) AS song_count
FROM
    global_song_rank gsr
        LEFT JOIN
    songs s USING (song_id)
        LEFT JOIN
    artists a USING (artist_id)
WHERE
    rank <= 10
GROUP BY 1
ORDER BY 2 DESC),

rank_cte AS (
SELECT 
	artist_name,
	DENSE_RANK() OVER(ORDER BY song_count DESC) AS artist_rank
FROM 
	song_count_cte)

SELECT 
    artist_name, artist_rank
FROM
    rank_cte
WHERE
    artist_rank <= 5


/* Question 2 - Signup Activation Rate [TikTok SQL Interview Question]
New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. Users may receive multiple text messages for account confirmation until they have confirmed their new account.

Write a query to find the activation rate of the users. Round the percentage to 2 decimal places.

Definitions:

emails table contain the information of user signup details.
texts table contains the users' activation information.
As of 29 Nov 2022, the term confirmation rate is changed to activation rate to reflect the nature of the new user activation process.

https://datalemur.com/questions/signup-confirmation-rate
*/

WITH email_text_join_cte AS (
SELECT
	e.email_id, 
    user_id, 
    signup_date, 
    signup_action
FROM
	emails e
		LEFT JOIN texts t ON e.email_id = t.email_id
	AND t.signup_action = 'Confirmed')


SELECT
	ROUND(SUM(CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END):: NUMERIC
	/
	COUNT(*)::NUMERIC, 2)
AS confirm_rate
FROM 
	email_text_join_cte