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

ALTER TABLE IF EXISTS ONLY public.fgm_prevalence DROP CONSTRAINT IF EXISTS pk_fgm_prevalence;
DROP TABLE IF EXISTS public.fgm_prevalence;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: fgm_prevalence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fgm_prevalence (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    fgm_prevalence_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: fgm_prevalence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fgm_prevalence (geo_level, geo_code, geo_version, fgm_prevalence_year, total) FROM stdin;
country	BF	2009	1999	72
country	BF	2009	2003	77
country	BF	2009	2006	73
country	BF	2009	2010	76
country	ET	2009	2000	80
country	ET	2009	2005	74
country	ET	2009	2016	65
country	KE	2009	1998	38
country	KE	2009	2003	32
country	KE	2009	2009	27
country	KE	2009	2014	21
country	NG	2009	2003	19
country	NG	2009	2008	30
country	NG	2009	2011	27
country	NG	2009	2013	25
country	SN	2009	2005	28
country	SN	2009	2011	26
country	SN	2009	2014	25
country	SN	2009	2015	24
country	SN	2009	2016	23
country	TZ	2009	1996	18
country	TZ	2009	2005	15
country	TZ	2009	2010	15
country	TZ	2009	2016	10
\.


--
-- Name: fgm_prevalence pk_fgm_prevalence; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fgm_prevalence
    ADD CONSTRAINT pk_fgm_prevalence PRIMARY KEY (geo_level, geo_code, geo_version, fgm_prevalence_year);


--
-- PostgreSQL database dump complete
--
