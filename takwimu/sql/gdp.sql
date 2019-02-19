--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.gdp DROP CONSTRAINT IF EXISTS pk_gdp;
DROP TABLE IF EXISTS public.gdp;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gdp; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gdp (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    gdp_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: gdp; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gdp (geo_level, geo_code, geo_version, gdp_year, total) FROM stdin;
\.


--
-- Name: gdp pk_gdp; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gdp
    ADD CONSTRAINT pk_gdp PRIMARY KEY (geo_level, geo_code, geo_version, gdp_year);


--
-- PostgreSQL database dump complete
--

