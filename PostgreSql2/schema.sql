-- Requirement 1/3

-- 1. Find all movies released in 2019
SELECT title, release_year 
FROM movies 
WHERE release_year = 2019;

-- 2. Find all actors from 'British' nationality
SELECT actor_name, nationality 
FROM actors 
WHERE nationality = 'British';

-- 3. Find all movies with 'PG-13' rating
SELECT title, rating 
FROM movies 
WHERE rating = 'PG-13';

-- 4. Find all directors from 'American' nationality
SELECT director_name, nationality 
FROM directors 
WHERE nationality = 'American';

-- 5. Find all movies with duration more than 150 minutes
SELECT title, duration_minutes 
FROM movies 
WHERE duration_minutes > 150;

-- 6. Find all actors with last name 'Pitt'
SELECT actor_name 
FROM actors 
WHERE actor_name LIKE '%Pitt%';

-- 7. Find all movies with budget greater than 100 million
SELECT title, budget 
FROM movies 
WHERE budget > 100000000;

-- 8. Find all reviews with rating 5
SELECT review_id, movie_id, rating 
FROM reviews 
WHERE rating = 5;

-- 9. Find all movies in English language
SELECT title, language 
FROM movies 
WHERE language = 'English';

-- 10. Find all production companies from 'California'
SELECT company_name, location 
FROM production_companies 
WHERE location = 'California';

-- Requirement 2/3

-- 1. Show movies and their directors
SELECT m.title, d.director_name
FROM movies m
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON md.director_id = d.director_id;

-- 2. Show actors and their movies
SELECT a.actor_name, m.title
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id;

-- 3. Show movies and their genres
SELECT m.title, g.genre_name
FROM movies m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id;

-- 4. Show users and their reviews
SELECT u.username, m.title, r.rating, r.comment
FROM users u
JOIN reviews r ON u.user_id = r.user_id
JOIN movies m ON r.movie_id = m.movie_id;

-- 5. Show movies and their locations
SELECT m.title, l.location_name
FROM movies m
JOIN movie_locations ml ON m.movie_id = ml.movie_id
JOIN locations l ON ml.location_id = l.location_id;

-- 6. Show movies and their production companies
SELECT m.title, pc.company_name
FROM movies m
JOIN movie_production_companies mpc ON m.movie_id = mpc.movie_id
JOIN production_companies pc ON mpc.company_id = pc.company_id;

-- 7. Show actors and their awards
SELECT a.actor_name, aw.award_name, aw.year
FROM actors a
JOIN actor_awards aa ON a.actor_id = aa.actor_id
JOIN awards aw ON aa.award_id = aw.award_id;

-- 8. Show movies and their awards
SELECT m.title, aw.award_name, aw.year
FROM movies m
JOIN movie_awards ma ON m.movie_id = ma.movie_id
JOIN awards aw ON ma.award_id = aw.award_id;

-- 9. Show users and their watchlist movies
SELECT u.username, m.title, w.added_date
FROM users u
JOIN watchlists w ON u.user_id = w.user_id
JOIN movies m ON w.movie_id = m.movie_id;

-- 10. Show movies and their revenues
SELECT title, revenue 
FROM movies;

-- Requirement 3/3

-- 1. Show all R-rated movies and their directors
SELECT m.title, d.director_name
FROM movies m
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON md.director_id = d.director_id
WHERE m.rating = 'R';

-- 2. Show all movies from 2019 and their genres
SELECT m.title, g.genre_name
FROM movies m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
WHERE m.release_year = 2019;

-- 3. Show all American actors and their movies
SELECT a.actor_name, m.title
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
WHERE a.nationality = 'American';

-- 4. Show all movies with budget over 100M and their production companies
SELECT m.title, pc.company_name
FROM movies m
JOIN movie_production_companies mpc ON m.movie_id = mpc.movie_id
JOIN production_companies pc ON mpc.company_id = pc.company_id
WHERE m.budget > 100000000;

-- 5. Show all movies filmed in 'London' and their directors
SELECT m.title, d.director_name
FROM movies m
JOIN movie_locations ml ON m.movie_id = ml.movie_id
JOIN locations l ON ml.location_id = l.location_id
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON md.director_id = d.director_id
WHERE l.location_name = 'London';

-- 6. Show all horror movies and their actors
SELECT m.title, a.actor_name
FROM movies m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
JOIN movie_actors ma ON m.movie_id = ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id
WHERE g.genre_name = 'Horror';

-- 7. Show all movies with reviews rated 5 and their reviewers
SELECT m.title, u.username, r.rating
FROM movies m
JOIN reviews r ON m.movie_id = r.movie_id
JOIN users u ON r.user_id = u.user_id
WHERE r.rating = 5;

-- 8. Show all British directors and their movies
SELECT d.director_name, m.title
FROM directors d
JOIN movie_directors md ON d.director_id = md.director_id
JOIN movies m ON md.movie_id = m.movie_id
WHERE d.nationality = 'British';

-- 9. Show all movies longer than 180 minutes and their genres
SELECT m.title, g.genre_name
FROM movies m
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
WHERE m.duration_minutes > 180;

-- 10. Show all Oscar-winning movies and their directors
SELECT m.title, d.director_name, aw.award_name
FROM movies m
JOIN movie_awards ma ON m.movie_id = ma.movie_id
JOIN awards aw ON ma.award_id = aw.award_id
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON md.director_id = d.director_id
WHERE aw.award_name LIKE '%Oscar%';
