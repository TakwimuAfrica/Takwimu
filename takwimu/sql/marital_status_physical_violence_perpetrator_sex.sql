--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP TABLE IF EXISTS public.marital_status_physical_violence_perpetrator_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: marital_status_physical_violence_perpetrator_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marital_status_physical_violence_perpetrator_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    marital_status character varying(128) NOT NULL,
    physical_violence_perpetrator character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: marital_status_physical_violence_perpetrator_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.marital_status_physical_violence_perpetrator_sex (geo_level, geo_code, geo_version, marital_status, physical_violence_perpetrator, sex, total) FROM stdin;
country	KE	2009	Married	current partner	Male	11
country	KE	2009	Married	former partner	Male	9
country	KE	2009	Married	father/step-father	Male	19
country	KE	2009	Married	mother/step-mother	Male	14
country	KE	2009	Married	sister/brother	Male	8
country	KE	2009	Married	other relative	Male	9
country	KE	2009	Married	teacher	Male	29
country	KE	2009	Married	current partner	Female	57
country	KE	2009	Married	former partner	Female	24
country	KE	2009	Married	father/step-father	Female	11
country	KE	2009	Married	mother/step-mother	Female	17
country	KE	2009	Married	sister/brother	Female	7
country	KE	2009	Married	other relative	Female	5
country	KE	2009	Married	teacher	Female	12
country	KE	2009	Single	current partner	Male	0
country	KE	2009	SIngle	former partner	Male	0
country	KE	2009	Single	father/step-father	Male	21
country	KE	2009	Single	mother/step-mother	Male	14
country	KE	2009	Single	sister/brother	Male	10
country	KE	2009	Single	other relative	Male	7
country	KE	2009	Single	teacher	Male	46
country	KE	2009	Single	current partner	Female	0
country	KE	2009	Single	former partner	Female	0
country	KE	2009	Single	father/step-father	Female	19
country	KE	2009	Single	mother/step-mother	Female	40
country	KE	2009	Single	sister/brother	Female	8
country	KE	2009	Single	other relative	Female	13
country	KE	2009	Single	teacher	Female	48
\.


--
-- PostgreSQL database dump complete
--

