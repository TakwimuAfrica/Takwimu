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

DROP TABLE IF EXISTS public.sex_year_wage_education;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: sex_year_wage_education; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sex_year_wage_education (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    sex character varying(128) NOT NULL,
    year_wage_education character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: sex_year_wage_education; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sex_year_wage_education (geo_level, geo_code, geo_version, sex, year_wage_education, total) FROM stdin;
country	KE	2009	Male	2010	220
country	KE	2009	Male	2011	221
country	KE	2009	Male	2012	221
country	KE	2009	Male	2013	232
country	KE	2009	Male	2014	252
country	KE	2009	Male	2015	268
country	KE	2009	Male	2016	276
country	KE	2009	Female	2010	168
country	KE	2009	Female	2011	179
country	KE	2009	Female	2012	164
country	KE	2009	Female	2013	168
country	KE	2009	Female	2014	218
country	KE	2009	Female	2015	240
country	KE	2009	Female	2016	249
\.


--
-- PostgreSQL database dump complete
--

