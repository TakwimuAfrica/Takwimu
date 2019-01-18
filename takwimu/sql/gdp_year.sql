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
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

ALTER TABLE IF EXISTS ONLY public.gdp_year DROP CONSTRAINT IF EXISTS pk_gdp_year;
DROP TABLE IF EXISTS public.gdp_year;

--
-- Name: gdp_year; Type: TABLE; Schema: public; Owner: takwimu
--

CREATE TABLE public.gdp_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    gdp_year character varying(128) NOT NULL,
    total double precision
);


ALTER TABLE public.gdp_year OWNER TO takwimu;

--
-- Data for Name: gdp_year; Type: TABLE DATA; Schema: public; Owner: takwimu
--

COPY public.gdp_year (geo_level, geo_code, geo_version, gdp_year, total) FROM stdin;
country	ET	2009	1990	12175166763
country	ET	2009	1991	13463868357
country	ET	2009	1992	10492993078
country	ET	2009	1993	8830712714
country	ET	2009	1994	6927950565
country	ET	2009	1995	7663984568
country	ET	2009	1996	8547939731
country	ET	2009	1997	8589211390
country	ET	2009	1998	7818224906
country	ET	2009	1999	7700833482
country	ET	2009	2000	8242392104
country	ET	2009	2001	8231326016
country	ET	2009	2002	7850809498
country	ET	2009	2003	8623691300
country	ET	2009	2004	10131187261
country	ET	2009	2005	12401139454
country	ET	2009	2006	15280861835
country	ET	2009	2007	19707616773
country	ET	2009	2008	27066912635
country	ET	2009	2009	32437389116
country	ET	2009	2010	29933790334
country	ET	2009	2011	31952763089
country	ET	2009	2012	43310721414
country	ET	2009	2013	47648211133
country	ET	2009	2014	55612228234
country	ET	2009	2015	64464547915
country	ET	2009	2016	73000980434
country	ET	2009	2017	80561496134
\.


--
-- Name: gdp_year pk_gdp_year; Type: CONSTRAINT; Schema: public; Owner: takwimu
--

ALTER TABLE ONLY public.gdp_year
    ADD CONSTRAINT pk_gdp_year PRIMARY KEY (geo_level, geo_code, geo_version, gdp_year);


--
-- PostgreSQL database dump complete
--

