-- Homework 3 - Part 1

-- 1. Find all genres with >3 'R'-rated movies
SELECT g.genre_name, COUNT(*) AS movie_count
FROM genres g
JOIN movie_genres mg ON g.genre_id = mg.genre_id
JOIN movies m ON mg.movie_id = m.movie_id
WHERE m.rating = 'R'
GROUP BY g.genre_name
HAVING COUNT(*) > 3;

-- 2. Directors with >500M total revenue and ≥2 movies

SELECT d.director_name, SUM(m.revenue) AS total_revenue, COUNT(*) AS movie_count
FROM directors d
JOIN movie_directors md ON d.director_id = md.director_id
JOIN movies m ON md.movie_id = m.movie_id
GROUP BY d.director_name
HAVING SUM(m.revenue) > 500000000 AND COUNT(*) >= 2;

-- 3. Actors in >2 genres with ≥1 award

SELECT a.actor_name, COUNT(DISTINCT g.genre_id) AS genre_count, a.awards_count
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movie_genres mg ON ma.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
WHERE a.awards_count >= 1
GROUP BY a.actor_name, a.awards_count
HAVING COUNT(DISTINCT g.genre_id) > 2;

-- 4. Movies with >3 reviews and avg rating >7

SELECT m.title, AVG(r.rating) AS avg_rating, COUNT(*) AS review_count
FROM movies m
JOIN reviews r ON m.movie_id = r.movie_id
GROUP BY m.title
HAVING COUNT(*) > 3 AND AVG(r.rating) > 7;

-- 5. Production companies investing >100M post-2015

SELECT pc.company_name, SUM(m.budget) AS total_investment
FROM production_companies pc
JOIN movie_production_companies mpc ON pc.company_id = mpc.company_id
JOIN movies m ON mpc.movie_id = m.movie_id
WHERE m.release_year > 2015
GROUP BY pc.company_name
HAVING SUM(m.budget) > 100000000;

-- 6. Countries with >2 movies filmed (total budget >150M)

SELECT l.country_name, COUNT(*) AS movie_count, SUM(m.budget) AS total_budget
FROM locations l
JOIN movie_locations ml ON l.location_id = ml.location_id
JOIN movies m ON ml.movie_id = m.movie_id
GROUP BY l.country_name
HAVING COUNT(*) > 2 AND SUM(m.budget) > 150000000;

-- 7. Genres with avg duration >120m and ≥1 Oscar winner

SELECT g.genre_name, AVG(m.duration_minutes) AS avg_duration
FROM genres g
JOIN movie_genres mg ON g.genre_id = mg.genre_id
JOIN movies m ON mg.movie_id = m.movie_id
JOIN movie_awards ma ON m.movie_id = ma.movie_id
JOIN awards a ON ma.award_id = a.award_id
WHERE a.award_name LIKE '%Oscar%'
GROUP BY g.genre_name
HAVING AVG(m.duration_minutes) > 120;

-- 8. Years with >3 movies (avg budget >50M)

SELECT release_year, COUNT(*) AS movie_count, AVG(budget) AS avg_budget
FROM movies
GROUP BY release_year
HAVING COUNT(*) > 3 AND AVG(budget) > 50000000;

-- 9. Actors with >2 lead roles (total revenue >200M)

SELECT a.actor_name, COUNT(*) AS lead_role_count, SUM(m.revenue) AS total_revenue
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
WHERE ma.role_type = 'lead'
GROUP BY a.actor_name
HAVING COUNT(*) > 2 AND SUM(m.revenue) > 200000000;

----------------------------------------------------------------------------------------------------

-- Homework 3 - Part 2

-- 1. Top-rated movies view

CREATE VIEW top_rated_movies AS
SELECT m.title, AVG(r.rating) AS avg_rating, COUNT(r.review_id) AS review_count, d.director_name
FROM movies m
JOIN reviews r ON m.movie_id = r.movie_id
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON md.director_id = d.director_id
GROUP BY m.title, d.director_name
HAVING AVG(r.rating) >= 4.0;

-- 2. Movie financial performance view

CREATE VIEW movie_financials AS
SELECT 
  title, 
  budget, 
  revenue, 
  (revenue - budget) AS profit,
  ROUND((revenue - budget) / NULLIF(budget, 0) * 100, 2) AS roi_percentage
FROM movies;

-- 3. Actor filmography view

CREATE VIEW actor_filmography AS
SELECT 
  a.actor_name,
  COUNT(DISTINCT ma.movie_id) AS movie_count,
  STRING_AGG(DISTINCT g.genre_name, ', ') AS genres,
  SUM(m.revenue) AS total_revenue
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
JOIN movie_genres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
GROUP BY a.actor_name;

-- 4. Genre statistics view

CREATE VIEW genre_stats AS
SELECT 
  g.genre_name,
  COUNT(DISTINCT mg.movie_id) AS movie_count,
  ROUND(AVG(r.rating), 1) AS avg_rating,
  SUM(m.revenue) AS total_revenue
FROM genres g
JOIN movie_genres mg ON g.genre_id = mg.genre_id
JOIN movies m ON mg.movie_id = m.movie_id
LEFT JOIN reviews r ON m.movie_id = r.movie_id
GROUP BY g.genre_name;

-- 5. Production company performance view

CREATE VIEW company_performance AS
SELECT 
  pc.company_name,
  COUNT(DISTINCT mpc.movie_id) AS movie_count,
  SUM(m.budget) AS total_investment,
  SUM(m.revenue) AS total_revenue
FROM production_companies pc
JOIN movie_production_companies mpc ON pc.company_id = mpc.company_id
JOIN movies m ON mpc.movie_id = m.movie_id
GROUP BY pc.company_name;
