--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.2

-- Started on 2025-04-06 21:26:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 17202)
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    actor_id integer NOT NULL,
    actor_name character varying(100) NOT NULL,
    awards_count integer DEFAULT 0
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17201)
-- Name: actors_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actors_actor_id_seq OWNER TO postgres;

--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 223
-- Name: actors_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_actor_id_seq OWNED BY public.actors.actor_id;


--
-- TOC entry 222 (class 1259 OID 17195)
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    director_id integer NOT NULL,
    director_name character varying(100) NOT NULL
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17194)
-- Name: directors_director_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directors_director_id_seq OWNER TO postgres;

--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 221
-- Name: directors_director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_director_id_seq OWNED BY public.directors.director_id;


--
-- TOC entry 220 (class 1259 OID 17186)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    genre_id integer NOT NULL,
    genre_name character varying(50) NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17185)
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_genre_id_seq OWNER TO postgres;

--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 219
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;


--
-- TOC entry 228 (class 1259 OID 17217)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    location_id integer NOT NULL,
    country_name character varying(100) NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17216)
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_location_id_seq OWNER TO postgres;

--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 227
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;


--
-- TOC entry 233 (class 1259 OID 17267)
-- Name: movie_actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_actors (
    movie_id integer NOT NULL,
    actor_id integer NOT NULL,
    role_type character varying(20) DEFAULT 'supporting'::character varying
);


ALTER TABLE public.movie_actors OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17252)
-- Name: movie_directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_directors (
    movie_id integer NOT NULL,
    director_id integer NOT NULL
);


ALTER TABLE public.movie_directors OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17237)
-- Name: movie_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_genres (
    movie_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.movie_genres OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17298)
-- Name: movie_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_locations (
    movie_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.movie_locations OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17283)
-- Name: movie_production_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_production_companies (
    movie_id integer NOT NULL,
    company_id integer NOT NULL
);


ALTER TABLE public.movie_production_companies OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17178)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    title character varying(255) NOT NULL,
    release_year integer,
    rating character varying(10),
    revenue bigint,
    budget bigint,
    duration integer,
    oscar_wins integer DEFAULT 0
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17177)
-- Name: movies_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movies_movie_id_seq OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 217
-- Name: movies_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;


--
-- TOC entry 226 (class 1259 OID 17210)
-- Name: production_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.production_companies (
    company_id integer NOT NULL,
    company_name character varying(100) NOT NULL
);


ALTER TABLE public.production_companies OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17209)
-- Name: production_companies_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.production_companies_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.production_companies_company_id_seq OWNER TO postgres;

--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 225
-- Name: production_companies_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.production_companies_company_id_seq OWNED BY public.production_companies.company_id;


--
-- TOC entry 230 (class 1259 OID 17224)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    movie_id integer,
    rating numeric(3,1),
    review_text text
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17223)
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_review_id_seq OWNER TO postgres;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 229
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;


--
-- TOC entry 4695 (class 2604 OID 17205)
-- Name: actors actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN actor_id SET DEFAULT nextval('public.actors_actor_id_seq'::regclass);


--
-- TOC entry 4694 (class 2604 OID 17198)
-- Name: directors director_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN director_id SET DEFAULT nextval('public.directors_director_id_seq'::regclass);


--
-- TOC entry 4693 (class 2604 OID 17189)
-- Name: genres genre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);


--
-- TOC entry 4698 (class 2604 OID 17220)
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);


--
-- TOC entry 4691 (class 2604 OID 17181)
-- Name: movies movie_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);


--
-- TOC entry 4697 (class 2604 OID 17213)
-- Name: production_companies company_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_companies ALTER COLUMN company_id SET DEFAULT nextval('public.production_companies_company_id_seq'::regclass);


--
-- TOC entry 4699 (class 2604 OID 17227)
-- Name: reviews review_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);


--
-- TOC entry 4890 (class 0 OID 17202)
-- Dependencies: 224
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actors (actor_id, actor_name, awards_count) FROM stdin;
\.


--
-- TOC entry 4888 (class 0 OID 17195)
-- Dependencies: 222
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (director_id, director_name) FROM stdin;
1	Christopher Nolan
2	Quentin Tarantino
3	David Fincher
\.


--
-- TOC entry 4886 (class 0 OID 17186)
-- Dependencies: 220
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (genre_id, genre_name) FROM stdin;
1	Action
2	Drama
3	Comedy
4	Sci-Fi
5	Horror
\.


--
-- TOC entry 4894 (class 0 OID 17217)
-- Dependencies: 228
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (location_id, country_name) FROM stdin;
\.


--
-- TOC entry 4899 (class 0 OID 17267)
-- Dependencies: 233
-- Data for Name: movie_actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_actors (movie_id, actor_id, role_type) FROM stdin;
\.


--
-- TOC entry 4898 (class 0 OID 17252)
-- Dependencies: 232
-- Data for Name: movie_directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_directors (movie_id, director_id) FROM stdin;
\.


--
-- TOC entry 4897 (class 0 OID 17237)
-- Dependencies: 231
-- Data for Name: movie_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_genres (movie_id, genre_id) FROM stdin;
\.


