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
-- Name: asteriod; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteriod (
    asteriod_id integer NOT NULL,
    name character varying(40) NOT NULL,
    diameter integer NOT NULL,
    orbit_period_days integer,
    discovered_year integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.asteriod OWNER TO freecodecamp;

--
-- Name: asteriod_asteriod_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteriod_asteriod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteriod_asteriod_id_seq OWNER TO freecodecamp;

--
-- Name: asteriod_asteriod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteriod_asteriod_id_seq OWNED BY public.asteriod.asteriod_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    galaxy_distance_in_lightyears numeric(4,1) NOT NULL,
    galaxy_radius integer NOT NULL,
    galaxy_type text,
    has_blackholes boolean DEFAULT false NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    oribital_period_day integer NOT NULL,
    color character varying(40) NOT NULL
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
    name character varying(40),
    radius integer NOT NULL,
    distance_from_sun integer NOT NULL,
    has_rings boolean DEFAULT false NOT NULL,
    star_id integer
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
    name character varying(40) NOT NULL,
    star_type text NOT NULL,
    color character varying(40),
    radius integer NOT NULL,
    galaxy_id integer
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
-- Name: asteriod asteriod_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod ALTER COLUMN asteriod_id SET DEFAULT nextval('public.asteriod_asteriod_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteriod; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteriod VALUES (1, 'Ceres', 939, 1680, 1801, 1);
INSERT INTO public.asteriod VALUES (2, 'Pallas', 512, 1686, 1802, 1);
INSERT INTO public.asteriod VALUES (3, 'Vesta', 525, 1325, 1807, 1);
INSERT INTO public.asteriod VALUES (4, 'Eros', 1684, 643, 1893, 1);
INSERT INTO public.asteriod VALUES (5, 'Ida', 31, 1575, 1884, 1);
INSERT INTO public.asteriod VALUES (6, 'Gapra', 18, 1304, 1960, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.0, 23567890, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2.6, 23527790, 'Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 2.7, 23924720, 'Spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 31.0, 43924720, 'Elliptical', true);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic cloud', 0.2, 43235720, 'Irregular', false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 23.0, 63223720, 'Spiral', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, 27, 'white');
INSERT INTO public.moon VALUES (2, 'Europa', 5, 1561, 3, 'white light gray');
INSERT INTO public.moon VALUES (3, 'Ganymede', 5, 2634, 7, 'Grayish_brown');
INSERT INTO public.moon VALUES (4, 'Callisto', 5, 2410, 16, 'White');
INSERT INTO public.moon VALUES (5, 'Lo', 5, 121, 2, 'Orange');
INSERT INTO public.moon VALUES (6, 'Titan', 6, 2574, 16, 'Orange-brown');
INSERT INTO public.moon VALUES (7, 'Enceladu', 6, 252, 1, 'White_lightgray');
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 198, 1, 'White_lightgray');
INSERT INTO public.moon VALUES (9, 'Tethy', 6, 531, 2, 'White_lightgray');
INSERT INTO public.moon VALUES (10, 'Dione', 6, 561, 3, 'White_lightgray');
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 764, 4, 'White');
INSERT INTO public.moon VALUES (12, 'Oberon', 7, 761, 13, 'Grayish_brown');
INSERT INTO public.moon VALUES (13, 'Titania', 7, 788, 9, 'Grayish_brown');
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 236, 1, 'Grayish_brown');
INSERT INTO public.moon VALUES (15, 'Triton', 8, 1353, 6, 'White');
INSERT INTO public.moon VALUES (16, 'Nereid', 8, 170, 360, 'light-brown');
INSERT INTO public.moon VALUES (17, 'Charon', 9, 606, 6, 'graish-brown');
INSERT INTO public.moon VALUES (18, 'Phobos', 9, 11, 0, 'graish-brown');
INSERT INTO public.moon VALUES (19, 'Deimos', 4, 6, 1, 'graish-brown');
INSERT INTO public.moon VALUES (22, 'Cario', 6, 200, 4, 'graish-brown');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mucury', 2440, 46, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6052, 67, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, 149, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3389, 228, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, 778, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 58323, 14300, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, 28700, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24662, 4500, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 1188, 5900, false, 1);
INSERT INTO public.planet VALUES (10, 'Kepler', 1200, 620, false, 2);
INSERT INTO public.planet VALUES (11, 'Gilese', 6500, 820, false, 4);
INSERT INTO public.planet VALUES (12, 'HD B', 69000, 1500, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Main sequence', 'White', 696340, 1);
INSERT INTO public.star VALUES (2, 'Sirius A', 'Main sequence', 'Blue White', 11837780, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red giant', 'Red', 532003760, 3);
INSERT INTO public.star VALUES (4, 'Proxima centori', 'Red dwarf', 'Red', 107250, 4);
INSERT INTO public.star VALUES (6, 'Regel', 'Blue super giant', 'Bluish White', 2437505, 6);
INSERT INTO public.star VALUES (5, 'Vega', 'Main sequence', 'Bluish White', 1573932, 5);


--
-- Name: asteriod_asteriod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteriod_asteriod_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteriod asteriod_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod
    ADD CONSTRAINT asteriod_name_key UNIQUE (name);


--
-- Name: asteriod asteriod_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod
    ADD CONSTRAINT asteriod_pkey PRIMARY KEY (asteriod_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: asteriod fk_galazy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod
    ADD CONSTRAINT fk_galazy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

