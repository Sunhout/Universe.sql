--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    is_pretty boolean,
    is_cool boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_star_id integer NOT NULL
);


ALTER TABLE public.galaxy_star OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_galaxy_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_galaxy_star_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_galaxy_star_id_seq OWNED BY public.galaxy_star.galaxy_star_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    description text,
    is_pretty boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    description text,
    distance_from_earth numeric(5,3)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text,
    is_spherical boolean,
    has_life boolean,
    distance_in_millions_of_years integer,
    distance_in_thousands_of_years integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_star galaxy_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star ALTER COLUMN galaxy_star_id SET DEFAULT nextval('public.galaxy_star_galaxy_star_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Mass Effect', true, true);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 'TV antennae', true, true);
INSERT INTO public.galaxy VALUES (3, 'Backward', 'Rotates Backward', true, true);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw', 'Bear claw', true, false);
INSERT INTO public.galaxy VALUES (5, 'Butterfly', 'Like a butterfly', true, true);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Evil eyes', false, false);


--
-- Data for Name: galaxy_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star VALUES (1, 1, 'hello', 1);
INSERT INTO public.galaxy_star VALUES (2, 2, 'Hi', 2);
INSERT INTO public.galaxy_star VALUES (3, 3, 'Hola', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Buck', 1, 'buck moon', true);
INSERT INTO public.moon VALUES (2, 'Cold', 1, 'cold moon', true);
INSERT INTO public.moon VALUES (3, 'Strawberry', 1, 'strawberry moon', true);
INSERT INTO public.moon VALUES (4, 'Wolf', 1, 'wolf moon', false);
INSERT INTO public.moon VALUES (5, 'Flower', 1, 'flower moon', true);
INSERT INTO public.moon VALUES (6, 'Moon', 1, 'moon moon', false);
INSERT INTO public.moon VALUES (7, 'Pink', 1, 'pink moon', true);
INSERT INTO public.moon VALUES (8, 'Sturgeon', 1, 'sturgeon moon', false);
INSERT INTO public.moon VALUES (9, 'Beaver', 1, 'beaver moon', false);
INSERT INTO public.moon VALUES (10, 'Ganymede', 1, 'ganymede moon', false);
INSERT INTO public.moon VALUES (11, 'Harvest', 1, 'harvest moon', true);
INSERT INTO public.moon VALUES (12, 'Titan', 1, 'titan moon', true);
INSERT INTO public.moon VALUES (13, 'Worm', 1, 'worm moon', false);
INSERT INTO public.moon VALUES (14, 'Adrastea', 1, 'adrastea moon', false);
INSERT INTO public.moon VALUES (15, 'Callisto', 1, 'callisto moon', false);
INSERT INTO public.moon VALUES (16, 'Deimos', 1, 'deimos moon', true);
INSERT INTO public.moon VALUES (17, 'Dione', 2, 'dione moon', true);
INSERT INTO public.moon VALUES (18, 'Europa', 2, 'europa moon', true);
INSERT INTO public.moon VALUES (19, 'Himalia', 3, 'himalia moon', false);
INSERT INTO public.moon VALUES (20, 'Io', 3, 'Io moon', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'first planet', 30.000);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'second planet', 20.000);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 'third planet', 10.000);
INSERT INTO public.planet VALUES (4, 'Earth', 2, 'our planet', 0.000);
INSERT INTO public.planet VALUES (5, 'Jupiter', 2, 'biggest planet', 10.000);
INSERT INTO public.planet VALUES (6, 'Saturn', 2, 'ring planet', 15.000);
INSERT INTO public.planet VALUES (7, 'Uranus', 3, 'seventh planet', 40.000);
INSERT INTO public.planet VALUES (8, 'Pluto', 3, 'lost planet', 60.000);
INSERT INTO public.planet VALUES (9, 'Sun', 3, 'hottest planet', 40.000);
INSERT INTO public.planet VALUES (10, 'Neptune', 3, 'sixth planet', 20.000);
INSERT INTO public.planet VALUES (11, 'Ceres', 4, 'lost member', 50.000);
INSERT INTO public.planet VALUES (12, 'Charon', 4, 'another lost member', 50.000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 'Very serious', true, true, 1000, 10000);
INSERT INTO public.star VALUES (2, 'Rigel', 1, 'William Regal', false, true, 2000, 20000);
INSERT INTO public.star VALUES (3, 'Canopus', 2, 'Canopy', true, true, 100, 10000);
INSERT INTO public.star VALUES (4, 'Vega', 2, 'Las Vegas', true, true, 400, 4000);
INSERT INTO public.star VALUES (5, 'Altair', 2, 'Altari', true, false, 500, 5000);
INSERT INTO public.star VALUES (6, 'Capella', 3, 'Acapella', true, true, 1000, 100000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_galaxy_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_galaxy_star_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star galaxy_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_name_key UNIQUE (name);


--
-- Name: galaxy_star galaxy_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_pkey PRIMARY KEY (galaxy_star_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_star galaxy_star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star galaxy_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

