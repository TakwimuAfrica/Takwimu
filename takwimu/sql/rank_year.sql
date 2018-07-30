--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.rank_year DROP CONSTRAINT IF EXISTS pk_rank_year;
DROP TABLE IF EXISTS public.rank_year;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: rank_year; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rank_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Rank" character varying(128) NOT NULL,
    year character varying(128) NOT NULL,
    total double precision
);


--
-- Data for Name: rank_year; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rank_year (geo_level, geo_code, geo_version, "Rank", year, total) FROM stdin;
country	NG	2009	152	2003	0.445000000000000007
country	SN	2009	162	2003	0.407999999999999974
country	TZ	2009	151	2003	0.419999999999999984
country	NG	2009	152	2004	0.463000000000000023
country	SN	2009	162	2004	0.41499999999999998
country	TZ	2009	151	2004	0.431999999999999995
country	NG	2009	152	2005	0.466000000000000025
country	SN	2009	162	2005	0.421999999999999986
country	TZ	2009	151	2005	0.446000000000000008
country	NG	2009	152	2006	0.47699999999999998
country	SN	2009	162	2006	0.424999999999999989
country	TZ	2009	151	2006	0.457000000000000017
country	NG	2009	152	2007	0.480999999999999983
country	SN	2009	162	2007	0.434999999999999998
country	TZ	2009	151	2007	0.468000000000000027
country	NG	2009	152	2008	0.486999999999999988
country	SN	2009	162	2008	0.444000000000000006
country	TZ	2009	151	2008	0.47799999999999998
country	NG	2009	152	2009	0.491999999999999993
country	SN	2009	162	2009	0.44900000000000001
country	TZ	2009	151	2009	0.487999999999999989
country	NG	2009	152	2010	0.5
country	SN	2009	162	2010	0.455000000000000016
country	TZ	2009	151	2010	0.497999999999999998
country	NG	2009	152	2011	0.507000000000000006
country	SN	2009	162	2011	0.463000000000000023
country	TZ	2009	151	2011	0.504000000000000004
country	NG	2009	152	2012	0.514000000000000012
country	SN	2009	162	2012	0.473999999999999977
country	TZ	2009	151	2012	0.513000000000000012
country	NG	2009	152	2013	0.521000000000000019
country	SN	2009	162	2013	0.482999999999999985
country	TZ	2009	151	2013	0.512000000000000011
country	NG	2009	152	2014	0.525000000000000022
country	SN	2009	162	2014	0.490999999999999992
country	TZ	2009	151	2014	0.519000000000000017
country	NG	2009	152	2015	0.527000000000000024
country	SN	2009	162	2015	0.493999999999999995
country	TZ	2009	151	2015	0.531000000000000028
\.


--
-- Name: rank_year pk_rank_year; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rank_year
    ADD CONSTRAINT pk_rank_year PRIMARY KEY (geo_level, geo_code, geo_version, "Rank", year);


--
-- PostgreSQL database dump complete
--

