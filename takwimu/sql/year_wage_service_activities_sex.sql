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

DROP TABLE IF EXISTS public.year_wage_service_activities_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: year_wage_service_activities_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.year_wage_service_activities_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year_wage_service_activities character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: year_wage_service_activities_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.year_wage_service_activities_sex (geo_level, geo_code, geo_version, year_wage_service_activities, sex, total) FROM stdin;
country	KE	2009	2010	Male	64
country	KE	2009	2011	Male	65
country	KE	2009	2012	Male	42
country	KE	2009	2013	Male	45
country	KE	2009	2014	Male	50
country	KE	2009	2015	Male	60
country	KE	2009	2016	Male	61
country	KE	2009	2010	Female	42
country	KE	2009	2011	Female	42
country	KE	2009	2012	Female	63
country	KE	2009	2013	Female	68
country	KE	2009	2014	Female	66
country	KE	2009	2015	Female	64
country	KE	2009	2016	Female	66
\.


--
-- PostgreSQL database dump complete
--

