--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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

DROP DATABASE periodic_table;
--
-- Name: periodic_table; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE periodic_table WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE periodic_table OWNER TO postgres;

\connect periodic_table

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
-- Name: elements; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.elements (
    atomic_number integer NOT NULL,
    symbol character varying(2) NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.elements OWNER TO freecodecamp;

--
-- Name: joined_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.joined_table (
    atomic_number integer,
    element_type character varying(30),
    melting_point_celsius numeric,
    boiling_point_celsius numeric,
    atomic_mass real,
    symbol character varying(2),
    name character varying(40)
);


ALTER TABLE public.joined_table OWNER TO freecodecamp;

--
-- Name: properties; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.properties (
    atomic_number integer NOT NULL,
    element_type character varying(30),
    melting_point_celsius numeric NOT NULL,
    boiling_point_celsius numeric NOT NULL,
    type_id integer NOT NULL,
    atomic_mass real
);


ALTER TABLE public.properties OWNER TO freecodecamp;

--
-- Name: types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.types (
    type_id integer NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE public.types OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_type_id_seq OWNER TO freecodecamp;

--
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.types.type_id;


--
-- Name: types type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types ALTER COLUMN type_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.elements VALUES (1, 'H', 'Hydrogen');
INSERT INTO public.elements VALUES (2, 'He', 'Helium');
INSERT INTO public.elements VALUES (3, 'Li', 'Lithium');
INSERT INTO public.elements VALUES (4, 'Be', 'Beryllium');
INSERT INTO public.elements VALUES (5, 'B', 'Boron');
INSERT INTO public.elements VALUES (6, 'C', 'Carbon');
INSERT INTO public.elements VALUES (7, 'N', 'Nitrogen');
INSERT INTO public.elements VALUES (8, 'O', 'Oxygen');
INSERT INTO public.elements VALUES (10, 'Ne', 'Neon');
INSERT INTO public.elements VALUES (9, 'F', 'Fluorine');


--
-- Data for Name: joined_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.joined_table VALUES (3, 'metal', 180.54, 1342, 6.94, 'Li', 'Lithium');
INSERT INTO public.joined_table VALUES (4, 'metal', 1287, 2470, 9.012, 'Be', 'Beryllium');
INSERT INTO public.joined_table VALUES (1, 'nonmetal', -259.1, -252.9, 1.008, 'H', 'Hydrogen');
INSERT INTO public.joined_table VALUES (2, 'nonmetal', -272.2, -269, 4.003, 'He', 'Helium');
INSERT INTO public.joined_table VALUES (6, 'nonmetal', 3550, 4027, 12.011, 'C', 'Carbon');
INSERT INTO public.joined_table VALUES (7, 'nonmetal', -210.1, -195.8, 14.007, 'N', 'Nitrogen');
INSERT INTO public.joined_table VALUES (8, 'nonmetal', -218, -183, 15.999, 'O', 'Oxygen');
INSERT INTO public.joined_table VALUES (5, 'metalloid', 2075, 4000, 10.81, 'B', 'Boron');
INSERT INTO public.joined_table VALUES (9, 'nonmetal', -220, -188.1, 18.998, 'F', 'Fluorine');
INSERT INTO public.joined_table VALUES (10, 'nonmetal', -248.6, -246.1, 20.18, 'Ne', 'Neon');


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.properties VALUES (3, 'metal', 180.54, 1342, 1, 6.94);
INSERT INTO public.properties VALUES (4, 'metal', 1287, 2470, 1, 9.012);
INSERT INTO public.properties VALUES (1, 'nonmetal', -259.1, -252.9, 2, 1.008);
INSERT INTO public.properties VALUES (2, 'nonmetal', -272.2, -269, 2, 4.003);
INSERT INTO public.properties VALUES (6, 'nonmetal', 3550, 4027, 2, 12.011);
INSERT INTO public.properties VALUES (7, 'nonmetal', -210.1, -195.8, 2, 14.007);
INSERT INTO public.properties VALUES (8, 'nonmetal', -218, -183, 2, 15.999);
INSERT INTO public.properties VALUES (5, 'metalloid', 2075, 4000, 3, 10.81);
INSERT INTO public.properties VALUES (9, 'nonmetal', -220, -188.1, 2, 18.998);
INSERT INTO public.properties VALUES (10, 'nonmetal', -248.6, -246.1, 2, 20.18);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.types VALUES (1, 'metal');
INSERT INTO public.types VALUES (2, 'nonmetal');
INSERT INTO public.types VALUES (3, 'metalloid');


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.types_type_id_seq', 3, true);


--
-- Name: elements elements_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_atomic_number_key UNIQUE (atomic_number);


--
-- Name: elements elements_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (atomic_number);


--
-- Name: elements name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: properties properties_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_atomic_number_key UNIQUE (atomic_number);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (atomic_number);


--
-- Name: elements symbol_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT symbol_unique UNIQUE (symbol);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


--
-- Name: properties fk_atomic_number; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT fk_atomic_number FOREIGN KEY (atomic_number) REFERENCES public.elements(atomic_number);


--
-- Name: properties fk_type_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT fk_type_id FOREIGN KEY (type_id) REFERENCES public.types(type_id);


--
-- PostgreSQL database dump complete
--

