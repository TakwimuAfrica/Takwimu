--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.physicians_nurses_and_midwives DROP CONSTRAINT IF EXISTS pk_physicians_nurses_and_midwives;
DROP TABLE IF EXISTS public.physicians_nurses_and_midwives;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: physicians_nurses_and_midwives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.physicians_nurses_and_midwives (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    workers character varying(128) NOT NULL,
    year character varying(128) NOT NULL,
    total double precision
);


--
-- Data for Name: physicians_nurses_and_midwives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.physicians_nurses_and_midwives (geo_level, geo_code, geo_version, workers, year, total) FROM stdin;
country	NG	2009	Nurses and midwives	2003	1.5936
country	NG	2009	Nurses and midwives	2005	1.5361
country	NG	2009	Nurses and midwives	2006	1.5026
country	NG	2009	Nurses and midwives	2007	1.4985
country	NG	2009	Nurses and midwives	2008	1.4962
country	NG	2009	Nurses and midwives	2009	1.0762
country	NG	2009	Nurses and midwives	2010	1.3561
country	NG	2009	Nurses and midwives	2013	1.4524
country	NG	2009	Physicians	2003	0.2646
country	NG	2009	Physicians	2005	0.2822
country	NG	2009	Physicians	2006	0.3479
country	NG	2009	Physicians	2007	0.3782
country	NG	2009	Physicians	2008	0.376
country	NG	2009	Physicians	2009	0.378
country	NG	2009	Physicians	2010	0.1836
country	NG	2009	Physicians	2013	0.3827
\.


--
-- Name: physicians_nurses_and_midwives pk_physicians_nurses_and_midwives; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.physicians_nurses_and_midwives
    ADD CONSTRAINT pk_physicians_nurses_and_midwives PRIMARY KEY (geo_level, geo_code, geo_version, workers, year);


--
-- PostgreSQL database dump complete
--

