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

DROP TABLE IF EXISTS public.violence_during_preg_educ_level;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: violence_during_preg_educ_level; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.violence_during_preg_educ_level (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    violence_during_preg_educ_level character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: violence_during_preg_educ_level; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.violence_during_preg_educ_level (geo_level, geo_code, geo_version, violence_during_preg_educ_level, total) FROM stdin;
country	KE	2009	no education	7
country	KE	2009	primary incomplete	12
country	KE	2009	primary complete	9
country	KE	2009	secondary+	7
\.


--
-- PostgreSQL database dump complete
--

