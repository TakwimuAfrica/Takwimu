--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.seized_firearms DROP CONSTRAINT IF EXISTS pk_seized_firearms;
DROP TABLE IF EXISTS public.seized_firearms;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: seized_firearms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.seized_firearms (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year character varying(128) NOT NULL,
    type character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: seized_firearms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.seized_firearms (geo_level, geo_code, geo_version, year, type, total) FROM stdin;
country	KE	2009	2013	Riffles	185
country	KE	2009	2013	Pistols	77
country	KE	2009	2013	Ammunition	4211
country	KE	2009	2014	Riffles	211
country	KE	2009	2014	Pistols	142
country	KE	2009	2014	Ammunition	5173
country	KE	2009	2015	Riffles	142
country	KE	2009	2015	Pistols	81
country	KE	2009	2015	Ammunition	5007
country	KE	2009	2016	Riffles	93
country	KE	2009	2016	Pistols	152
country	KE	2009	2016	Ammunition	4711
country	KE	2009	2017	Riffles	51
country	KE	2009	2017	Pistols	66
country	KE	2009	2017	Ammunition	2655
\.


--
-- Name: seized_firearms pk_seized_firearms; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seized_firearms
    ADD CONSTRAINT pk_seized_firearms PRIMARY KEY (geo_level, geo_code, geo_version, year, type);


--
-- PostgreSQL database dump complete
--

