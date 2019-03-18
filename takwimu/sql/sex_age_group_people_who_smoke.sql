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

DROP TABLE IF EXISTS public.sex_age_group_people_who_smoke;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: sex_age_group_people_who_smoke; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sex_age_group_people_who_smoke (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    sex character varying(128) NOT NULL,
    age_group_people_who_smoke character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: sex_age_group_people_who_smoke; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sex_age_group_people_who_smoke (geo_level, geo_code, geo_version, sex, age_group_people_who_smoke, total) FROM stdin;
country	KE	2009	Male	15-19	2
country	KE	2009	Male	20-24	9
country	KE	2009	Male	25-29	17
country	KE	2009	Male	30-34	23
country	KE	2009	Male	35-39	25
country	KE	2009	Male	40-44	24
country	KE	2009	Male	45-49	28
country	KE	2009	Male	50-54	16
country	KE	2009	Female	15-19	0
country	KE	2009	Female	20-24	0
country	KE	2009	Female	25-29	1
country	KE	2009	Female	30-34	1
country	KE	2009	Female	35-39	1
country	KE	2009	Female	40-44	0
country	KE	2009	Female	45-49	1
country	KE	2009	Female	50-54	0
\.


--
-- PostgreSQL database dump complete
--

