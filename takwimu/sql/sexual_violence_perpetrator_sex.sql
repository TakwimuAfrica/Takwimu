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

DROP TABLE IF EXISTS public.sexual_violence_perpetrator_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: sexual_violence_perpetrator_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sexual_violence_perpetrator_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    sexual_violence_perpetrator character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: sexual_violence_perpetrator_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sexual_violence_perpetrator_sex (geo_level, geo_code, geo_version, sexual_violence_perpetrator, sex, total) FROM stdin;
country	KE	2009	current partner	Female	56
country	KE	2009	former partner	Female	28
country	KE	2009	other relative	Female	3
country	KE	2009	family friend	Female	2
country	KE	2009	friend	Female	4
country	KE	2009	stranger	Female	6
country	KE	2009	employer	Female	1
country	KE	2009	other	Female	3
country	KE	2009	current partner	Male	37
country	KE	2009	former partner	Male	35
country	KE	2009	other relative	Male	1
country	KE	2009	family friend	Male	4
country	KE	2009	friend	Male	10
country	KE	2009	stranger	Male	8
country	KE	2009	employer	Male	6
country	KE	2009	other	Male	10
\.


--
-- PostgreSQL database dump complete
--

