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
-- Name: colour; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.colour (
    colour_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_possible boolean
);


ALTER TABLE public.colour OWNER TO freecodecamp;

--
-- Name: colour_colour_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.colour_colour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colour_colour_id_seq OWNER TO freecodecamp;

--
-- Name: colour_colour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.colour_colour_id_seq OWNED BY public.colour.colour_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    type character varying(50) NOT NULL,
    width_lightyears integer,
    age_millions_of_years integer,
    description text,
    name character varying(100) NOT NULL
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
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    radius_km numeric(10,4),
    has_atmosphere boolean,
    moon_shape_id integer
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
-- Name: moon_shape; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_shape (
    moon_shape_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_active boolean DEFAULT true
);


ALTER TABLE public.moon_shape OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    has_life boolean NOT NULL,
    radius_km numeric(15,6) NOT NULL,
    life_description text,
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    colour_id integer NOT NULL,
    has_atmosphere boolean
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
-- Name: shape_shape_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.shape_shape_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shape_shape_id_seq OWNER TO freecodecamp;

--
-- Name: shape_shape_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.shape_shape_id_seq OWNED BY public.moon_shape.moon_shape_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    colour_id integer NOT NULL,
    radius_km numeric(12,4),
    avg_temp_degrees_c numeric(12,4)
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
-- Name: colour colour_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colour ALTER COLUMN colour_id SET DEFAULT nextval('public.colour_colour_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_shape moon_shape_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_shape ALTER COLUMN moon_shape_id SET DEFAULT nextval('public.shape_shape_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: colour; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.colour VALUES (1, 'Red', NULL);
INSERT INTO public.colour VALUES (2, 'Blue', NULL);
INSERT INTO public.colour VALUES (3, 'Green', NULL);
INSERT INTO public.colour VALUES (4, 'Yellow', NULL);
INSERT INTO public.colour VALUES (5, 'White', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Elliptical', 100000, 500, 'Very unique in the observable universe being the only galaxy to have a perfect 1:2 ratio of the two radii of the ellipse', 'saucer');
INSERT INTO public.galaxy VALUES (2, 'Spiral', 12, 789, 'Named after the famous Tool song Lateralus which references the spiral of the Fibbonachi sequence of numbers', 'Lateralus');
INSERT INTO public.galaxy VALUES (3, 'Irregular', 10, 985, 'As obscure as a Jackson Pollock painting', 'TV static');
INSERT INTO public.galaxy VALUES (4, 'Spiral', 42, 160, 'You spin me right round, baby, right round like a record baby right round right round', 'DoA');
INSERT INTO public.galaxy VALUES (5, 'Irregular', 13, 1000, 'Identified by a large cluseter of stars located acround a centralized point', 'Alpha-3578');
INSERT INTO public.galaxy VALUES (6, 'Elliptical', 16, 623, 'The closest galaxy to the Milky Way', 'Andromeda');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', 100.2300, false, 1);
INSERT INTO public.moon VALUES (2, 1, 'Luna Prime', 987.2540, false, 1);
INSERT INTO public.moon VALUES (3, 1, 'Metos', 500.2650, true, 3);
INSERT INTO public.moon VALUES (4, 2, 'Death Star', 785.7850, false, 2);
INSERT INTO public.moon VALUES (5, 2, 'Titan', 485.6320, false, 3);
INSERT INTO public.moon VALUES (11, 1, 'Demos', 1045.2300, false, 4);
INSERT INTO public.moon VALUES (12, 3, 'Phoebe', 784.2450, true, 4);
INSERT INTO public.moon VALUES (13, 2, 'Endor', 64.8700, false, 4);
INSERT INTO public.moon VALUES (14, 3, 'Signis', 9785.6000, true, 1);
INSERT INTO public.moon VALUES (15, 3, 'Signis Prime', 453.2480, false, 2);
INSERT INTO public.moon VALUES (16, 4, 'Medin', 104.2300, false, 2);
INSERT INTO public.moon VALUES (17, 3, 'Telen', 542.5245, true, 2);
INSERT INTO public.moon VALUES (18, 2, 'Kepler', 669.8700, false, 4);
INSERT INTO public.moon VALUES (19, 3, 'Korelia', 978.2600, true, 2);
INSERT INTO public.moon VALUES (20, 5, 'Delmet Prime', 453.2800, false, 3);
INSERT INTO public.moon VALUES (21, 8, 'Sandus', 1304.2300, false, 2);
INSERT INTO public.moon VALUES (22, 9, 'Tolus', 265.4500, true, 3);
INSERT INTO public.moon VALUES (23, 11, 'Conot', 668.1870, false, 4);
INSERT INTO public.moon VALUES (24, 11, 'Sturm', 1978.2600, true, 1);
INSERT INTO public.moon VALUES (25, 12, 'Centre Prime', 478.2800, false, 3);


--
-- Data for Name: moon_shape; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_shape VALUES (1, 'spherical', true);
INSERT INTO public.moon_shape VALUES (2, 'Ovoid', true);
INSERT INTO public.moon_shape VALUES (3, 'Oblong', true);
INSERT INTO public.moon_shape VALUES (4, 'Irregular', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, false, 9093.340000, NULL, 1, 'Mars', 1, false);
INSERT INTO public.planet VALUES (2, false, 17869.345000, NULL, 3, 'Naboo', 4, true);
INSERT INTO public.planet VALUES (3, true, 7000.340000, 'Species known as Homo Sapien along with various other fauna and flora', 1, 'Earth', 2, true);
INSERT INTO public.planet VALUES (4, false, 9345.345000, NULL, 3, 'Cerus8964', 4, true);
INSERT INTO public.planet VALUES (5, true, 87341.230000, 'Hostile plants and animals', 3, 'Felucia', 2, true);
INSERT INTO public.planet VALUES (6, true, 6783.000000, 'The last bastion of humanity in the darkness of the 41st millennium', 4, 'Holy Terra', 2, true);
INSERT INTO public.planet VALUES (7, false, 10234.000000, '', 5, 'Cadia', 2, true);
INSERT INTO public.planet VALUES (8, false, 18465.000000, '', 3, 'Jakku', 4, true);
INSERT INTO public.planet VALUES (9, false, 18465.000000, '', 3, 'Mustafar', 1, false);
INSERT INTO public.planet VALUES (10, true, 8934.540000, 'Crab people', 2, 'Crabobulon 5', 3, true);
INSERT INTO public.planet VALUES (11, false, 9845.546000, '', 3, 'Tempest', 3, false);
INSERT INTO public.planet VALUES (12, false, 78651.200000, '', 1, 'Ceres IV', 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 1, 100.3400, 100000.0000);
INSERT INTO public.star VALUES (2, 2, 'SunnySmiles', 1, 400.6780, 400000.0000);
INSERT INTO public.star VALUES (3, 3, 'UrsaMajor', 4, 598.3400, 987000.0000);
INSERT INTO public.star VALUES (4, 3, 'UrsaMinor', 5, 350.9870, 350000.0000);
INSERT INTO public.star VALUES (5, 5, 'Beta Proxima', 5, 2345.3400, 1987000.0000);
INSERT INTO public.star VALUES (8, 4, 'Proxima Centari', 1, 6786.9000, 7340.0000);
INSERT INTO public.star VALUES (9, 5, 'Beta Proxima II', 5, 2345.3400, 19870.0000);


--
-- Name: colour_colour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.colour_colour_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: shape_shape_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.shape_shape_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: colour colour_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colour
    ADD CONSTRAINT colour_pkey PRIMARY KEY (colour_id);


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
-- Name: moon_shape shape_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_shape
    ADD CONSTRAINT shape_pkey PRIMARY KEY (moon_shape_id);


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
-- Name: colour unique_colour; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.colour
    ADD CONSTRAINT unique_colour UNIQUE (name);


--
-- Name: moon_shape unique_shape_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_shape
    ADD CONSTRAINT unique_shape_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_shape_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_shape_id_fkey FOREIGN KEY (moon_shape_id) REFERENCES public.moon_shape(moon_shape_id);


--
-- Name: planet planet_colour_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_colour_id_fkey FOREIGN KEY (colour_id) REFERENCES public.colour(colour_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_colour_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_colour_id_fkey FOREIGN KEY (colour_id) REFERENCES public.colour(colour_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

