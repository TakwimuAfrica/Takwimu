--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.residence_poverty_type DROP CONSTRAINT IF EXISTS pk_residence_poverty_type;
DROP TABLE IF EXISTS public.residence_poverty_type;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: residence_poverty_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.residence_poverty_type (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    residence character varying(128) NOT NULL,
    poverty_type character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: residence_poverty_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.residence_poverty_type (geo_level, geo_code, geo_version, residence, poverty_type, total) FROM stdin;
country	KE	2009	Rural	Food poverty	36
country	KE	2009	Rural	Overall poverty	40
country	KE	2009	Rural	Harcore poverty	11
country	KE	2009	Peri-urban	Food poverty	29
country	KE	2009	Peri-urban	Overall poverty	28
country	KE	2009	Peri-urban	Harcore poverty	6
country	KE	2009	Core-Urban	Food poverty	24
country	KE	2009	Core-Urban	Overall poverty	29
country	KE	2009	Core-Urban	Harcore poverty	3
\.


--
-- Name: residence_poverty_type pk_residence_poverty_type; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.residence_poverty_type
    ADD CONSTRAINT pk_residence_poverty_type PRIMARY KEY (geo_level, geo_code, geo_version, residence, poverty_type);


--
-- PostgreSQL database dump complete
--

