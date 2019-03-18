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

DROP TABLE IF EXISTS public.hypertension_or_diabetes_sex_agegroup;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hypertension_or_diabetes_sex_agegroup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hypertension_or_diabetes_sex_agegroup (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    hypertension_or_diabetes character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    agegroup character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: hypertension_or_diabetes_sex_agegroup; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hypertension_or_diabetes_sex_agegroup (geo_level, geo_code, geo_version, hypertension_or_diabetes, sex, agegroup, total) FROM stdin;
country	KE	2009	Hypertension	Male	15-19	1
country	KE	2009	Hypertension	Male	20-24	2
country	KE	2009	Hypertension	Male	25-29	2
country	KE	2009	Hypertension	Male	30-34	5
country	KE	2009	Hypertension	Male	35-39	4
country	KE	2009	Hypertension	Male	40-44	5
country	KE	2009	Hypertension	Male	45-49	7
country	KE	2009	Hypertension	Male	49-54	3
country	KE	2009	Diabetes	Male	15-19	0
country	KE	2009	Diabetes	Male	20-24	1
country	KE	2009	Diabetes	Male	25-29	1
country	KE	2009	Diabetes	Male	30-34	1
country	KE	2009	Diabetes	Male	35-39	1
country	KE	2009	Diabetes	Male	40-44	2
country	KE	2009	Diabetes	Male	45-49	0
country	KE	2009	Diabetes	Female	15-19	1
country	KE	2009	Diabetes	Female	20-24	1
country	KE	2009	Diabetes	Female	25-29	1
country	KE	2009	Diabetes	Female	30-34	1
country	KE	2009	Diabetes	Female	35-39	2
country	KE	2009	Diabetes	Female	40-44	3
country	KE	2009	Diabetes	Female	45-49	1
country	KE	2009	Hypertension	Female	15-19	3
country	KE	2009	Hypertension	Female	20-24	6
country	KE	2009	Hypertension	Female	25-29	10
country	KE	2009	Hypertension	Female	30-34	11
country	KE	2009	Hypertension	Female	35-39	12
country	KE	2009	Hypertension	Female	40-44	17
country	KE	2009	Hypertension	Female	45-49	18
\.


--
-- PostgreSQL database dump complete
--

