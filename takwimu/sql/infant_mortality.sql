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

ALTER TABLE IF EXISTS ONLY public.infant_mortality DROP CONSTRAINT IF EXISTS pk_infant_mortality;
DROP TABLE IF EXISTS public.infant_mortality;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: infant_mortality; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.infant_mortality (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: infant_mortality; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.infant_mortality (geo_level, geo_code, geo_version, year, total) FROM stdin;
country	KE	2009	1998	67.8
country	KE	2009	1999	65.9
country	KE	2009	2000	63.7
country	KE	2009	2001	61.3
country	KE	2009	2002	58.6
country	KE	2009	2003	55.7
country	KE	2009	2004	52.8
country	KE	2009	2005	49.6
country	KE	2009	2006	46.7
country	KE	2009	2007	44.2
country	KE	2009	2008	41.4
country	KE	2009	2009	39.9
country	KE	2009	2010	38.6
country	KE	2009	2011	37.4
country	KE	2009	2012	36.8
country	KE	2009	2013	35.8
country	KE	2009	2014	34.7
country	KE	2009	2015	33.3
country	KE	2009	2016	32.4
country	KE	2009	2017	31.8
country	KE	2009	2018	30.6
\.


--
-- Name: infant_mortality pk_infant_mortality; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.infant_mortality
    ADD CONSTRAINT pk_infant_mortality PRIMARY KEY (geo_level, geo_code, geo_version, year);


--
-- PostgreSQL database dump complete
--
