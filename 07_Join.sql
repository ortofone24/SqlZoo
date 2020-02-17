/* Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER' */
SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER'

/* Show id, stadium, team1, team2 for just game 1012 */
SELECT DISTINCT(id),stadium,team1,team2
FROM game
WHERE id = 1012

/* Modify it to show the player, teamid, stadium and mdate for every German goal. */
SELECT player, teamid, stadium, mdate
FROM game 
JOIN goal ON (id = matchid)
WHERE teamid = 'GER'

/* Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%' */
SELECT team1, team2, player
FROM game 
JOIN goal ON (id = matchid)
WHERE player LIKE 'Mario%'

/* Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10 */
SELECT player, teamid, coach, gtime
FROM eteam
JOIN goal ON id = teamid
WHERE gtime <= 10

/* List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach. */
SELECT mdate, teamname
FROM game
JOIN eteam ON team1 = eteam.id
WHERE coach = 'Fernando Santos'

/* List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw' */
SELECT player
FROM goal
JOIN game ON matchid=id
WHERE stadium LIKE '%Warsaw'

/* Show the name of all players who scored a goal against Germany. */
SELECT DISTINCT(player)
FROM game
JOIN goal ON matchid = id 
WHERE (team1='GER' OR team2='GER') AND (teamid != 'GER')

/* Show teamname and the total number of goals scored. */
SELECT teamname, COUNT(teamid)
FROM eteam 
JOIN goal ON id = teamid
GROUP BY teamname

/* For every match involving 'POL', show the matchid, date and the number of goals scored. */
SELECT matchid,mdate, COUNT(teamid)
FROM game 
JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid

/* For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER' */
SELECT matchid,mdate, COUNT(*)
FROM game 
JOIN goal ON matchid = id 
WHERE  teamid = 'GER'
GROUP BY matchid

/* List every match with the goals scored by each team as shown. */
SELECT game.mdate, 
       game.team1, 
       SUM(CASE WHEN goal.teamid = game.team1
           THEN 1
           ELSE 0
           END) AS score1,
       game.team2,
       SUM(CASE WHEN goal.teamid = game.team2
           THEN 1
           ELSE 0
           END) AS score2
FROM game
JOIN goal ON (game.id = goal.matchid)
GROUP BY game.id
ORDER BY game.mdate, goal.matchid