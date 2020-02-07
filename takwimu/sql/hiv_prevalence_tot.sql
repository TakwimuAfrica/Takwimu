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

ALTER TABLE IF EXISTS ONLY public.hiv_prevalence_tot DROP CONSTRAINT IF EXISTS pk_hiv_prevalence_tot;
DROP TABLE IF EXISTS public.hiv_prevalence_tot;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hiv_prevalence_tot; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hiv_prevalence_tot (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    prevalence_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: hiv_prevalence_tot; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hiv_prevalence_tot (geo_level, geo_code, geo_version, prevalence_year, total) FROM stdin;
country	NG	2009	1998	1.7
country	NG	2009	1999	1.7
country	NG	2009	2000	1.8
country	NG	2009	2001	1.8
country	NG	2009	2002	1.7
country	NG	2009	2003	1.7
country	NG	2009	2004	1.7
country	NG	2009	2005	1.7
country	NG	2009	2006	1.6
country	NG	2009	2007	1.6
country	NG	2009	2008	1.6
country	NG	2009	2009	1.6
country	NG	2009	2010	1.6
country	NG	2009	2011	1.6
country	NG	2009	2012	1.6
country	NG	2009	2013	1.6
country	NG	2009	2014	1.6
country	NG	2009	2015	1.6
country	NG	2009	2016	1.5
country	NG	2009	2017	1.5
country	NG	2009	2018	1.5
country	KE	2009	1997	11
country	KE	2009	1998	10.7
country	KE	2009	1999	10.3
country	KE	2009	2000	9.8
country	KE	2009	2001	9.3
country	KE	2009	2002	8.8
country	KE	2009	2003	8.2
country	KE	2009	2004	7.7
country	KE	2009	2005	7.3
country	KE	2009	2006	6.9
country	KE	2009	2007	6.6
country	KE	2009	2008	6.4
country	KE	2009	2009	6.2
country	KE	2009	2010	6
country	KE	2009	2011	5.8
country	KE	2009	2012	5.6
country	KE	2009	2013	5.5
country	KE	2009	2014	5.4
country	KE	2009	2015	5.2
country	KE	2009	2016	5.1
country	KE	2009	2017	4.9
country	KE	2009	2018	4.7
\.


--
-- Name: hiv_prevalence_tot pk_hiv_prevalence_tot; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hiv_prevalence_tot
    ADD CONSTRAINT pk_hiv_prevalence_tot PRIMARY KEY (geo_level, geo_code, geo_version, prevalence_year);


--
-- PostgreSQL database dump complete
--