--
-- TOC entry 4901 (class 0 OID 17298)
-- Dependencies: 235
-- Data for Name: movie_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_locations (movie_id, location_id) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 17283)
-- Dependencies: 234
-- Data for Name: movie_production_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_production_companies (movie_id, company_id) FROM stdin;
\.


--
-- TOC entry 4884 (class 0 OID 17178)
-- Dependencies: 218
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (movie_id, title, release_year, rating, revenue, budget, duration, oscar_wins) FROM stdin;
1	Inception	2010	PG-13	836000000	160000000	148	4
2	The Dark Knight	2008	R	1005000000	185000000	152	2
3	Interstellar	2014	PG-13	677000000	165000000	169	1
4	Pulp Fiction	1994	R	214000000	8000000	154	1
5	Fight Club	1999	R	101000000	63000000	139	0
\.


--
-- TOC entry 4892 (class 0 OID 17210)
-- Dependencies: 226
-- Data for Name: production_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.production_companies (company_id, company_name) FROM stdin;
\.


--
-- TOC entry 4896 (class 0 OID 17224)
-- Dependencies: 230
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (review_id, movie_id, rating, review_text) FROM stdin;
\.


--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 223
-- Name: actors_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_actor_id_seq', 1, false);


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 221
-- Name: directors_director_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_director_id_seq', 3, true);


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 219
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 5, true);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 227
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_location_id_seq', 1, false);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 217
-- Name: movies_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_movie_id_seq', 5, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 225
-- Name: production_companies_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.production_companies_company_id_seq', 1, false);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 229
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 1, false);


--
-- TOC entry 4710 (class 2606 OID 17208)
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (actor_id);


--
-- TOC entry 4708 (class 2606 OID 17200)
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (director_id);


--
-- TOC entry 4704 (class 2606 OID 17193)
-- Name: genres genres_genre_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_genre_name_key UNIQUE (genre_name);


--
-- TOC entry 4706 (class 2606 OID 17191)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 4714 (class 2606 OID 17222)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- TOC entry 4722 (class 2606 OID 17272)
-- Name: movie_actors movie_actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actors
    ADD CONSTRAINT movie_actors_pkey PRIMARY KEY (movie_id, actor_id);


--
-- TOC entry 4720 (class 2606 OID 17256)
-- Name: movie_directors movie_directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_directors
    ADD CONSTRAINT movie_directors_pkey PRIMARY KEY (movie_id, director_id);


--
-- TOC entry 4718 (class 2606 OID 17241)
-- Name: movie_genres movie_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_pkey PRIMARY KEY (movie_id, genre_id);


--
-- TOC entry 4726 (class 2606 OID 17302)
-- Name: movie_locations movie_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_locations
    ADD CONSTRAINT movie_locations_pkey PRIMARY KEY (movie_id, location_id);


--
-- TOC entry 4724 (class 2606 OID 17287)
-- Name: movie_production_companies movie_production_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_production_companies
    ADD CONSTRAINT movie_production_companies_pkey PRIMARY KEY (movie_id, company_id);


--
-- TOC entry 4702 (class 2606 OID 17184)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);


--
-- TOC entry 4712 (class 2606 OID 17215)
-- Name: production_companies production_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.production_companies
    ADD CONSTRAINT production_companies_pkey PRIMARY KEY (company_id);


--
-- TOC entry 4716 (class 2606 OID 17231)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- TOC entry 4732 (class 2606 OID 17278)
-- Name: movie_actors movie_actors_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actors
    ADD CONSTRAINT movie_actors_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(actor_id);


--
-- TOC entry 4733 (class 2606 OID 17273)
-- Name: movie_actors movie_actors_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_actors
    ADD CONSTRAINT movie_actors_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


--
-- TOC entry 4730 (class 2606 OID 17262)
-- Name: movie_directors movie_directors_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_directors
    ADD CONSTRAINT movie_directors_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(director_id);


--
-- TOC entry 4731 (class 2606 OID 17257)
-- Name: movie_directors movie_directors_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_directors
    ADD CONSTRAINT movie_directors_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


--
-- TOC entry 4728 (class 2606 OID 17247)
-- Name: movie_genres movie_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id);


--
-- TOC entry 4729 (class 2606 OID 17242)
-- Name: movie_genres movie_genres_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


--
-- TOC entry 4736 (class 2606 OID 17308)
-- Name: movie_locations movie_locations_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_locations
    ADD CONSTRAINT movie_locations_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id);


--
-- TOC entry 4737 (class 2606 OID 17303)
-- Name: movie_locations movie_locations_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_locations
    ADD CONSTRAINT movie_locations_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


--
-- TOC entry 4734 (class 2606 OID 17293)
-- Name: movie_production_companies movie_production_companies_company_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_production_companies
    ADD CONSTRAINT movie_production_companies_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.production_companies(company_id);


--
-- TOC entry 4735 (class 2606 OID 17288)
-- Name: movie_production_companies movie_production_companies_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_production_companies
    ADD CONSTRAINT movie_production_companies_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


--
-- TOC entry 4727 (class 2606 OID 17232)
-- Name: reviews reviews_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


-- Completed on 2025-04-06 21:26:19

--
-- PostgreSQL database dump complete
--

