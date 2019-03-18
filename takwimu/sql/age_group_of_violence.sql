--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP TABLE IF EXISTS public.age_group_of_violence;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: age_group_of_violence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.age_group_of_violence (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    age_group_of_violence character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: age_group_of_violence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.age_group_of_violence (geo_level, geo_code, geo_version, age_group_of_violence, total) FROM stdin;
country	KE	2009	15-19	6
country	KE	2009	20-24	9
country	KE	2009	25-29	11
country	KE	2009	30-39	8
country	KE	2009	40-49	9
country	KE	2009	15-49	9
\.


--
-- PostgreSQL database dump complete
--

