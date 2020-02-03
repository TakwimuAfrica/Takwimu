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

ALTER TABLE IF EXISTS ONLY public.arable_land DROP CONSTRAINT IF EXISTS pk_arable_land;
DROP TABLE IF EXISTS public.arable_land;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: arable_land; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.arable_land (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    arable_land_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: arable_land; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.arable_land (geo_level, geo_code, geo_version, arable_land_year, total) FROM stdin;
country	NG	2009	1996	36.343
country	NG	2009	1997	36.453
country	NG	2009	1998	37.331
country	NG	2009	1999	38.429
country	NG	2009	2000	38.429
country	NG	2009	2001	36.233
country	NG	2009	2002	37.331
country	NG	2009	2003	38.429
country	NG	2009	2004	38.429
country	NG	2009	2005	39.527
country	NG	2009	2006	40.405
country	NG	2009	2007	40.625
country	NG	2009	2008	39.527
country	NG	2009	2009	35.135
country	NG	2009	2010	36.233
country	NG	2009	2011	37.331
country	NG	2009	2012	38.429
country	NG	2009	2013	37.331
country	NG	2009	2014	37.331
country	NG	2009	2015	37.331
country	NG	2009	2016	37.331
\.


--
-- Name: arable_land pk_arable_land; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.arable_land
    ADD CONSTRAINT pk_arable_land PRIMARY KEY (geo_level, geo_code, geo_version, arable_land_year);


--
-- PostgreSQL database dump complete
--
