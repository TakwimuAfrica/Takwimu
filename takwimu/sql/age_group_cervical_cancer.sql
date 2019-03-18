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

DROP TABLE IF EXISTS public.age_group_cervical_cancer;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: age_group_cervical_cancer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.age_group_cervical_cancer (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    age_group character varying(128) NOT NULL,
    cervical_cancer character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: age_group_cervical_cancer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.age_group_cervical_cancer (geo_level, geo_code, geo_version, age_group, cervical_cancer, total) FROM stdin;
country	KE	2009	15-19	Heard of Cervical Cancer	59
country	KE	2009	20-24	Heard of Cervical Cancer	76
country	KE	2009	25-29	Heard of Cervical Cancer	80
country	KE	2009	30-34	Heard of Cervical Cancer	84
country	KE	2009	35-39	Heard of Cervical Cancer	80
country	KE	2009	40-44	Heard of Cervical Cancer	82
country	KE	2009	45-49	Heard of Cervical Cancer	81
country	KE	2009	50-54	Heard of Cervical Cancer	76
country	KE	2009	15-19	Examined for Cervical Cancer	2
country	KE	2009	20-24	Examined for Cervical Cancer	10
country	KE	2009	25-29	Examined for Cervical Cancer	15
country	KE	2009	30-34	Examined for Cervical Cancer	19
country	KE	2009	35-39	Examined for Cervical Cancer	19
country	KE	2009	40-44	Examined for Cervical Cancer	22
country	KE	2009	45-49	Examined for Cervical Cancer	20
country	KE	2009	50-54	Examined for Cervical Cancer	14
\.


--
-- PostgreSQL database dump complete
--

