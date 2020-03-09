--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.population_sex_et DROP CONSTRAINT IF EXISTS pk_population_sex_et;
DROP TABLE IF EXISTS public.population_sex_et;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_sex_et; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_sex_et (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "population_sex_et" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_sex_et; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_sex_et (geo_level, geo_code, geo_version, "population_sex_et", total) FROM stdin;
country	ET	2009	male	54635339
country	ET	2009	female	54589220
\.


--
-- Name: population_sex_et pk_population_sex_et; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_sex_et
    ADD CONSTRAINT pk_population_sex_et PRIMARY KEY (geo_level, geo_code, geo_version, "population_sex_et");


--
-- PostgreSQL database dump complete
--

