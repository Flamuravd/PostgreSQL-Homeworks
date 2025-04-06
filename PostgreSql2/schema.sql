CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50),
    birth_date DATE
);

CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50),
    birth_date DATE
);

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER,
    rating VARCHAR(10),
    duration_minutes INTEGER,
    language VARCHAR(50),
    budget NUMERIC(15,2),
    revenue NUMERIC(15,2)
);

CREATE TABLE production_companies (
    company_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE awards (
    award_id SERIAL PRIMARY KEY,
    award_name VARCHAR(100) NOT NULL,
    year INTEGER
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    join_date DATE
);

CREATE TABLE movie_directors (
    movie_id INTEGER REFERENCES movies(movie_id),
    director_id INTEGER REFERENCES directors(director_id),
    PRIMARY KEY (movie_id, director_id)
);

CREATE TABLE movie_actors (
    movie_id INTEGER REFERENCES movies(movie_id),
    actor_id INTEGER REFERENCES actors(actor_id),
    PRIMARY KEY (movie_id, actor_id)
);

CREATE TABLE movie_genres (
    movie_id INTEGER REFERENCES movies(movie_id),
    genre_id INTEGER REFERENCES genres(genre_id),
    PRIMARY KEY (movie_id, genre_id)
);

CREATE TABLE movie_locations (
    movie_id INTEGER REFERENCES movies(movie_id),
    location_id INTEGER REFERENCES locations(location_id),
    PRIMARY KEY (movie_id, location_id)
);

CREATE TABLE movie_production_companies (
    movie_id INTEGER REFERENCES movies(movie_id),
    company_id INTEGER REFERENCES production_companies(company_id),
    PRIMARY KEY (movie_id, company_id)
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    movie_id INTEGER REFERENCES movies(movie_id),
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date DATE
);

CREATE TABLE watchlists (
    user_id INTEGER REFERENCES users(user_id),
    movie_id INTEGER REFERENCES movies(movie_id),
    added_date DATE,
    PRIMARY KEY (user_id, movie_id)
);

CREATE TABLE actor_awards (
    actor_id INTEGER REFERENCES actors(actor_id),
    award_id INTEGER REFERENCES awards(award_id),
    PRIMARY KEY (actor_id, award_id)
);

CREATE TABLE movie_awards (
    movie_id INTEGER REFERENCES movies(movie_id),
    award_id INTEGER REFERENCES awards(award_id),
    PRIMARY KEY (movie_id, award_id)
);


INSERT INTO directors (first_name, last_name, nationality) VALUES
('Christopher', 'Nolan', 'British'),
('Steven', 'Spielberg', 'American'),
('Quentin', 'Tarantino', 'American');


INSERT INTO movies (title, release_year, rating, duration_minutes) VALUES
('Inception', 2010, 'PG-13', 148),
('The Dark Knight', 2008, 'PG-13', 152),
('Pulp Fiction', 1994, 'R', 154);


INSERT INTO genres (genre_name) VALUES
('Action'), ('Sci-Fi'), ('Crime'), ('Drama'), ('Thriller');


INSERT INTO movie_directors VALUES
(1, 1), 
(2, 1), 
(3, 3); 


SELECT m.title, d.first_name, d.last_name
FROM movies m
JOIN movie_directors md ON m.movie_id = md.movie_id
JOIN directors d ON md.director_id = d.director_id;