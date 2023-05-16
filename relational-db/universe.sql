--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(60) NOT NULL,
    star_count integer,
    location text,
    shape character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(60) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    color character varying(20),
    size_meteres integer
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
    name character varying(60) NOT NULL,
    moon_count integer,
    avg_temp_celsius numeric(6,2),
    has_moon boolean NOT NULL,
    star_id integer,
    planet_id integer NOT NULL
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
-- Name: planetary_systems; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetary_systems (
    planetary_systems_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_count integer,
    name character varying(60) NOT NULL
);


ALTER TABLE public.planetary_systems OWNER TO freecodecamp;

--
-- Name: solar_systems_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_systems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_systems_id_seq OWNER TO freecodecamp;

--
-- Name: solar_systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_systems_id_seq OWNED BY public.planetary_systems.planetary_systems_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_planets boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planetary_systems planetary_systems_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_systems ALTER COLUMN planetary_systems_id SET DEFAULT nextval('public.solar_systems_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2400, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 500, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Leo II', 200, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Leo I', 50, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Bardnards Galaxy', 900, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('Phobos', 2, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('Deimos', 3, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 4, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Titan', 5, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Aegir', 6, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Alvaldi', 7, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Beli', 8, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Bestla', 9, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Calypso', 10, 6, NULL, NULL);
INSERT INTO public.moon VALUES ('Callisto', 11, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Carpo', 12, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Carme', 13, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Aoede', 14, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Dia', 15, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Elara', 16, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Proteus', 17, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('Larissa', 18, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('Galatea', 19, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('Despina', 20, 7, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 15.00, true, 1, 1);
INSERT INTO public.planet VALUES ('Mars', 2, 5.00, true, 1, 2);
INSERT INTO public.planet VALUES ('Venus', 0, -10.00, false, 1, 3);
INSERT INTO public.planet VALUES ('Mercury', 0, -100.00, false, 1, 4);
INSERT INTO public.planet VALUES ('Jupiter', 80, -1000.00, true, 1, 5);
INSERT INTO public.planet VALUES ('Saturn', 124, -1000.00, true, 1, 6);
INSERT INTO public.planet VALUES ('Npetune', 14, -1000.00, true, 1, 7);
INSERT INTO public.planet VALUES ('Thrae', 30, 10.00, true, 4, 8);
INSERT INTO public.planet VALUES ('Sram', 10, 20.00, true, 4, 9);
INSERT INTO public.planet VALUES ('Sunuv', 1, 1.00, true, 4, 10);
INSERT INTO public.planet VALUES ('Nrutas', 0, 50.00, false, 4, 11);
INSERT INTO public.planet VALUES ('Uranus', 27, -1000.00, true, 1, 12);


--
-- Data for Name: planetary_systems; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetary_systems VALUES (1, 1, 8, 'home');
INSERT INTO public.planetary_systems VALUES (3, 2, 2, 'Centaurus');
INSERT INTO public.planetary_systems VALUES (4, 3, 0, 'Ophiuchus');
INSERT INTO public.planetary_systems VALUES (5, 4, 4, 'Alpha Canis Minoris');
INSERT INTO public.planetary_systems VALUES (6, 5, 0, 'Cygni');
INSERT INTO public.planetary_systems VALUES (7, 6, 0, 'Cygni');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star for Earth', true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centaury', 'Closest star to the sun', true, 1);
INSERT INTO public.star VALUES (3, 'Bernard Star', 'Third closest star to the sun', false, 1);
INSERT INTO public.star VALUES (4, 'Procyon', 'Star in the Alpha Canis Minoris system', true, 1);
INSERT INTO public.star VALUES (5, 'Cygni-A', 'First star in Cygni system', false, 1);
INSERT INTO public.star VALUES (6, 'Cygni-B', 'Second star in Cygni system', false, 1);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_systems_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_location_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_location_key UNIQUE (location);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planetary_systems planetary_systems_planetary_systems_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_systems
    ADD CONSTRAINT planetary_systems_planetary_systems_id_key UNIQUE (planetary_systems_id);


--
-- Name: planetary_systems solar_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_systems
    ADD CONSTRAINT solar_systems_pkey PRIMARY KEY (planetary_systems_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planetary_systems solar_systems_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_systems
    ADD CONSTRAINT solar_systems_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

