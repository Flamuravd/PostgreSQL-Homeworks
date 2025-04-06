--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.2

-- Started on 2025-04-06 20:48:52

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
-- TOC entry 226 (class 1259 OID 16946)
-- Name: achievementtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievementtype (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    participationrate numeric(5,2)
);


ALTER TABLE public.achievementtype OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16945)
-- Name: achievementtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.achievementtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.achievementtype_id_seq OWNER TO postgres;

--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 225
-- Name: achievementtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.achievementtype_id_seq OWNED BY public.achievementtype.id;


--
-- TOC entry 222 (class 1259 OID 16915)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    credit integer,
    academicyear character varying(10),
    semester character varying(10)
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16914)
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_id_seq OWNER TO postgres;

--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 221
-- Name: course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;


--
-- TOC entry 224 (class 1259 OID 16922)
-- Name: grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade (
    id integer NOT NULL,
    studentid integer,
    courseid integer,
    teacherid integer,
    grade smallint,
    comment character varying(100),
    createddate date DEFAULT CURRENT_DATE,
    CONSTRAINT grade_grade_check CHECK (((grade >= 0) AND (grade <= 100)))
);


ALTER TABLE public.grade OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16921)
-- Name: grade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grade_id_seq OWNER TO postgres;

--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 223
-- Name: grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grade_id_seq OWNED BY public.grade.id;


--
-- TOC entry 228 (class 1259 OID 16955)
-- Name: gradedetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gradedetails (
    id integer NOT NULL,
    gradeid integer,
    achievementtypeid integer,
    achievementpoints numeric(5,2),
    achievementmaxpoints numeric(5,2),
    achievementdate date
);


ALTER TABLE public.gradedetails OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16954)
-- Name: gradedetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gradedetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gradedetails_id_seq OWNER TO postgres;

--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 227
-- Name: gradedetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gradedetails_id_seq OWNED BY public.gradedetails.id;


--
-- TOC entry 218 (class 1259 OID 16901)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    dateofbirth date,
    enrolleddate date,
    gender character(1),
    nationalidnumber character varying(20),
    studentcardnumber character varying(20)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16900)
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_id_seq OWNER TO postgres;

--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 217
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- TOC entry 220 (class 1259 OID 16908)
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher (
    id integer NOT NULL,
    firstname character varying(20) NOT NULL,
    lastname character varying(30) NOT NULL,
    dateofbirth date,
    academicrank character varying(20),
    hiredate date
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16907)
-- Name: teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teacher_id_seq OWNER TO postgres;

--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 219
-- Name: teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_id_seq OWNED BY public.teacher.id;


--
-- TOC entry 4671 (class 2604 OID 16949)
-- Name: achievementtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievementtype ALTER COLUMN id SET DEFAULT nextval('public.achievementtype_id_seq'::regclass);


--
-- TOC entry 4668 (class 2604 OID 16918)
-- Name: course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);


--
-- TOC entry 4669 (class 2604 OID 16925)
-- Name: grade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade ALTER COLUMN id SET DEFAULT nextval('public.grade_id_seq'::regclass);


--
-- TOC entry 4672 (class 2604 OID 16958)
-- Name: gradedetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradedetails ALTER COLUMN id SET DEFAULT nextval('public.gradedetails_id_seq'::regclass);


--
-- TOC entry 4666 (class 2604 OID 16904)
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- TOC entry 4667 (class 2604 OID 16911)
-- Name: teacher id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher ALTER COLUMN id SET DEFAULT nextval('public.teacher_id_seq'::regclass);


--
-- TOC entry 4845 (class 0 OID 16946)
-- Dependencies: 226
-- Data for Name: achievementtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievementtype (id, name, description, participationrate) FROM stdin;
\.


--
-- TOC entry 4841 (class 0 OID 16915)
-- Dependencies: 222
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (id, name, credit, academicyear, semester) FROM stdin;
1	Mathematics 101	4	2023-2024	Fall
2	History 101	3	2023-2024	Fall
\.


--
-- TOC entry 4843 (class 0 OID 16922)
-- Dependencies: 224
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade (id, studentid, courseid, teacherid, grade, comment, createddate) FROM stdin;
1	1	1	1	92	Excellent performance	2025-04-06
2	2	2	2	85	Good work	2025-04-06
\.


--
-- TOC entry 4847 (class 0 OID 16955)
-- Dependencies: 228
-- Data for Name: gradedetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gradedetails (id, gradeid, achievementtypeid, achievementpoints, achievementmaxpoints, achievementdate) FROM stdin;
\.


--
-- TOC entry 4837 (class 0 OID 16901)
-- Dependencies: 218
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, firstname, lastname, dateofbirth, enrolleddate, gender, nationalidnumber, studentcardnumber) FROM stdin;
1	Alice	Johnson	2001-03-15	2023-09-01	\N	\N	\N
2	Bob	Smith	2000-07-22	2023-09-01	\N	\N	\N
\.


--
-- TOC entry 4839 (class 0 OID 16908)
-- Dependencies: 220
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher (id, firstname, lastname, dateofbirth, academicrank, hiredate) FROM stdin;
1	Dr. Emily	Davis	\N	Professor	2010-05-10
2	Mr. John	Brown	\N	Lecturer	2018-11-20
\.


--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 225
-- Name: achievementtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.achievementtype_id_seq', 1, false);


--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 221
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_id_seq', 2, true);


--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 223
-- Name: grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grade_id_seq', 2, true);


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 227
-- Name: gradedetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gradedetails_id_seq', 1, false);


--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 217
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 2, true);


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 219
-- Name: teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_id_seq', 2, true);


--
-- TOC entry 4683 (class 2606 OID 16953)
-- Name: achievementtype achievementtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievementtype
    ADD CONSTRAINT achievementtype_pkey PRIMARY KEY (id);


--
-- TOC entry 4679 (class 2606 OID 16920)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- TOC entry 4681 (class 2606 OID 16929)
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (id);


--
-- TOC entry 4685 (class 2606 OID 16960)
-- Name: gradedetails gradedetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradedetails
    ADD CONSTRAINT gradedetails_pkey PRIMARY KEY (id);


--
-- TOC entry 4675 (class 2606 OID 16906)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 4677 (class 2606 OID 16913)
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id);


--
-- TOC entry 4686 (class 2606 OID 16935)
-- Name: grade grade_courseid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_courseid_fkey FOREIGN KEY (courseid) REFERENCES public.course(id);


--
-- TOC entry 4687 (class 2606 OID 16930)
-- Name: grade grade_studentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_studentid_fkey FOREIGN KEY (studentid) REFERENCES public.student(id);


--
-- TOC entry 4688 (class 2606 OID 16940)
-- Name: grade grade_teacherid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_teacherid_fkey FOREIGN KEY (teacherid) REFERENCES public.teacher(id);


--
-- TOC entry 4689 (class 2606 OID 16966)
-- Name: gradedetails gradedetails_achievementtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradedetails
    ADD CONSTRAINT gradedetails_achievementtypeid_fkey FOREIGN KEY (achievementtypeid) REFERENCES public.achievementtype(id);


--
-- TOC entry 4690 (class 2606 OID 16961)
-- Name: gradedetails gradedetails_gradeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradedetails
    ADD CONSTRAINT gradedetails_gradeid_fkey FOREIGN KEY (gradeid) REFERENCES public.grade(id);


-- Completed on 2025-04-06 20:48:52

--
-- PostgreSQL database dump complete
--

