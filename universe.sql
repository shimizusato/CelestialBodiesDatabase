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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    distance_from_earth_in_mly numeric,
    is_visible_to_the_naked_eye boolean NOT NULL,
    galaxy_type_id integer NOT NULL,
    is_prototype boolean NOT NULL,
    galaxy_constellation_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_constellation (
    galaxy_constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    quadrant character varying(5),
    stars_with_planets integer NOT NULL
);


ALTER TABLE public.galaxy_constellation OWNER TO freecodecamp;

--
-- Name: galaxy_constellations_galaxy_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_constellations_galaxy_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_constellations_galaxy_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_constellations_galaxy_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_constellations_galaxy_constellation_id_seq OWNED BY public.galaxy_constellation.galaxy_constellation_id;


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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(25) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    diameter integer
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
    name character varying(40) NOT NULL,
    has_life boolean,
    description text,
    star_id integer NOT NULL,
    number_of_moons integer,
    mean_temperature integer,
    has_global_magnetic_field boolean,
    density_in_kg_per_m3 integer
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
    description text,
    galaxy_id integer NOT NULL,
    diameter integer
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
-- Name: galaxy_constellation galaxy_constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_constellation ALTER COLUMN galaxy_constellation_id SET DEFAULT nextval('public.galaxy_constellations_galaxy_constellation_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES ('Milky Way', 2, 'The galaxy containing the Sun and its Solar System, and therefore Earth.', 0.00, true, 1, false, 1);
INSERT INTO public.galaxy VALUES ('Messier 82', 3, 'Appears similar in shape to a cigar', 11.80, false, 2, true, 2);
INSERT INTO public.galaxy VALUES ('Messier 81', 4, 'Named for Johann Elert Bode who discoverd thes galaxy in 1774', 12.00, true, 1, false, 2);
INSERT INTO public.galaxy VALUES ('NGC 4567 and NGC 4568', 5, 'Looks are similar to a butterfly, nickname: Butterfly Galaxies or Siamese Twins', 59.40, false, 1, false, 3);
INSERT INTO public.galaxy VALUES ('Messier Object 104', 6, 'it is similar to a sombrero', 33.10, false, 1, false, 3);
INSERT INTO public.galaxy VALUES ('Centautsu A', 7, NULL, 12.00, true, 2, false, 7);
INSERT INTO public.galaxy VALUES ('Cygnus A', 8, 'Cygnus A was identified with a distant galaxy, being the first of many radio stars to become a radio galaxy.', 760.00, false, 2, true, 5);
INSERT INTO public.galaxy VALUES ('Antennae', 9, 'Appearance is simialr to an insect s antennae.', 50.00, false, 1, false, 6);
INSERT INTO public.galaxy VALUES ('Andromeda', 1, 'Andromeda is the closest big galaxy to the Milky Way an is expected to collide with Milky Way around 4.5 billion years from now.', 2.50, true, 1, false, 4);


--
-- Data for Name: galaxy_constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_constellation VALUES (1, 'Sagittarius', 'SQ4', 32);
INSERT INTO public.galaxy_constellation VALUES (2, 'Ursa Major', 'NQ2', 21);
INSERT INTO public.galaxy_constellation VALUES (3, 'Virgo', 'SQ3', 29);
INSERT INTO public.galaxy_constellation VALUES (4, 'Andromeda', NULL, 12);
INSERT INTO public.galaxy_constellation VALUES (5, 'Cygnus', 'NQ4', 97);
INSERT INTO public.galaxy_constellation VALUES (6, 'Corvus', NULL, 3);
INSERT INTO public.galaxy_constellation VALUES (7, 'Centaurus', NULL, 15);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Highly flattened disk of stars and gas, containing spiral arms and thickening to central bluge. Sa and Sab ggalaxies have largest bulges, the least obvious spiral structure, and roughly spherical stellar halos. SB galaxies have an elongated central "bar" of stars and gas.');
INSERT INTO public.galaxy_type VALUES (2, 'Irregular', 'No obvious structure. Some irregulars have "explosive" appearance.');
INSERT INTO public.galaxy_type VALUES (3, 'Elliptical', 'No disk. Stars smoothly distributed through an ellipsoidal volume ranging from nearlu spherical (E0) to a very flattened (E7) in shape. No obvious substructure other than a dense central nucleus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phonos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Luna', 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Dione', 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Tatinia', 7, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Triton', 8, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Thalassa', 8, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Hippocamp', 8, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Himalia', 5, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Ananke', 5, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, NULL, 1, 0, 167, true, 5429);
INSERT INTO public.planet VALUES (2, 'Venus', false, NULL, 1, 0, 464, false, 5243);
INSERT INTO public.planet VALUES (3, 'Earth', true, NULL, 1, 1, 15, true, 5514);
INSERT INTO public.planet VALUES (4, 'Mars', false, NULL, 1, 2, -65, false, 3934);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, NULL, 1, 92, -110, true, 1326);
INSERT INTO public.planet VALUES (6, 'Saturn', false, NULL, 1, 83, -140, true, 687);
INSERT INTO public.planet VALUES (7, 'Uranus', false, NULL, 1, 27, -195, true, 1270);
INSERT INTO public.planet VALUES (8, 'Neptune', false, NULL, 1, 14, -200, false, 1638);
INSERT INTO public.planet VALUES (9, 'M82-Icarus', false, NULL, 3, 3, -225, false, 4433);
INSERT INTO public.planet VALUES (10, 'M82-Aurora', false, NULL, 3, 12, -150, false, 3223);
INSERT INTO public.planet VALUES (11, 'M81-Galatea', false, NULL, 4, 2, -130, false, 3233);
INSERT INTO public.planet VALUES (12, 'M81-Apollo', false, NULL, 4, 5, -50, false, 5475);
INSERT INTO public.planet VALUES (13, 'NGC 4567/4568-Zephyr', false, NULL, 5, 1, -88, false, 3984);
INSERT INTO public.planet VALUES (14, 'NGC 4567/4568-Artemis', false, NULL, 5, 4, -240, false, 3344);
INSERT INTO public.planet VALUES (15, 'M101-Venus', false, NULL, 6, 3, -320, false, 3434);
INSERT INTO public.planet VALUES (16, 'Cen A-Pluto', false, NULL, 7, 1, -140, false, 6776);
INSERT INTO public.planet VALUES (17, 'Cygnus A-Saturn', false, NULL, 8, 3, -230, false, 1433);
INSERT INTO public.planet VALUES (18, 'Antennae-Mercury', false, NULL, 9, 2, -220, false, 1200);
INSERT INTO public.planet VALUES (19, 'Nerub', true, NULL, 2, 1, -125, true, 5534);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 2, NULL);
INSERT INTO public.star VALUES (2, 'Nembus', NULL, 1, NULL);
INSERT INTO public.star VALUES (3, 'M82-Alpha', NULL, 3, NULL);
INSERT INTO public.star VALUES (4, 'M81-Galatea', NULL, 4, NULL);
INSERT INTO public.star VALUES (5, 'NGC 4567/4568-Delta', NULL, 5, NULL);
INSERT INTO public.star VALUES (6, 'M104-Sol', NULL, 6, NULL);
INSERT INTO public.star VALUES (7, 'Cen A-Alpha', NULL, 7, NULL);
INSERT INTO public.star VALUES (8, 'Cygnus', NULL, 8, NULL);
INSERT INTO public.star VALUES (9, 'Antennae-Gamma', NULL, 9, NULL);


--
-- Name: galaxy_constellations_galaxy_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_constellations_galaxy_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy_constellation galaxy_constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_constellation
    ADD CONSTRAINT galaxy_constellation_name_key UNIQUE (name);


--
-- Name: galaxy_constellation galaxy_constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_constellation
    ADD CONSTRAINT galaxy_constellations_pkey PRIMARY KEY (galaxy_constellation_id);


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
-- Name: galaxy_type galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_constellatin_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellatin_id FOREIGN KEY (galaxy_constellation_id) REFERENCES public.galaxy_constellation(galaxy_constellation_id);


--
-- Name: galaxy galaxy_type_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_id FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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

