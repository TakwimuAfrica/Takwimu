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

DROP TABLE IF EXISTS public.year_wage_wholesale_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: year_wage_wholesale_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.year_wage_wholesale_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year_wage_wholesale character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: year_wage_wholesale_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.year_wage_wholesale_sex (geo_level, geo_code, geo_version, year_wage_wholesale, sex, total) FROM stdin;
country	KE	2009	2010	Male	166
country	KE	2009	2011	Male	167
country	KE	2009	2012	Male	147
country	KE	2009	2013	Male	159
country	KE	2009	2014	Male	165
country	KE	2009	2015	Male	179
country	KE	2009	2016	Male	186
country	KE	2009	2010	Female	61
country	KE	2009	2011	Female	71
country	KE	2009	2012	Female	51
country	KE	2009	2013	Female	53
country	KE	2009	2014	Female	55
country	KE	2009	2015	Female	53
country	KE	2009	2016	Female	54
\.


--
-- PostgreSQL database dump complete
--

