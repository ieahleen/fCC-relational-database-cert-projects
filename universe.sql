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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_kg double precision
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    galaxy_group character varying(30),
    distance_from_milky_way_in_mly double precision
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    mass double precision,
    diameter double precision
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_moons integer,
    average_distance_from_star_in_km double precision,
    dwarf boolean,
    has_life boolean,
    star_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_planets integer,
    galaxy_id integer NOT NULL,
    type text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (4, 'Ceres', 9.43e+20);
INSERT INTO public.asteroid VALUES (1, '101955 Bennu', 78000000000);
INSERT INTO public.asteroid VALUES (2, '243 Ida', 4.2e+16);
INSERT INTO public.asteroid VALUES (3, '433 Eros', 6.687e+15);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred spiral galaxy', 'Local Group', 2.45);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 'Starburst galaxy', 'M81 Group', 12);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'peculiar galaxy', 'Virgo II Groups', 31.1);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Dwarf irregular galaxy', 'Local Group', 0.163);
INSERT INTO public.galaxy VALUES (6, 'NGC 185', 'dwarf sferoidal galaxy', 'Local Group', 2.05);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy', 'Local Group', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (18, 'Miranda', 7, 6.4e+19, 471.6);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1.251e+21, 1157.8);
INSERT INTO public.moon VALUES (20, 'Umbriel', 7, 1.275e+21, 1169.4);
INSERT INTO public.moon VALUES (21, 'Titania', 7, 3.4e+21, 1576.8);
INSERT INTO public.moon VALUES (22, 'Oberon', 7, 3.076e+21, 1522.8);
INSERT INTO public.moon VALUES (1, 'Moon', 1, 7.342e+22, 3474.8);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 2e+15, 12.4);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1.08e+16, 22.533);
INSERT INTO public.moon VALUES (16, 'Larissa', 8, 4.2e+18, 194);
INSERT INTO public.moon VALUES (15, 'Proteus', 8, 4.4e+19, 420);
INSERT INTO public.moon VALUES (17, 'Despina', 8, 2.2e+18, 150);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1.8e+21, 1469);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 1.35e+23, 5149.5);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 2.3e+21, 1527.6);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1.0800000000000001e+23, 4820.6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 1.4799999999999999e+23, 5268.2);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 4.8e+22, 3121.6);
INSERT INTO public.moon VALUES (4, 'Io', 5, 8.9e+22, 3643.2);
INSERT INTO public.moon VALUES (8, 'Dione', 6, 1.1e+21, 1122.8);
INSERT INTO public.moon VALUES (9, 'Tethys', 6, 6.2e+20, 1062);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 4e+19, 396.4);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 1.1e+20, 504.2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 93000000, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 0, 108208930, false, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, NULL, false, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 82, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 0, NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 1, NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Pluto', 5, NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Orcus', 1, NULL, true, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 0, 58000000, false, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 1, 'G');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3, 1, NULL);
INSERT INTO public.star VALUES (3, 'Wolf 359', 2, 1, NULL);
INSERT INTO public.star VALUES (4, 'Antares', NULL, 1, 'Red supergiant');
INSERT INTO public.star VALUES (5, 'Rigel', NULL, 1, 'Blue supergiant');
INSERT INTO public.star VALUES (6, 'Aldebaran', 1, 1, 'Red-giant branch');


--
-- Name: asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_id_seq', 4, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 22, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

