/* Show the athelete (who) and the country name for medal winners in 2000. */
SELECT who, country.name
FROM ttms 
JOIN country ON (ttms.country=country.id)
WHERE games = 2000

/* Show the who and the color of the medal for the medal winners from 'Sweden'. */
SELECT ttms.who, ttms.color
FROM ttms
JOIN country ON ttms.country = country.id
WHERE name = 'Sweden'

/* Show the years in which 'China' won a 'gold' medal. */
SELECT games
FROM ttms
JOIN country ON ttms.country = country.id
WHERE name = 'China' and color = 'gold'

/* Show who won medals in the 'Barcelona' games. */
SELECT who
FROM ttws 
JOIN games ON (ttws.games=games.yr)
WHERE city = 'Barcelona'

/* Show which city 'Jing Chen' won medals. Show the city and the medal color. */
SELECT games.city, ttws.color
FROM ttws
JOIN games ON (ttws.games=games.yr)
WHERE who LIKE 'Jing%'

/* Show who won the gold medal and the city. */
SELECT ttws.who, games.city
FROM ttws
JOIN games ON (ttws.games=games.yr)
WHERE color = 'gold'

/* Show the games and color of the medal won by the team that includes 'Yan Sen'. */
SELECT ttmd.games, ttmd.color
FROM ttmd
JOIN team ON (ttmd.team=team.id)
WHERE team.name LIKE 'Yan%'

/* Show the 'gold' medal winners in 2004. */
SELECT team.name
FROM team
JOIN ttmd ON (team.id = ttmd.team)
WHERE color = 'gold' AND games = 2004

/* Show the name of each medal winner country 'FRA'. */
SELECT team.name
FROM team
JOIN ttmd ON (team.id = ttmd.team)
WHERE country = 'FRA'