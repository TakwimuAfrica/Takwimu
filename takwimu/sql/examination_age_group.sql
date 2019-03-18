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

DROP TABLE IF EXISTS public.examination_age_group;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: examination_age_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.examination_age_group (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    examination character varying(128) NOT NULL,
    age_group character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: examination_age_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.examination_age_group (geo_level, geo_code, geo_version, examination, age_group, total) FROM stdin;
country	KE	2009	Self Examination	15-19	14
country	KE	2009	Self Examination	20-24	23
country	KE	2009	Self Examination	25-29	30
country	KE	2009	Self Examination	30-34	29
country	KE	2009	Self Examination	35-39	29
country	KE	2009	Self Examination	40-44	30
country	KE	2009	Self Examination	45-49	31
country	KE	2009	Self Examination	50-54	25
country	KE	2009	Examination by Medical Personel	15-19	3
country	KE	2009	Examination by Medical Personel	20-24	12
country	KE	2009	Examination by Medical Personel	25-29	17
country	KE	2009	Examination by Medical Personel	30-34	16
country	KE	2009	Examination by Medical Personel	35-39	16
country	KE	2009	Examination by Medical Personel	40-44	18
country	KE	2009	Examination by Medical Personel	45-49	18
country	KE	2009	Examination by Medical Personel	50-54	14
country	KE	2009	Both	15-19	3
country	KE	2009	Both	20-24	8
country	KE	2009	Both	25-29	13
country	KE	2009	Both	30-34	12
country	KE	2009	Both	35-39	12
country	KE	2009	Both	40-44	14
country	KE	2009	Both	45-49	14
country	KE	2009	Both	50-54	10
\.


--
-- PostgreSQL database dump complete
--

