CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER,
    rating VARCHAR(10),
    revenue BIGINT,
    budget BIGINT,
    duration INTEGER,
    oscar_wins INTEGER DEFAULT 0
);


CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    director_name VARCHAR(100) NOT NULL
);


CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    actor_name VARCHAR(100) NOT NULL,
    awards_count INTEGER DEFAULT 0
);


CREATE TABLE production_companies (
    company_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL
);


CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    movie_id INTEGER REFERENCES movies(movie_id),
    rating DECIMAL(3,1),
    review_text TEXT
);


CREATE TABLE movie_genres (
    movie_id INTEGER REFERENCES movies(movie_id),
    genre_id INTEGER REFERENCES genres(genre_id),
    PRIMARY KEY (movie_id, genre_id)
);


CREATE TABLE movie_directors (
    movie_id INTEGER REFERENCES movies(movie_id),
    director_id INTEGER REFERENCES directors(director_id),
    PRIMARY KEY (movie_id, director_id)
);

CREATE TABLE movie_actors (
    movie_id INTEGER REFERENCES movies(movie_id),
    actor_id INTEGER REFERENCES actors(actor_id),
    role_type VARCHAR(20) DEFAULT 'supporting', 
    PRIMARY KEY (movie_id, actor_id)
);

CREATE TABLE movie_production_companies (
    movie_id INTEGER REFERENCES movies(movie_id),
    company_id INTEGER REFERENCES production_companies(company_id),
    PRIMARY KEY (movie_id, company_id)
);

CREATE TABLE movie_locations (
    movie_id INTEGER REFERENCES movies(movie_id),
    location_id INTEGER REFERENCES locations(location_id),
    PRIMARY KEY (movie_id, location_id)
);


INSERT INTO genres (genre_name) VALUES 
('Action'), ('Drama'), ('Comedy'), ('Sci-Fi'), ('Horror');

INSERT INTO movies (title, release_year, rating, revenue, budget, duration, oscar_wins) VALUES
('Inception', 2010, 'PG-13', 836000000, 160000000, 148, 4),
('The Dark Knight', 2008, 'R', 1005000000, 185000000, 152, 2),
('Interstellar', 2014, 'PG-13', 677000000, 165000000, 169, 1),
('Pulp Fiction', 1994, 'R', 214000000, 8000000, 154, 1),
('Fight Club', 1999, 'R', 101000000, 63000000, 139, 0);

INSERT INTO directors (director_name) VALUES 
('Christopher Nolan'), ('Quentin Tarantino'), ('David Fincher');