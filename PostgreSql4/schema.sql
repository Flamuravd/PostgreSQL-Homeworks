-- 1. Table-Valued Function: Get Movies by Rating

CREATE OR REPLACE FUNCTION get_movies_by_rating(rating_filter VARCHAR(10))
RETURNS TABLE (
    movie_id INT,
    title VARCHAR(255),
    release_year INT,
    rating VARCHAR(10),
    duration_minutes INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT m.movie_id, m.title, m.release_year, m.rating, m.duration_minutes
    FROM movies m
    WHERE m.rating = rating_filter;
END;
$$ LANGUAGE plpgsql;

-- Usage:
-- SELECT * FROM get_movies_by_rating('PG-13');

-- 2. Table-Valued Function: Get Director's Filmography

CREATE OR REPLACE FUNCTION get_director_filmography(director_id_input INT)
RETURNS TABLE (
    movie_id INT,
    title VARCHAR(255),
    release_year INT,
    revenue BIGINT
) AS $$
BEGIN
    RETURN QUERY
    SELECT m.movie_id, m.title, m.release_year, m.revenue
    FROM movies m
    JOIN movie_directors md ON m.movie_id = md.movie_id
    WHERE md.director_id = director_id_input;
END;
$$ LANGUAGE plpgsql;

-- Usage:
-- SELECT * FROM get_director_filmography(1);

-- 3. Scalar Function: Calculate Actor's Age

CREATE OR REPLACE FUNCTION calculate_actor_age(birth_date DATE)
RETURNS INT AS $$
BEGIN
    RETURN DATE_PART('year', AGE(CURRENT_DATE, birth_date));
END;
$$ LANGUAGE plpgsql;

-- Usage:
-- SELECT first_name, last_name, birth_date, calculate_actor_age(birth_date) AS age 
-- FROM actors 
-- WHERE birth_date IS NOT NULL;

-- 4. Scalar Function: Check if Actor Has Won Awards

CREATE OR REPLACE FUNCTION has_won_awards(actor_id_input INT)
RETURNS BOOLEAN AS $$
DECLARE
    award_count INT;
BEGIN
    SELECT COUNT(*) INTO award_count
    FROM actor_awards
    WHERE actor_id = actor_id_input;
    
    RETURN award_count > 0;
END;
$$ LANGUAGE plpgsql;

-- Usage:
-- SELECT actor_name, has_won_awards(actor_id) AS has_awards 
-- FROM actors;