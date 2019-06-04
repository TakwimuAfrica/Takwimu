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

ALTER TABLE IF EXISTS ONLY public.women_in_parliament DROP CONSTRAINT IF EXISTS pk_women_in_parliament;
DROP TABLE IF EXISTS public.women_in_parliament;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: women_in_parliament; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.women_in_parliament (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    women_parliament_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: women_in_parliament; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.women_in_parliament (geo_level, geo_code, geo_version,  women_parliament_year, total) FROM stdin;
country	KE	2009	1997	3
country	KE	2009	1998	4
country	KE	2009	1999	4
country	KE	2009	2000	4
country	KE	2009	2001	4
country	KE	2009	2002	4
country	KE	2009	2003	7
country	KE	2009	2004	7
country	KE	2009	2005	7
country	KE	2009	2006	7
country	KE	2009	2007	7
country	KE	2009	2008	10
country	KE	2009	2009	10
country	KE	2009	2010	10
country	KE	2009	2011	10
country	KE	2009	2012	10
country	KE	2009	2013	19
country	KE	2009	2014	19
country	KE	2009	2015	20
country	KE	2009	2016	20
country	KE	2009	2017	22
\.


--
-- Name: women_in_parliament pk_women_in_parliament; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.women_in_parliament
    ADD CONSTRAINT pk_women_in_parliament PRIMARY KEY (geo_level, geo_code, geo_version,  women_parliament_year);


--
-- PostgreSQL database dump complete
--
