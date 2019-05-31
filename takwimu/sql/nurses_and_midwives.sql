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

ALTER TABLE IF EXISTS ONLY public.nurses_and_midwives DROP CONSTRAINT IF EXISTS pk_nurses_and_midwives;
DROP TABLE IF EXISTS public.nurses_and_midwives;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: nurses_and_midwives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nurses_and_midwives (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    nurses_and_midwives_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: nurses_and_midwives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.nurses_and_midwives (geo_level, geo_code, geo_version, nurses_and_midwives_year, total) FROM stdin;
country	ET	2009	2010	0
country	ET	2009	2009	0
country	ET	2009	2008	0
country	ET	2009	2007	0
country	ET	2009	2006	0
country	ET	2009	2005	0
country	ET	2009	2004	0
country	ET	2009	2003	0
country	KE	2009	2014	2
country	KE	2009	2013	1
country	KE	2009	2012	1
country	KE	2009	2011	1
country	KE	2009	2010	1
country	KE	2009	2009	0
country	KE	2009	2008	0
country	KE	2009	2004	0
country	NG	2009	2010	2
country	NG	2009	2008	1
country	NG	2009	2007	1
country	NG	2009	2006	1
country	NG	2009	2005	2
country	NG	2009	2003	2
country	SN	2009	2016	0
country	SN	2009	2010	0
country	SN	2009	2008	0
country	SN	2009	2004	0
country	TZ	2009	2014	0
country	TZ	2009	2012	0
country	TZ	2009	2010	0
country	TZ	2009	2006	0
country	TZ	2009	2002	0
country	ZA	2009	2016	5
country	ZA	2009	2015	6
country	ZA	2009	2014	6
country	ZA	2009	2013	6
country	ZA	2009	2012	6
country	ZA	2009	2011	6
country	ZA	2009	2010	5
country	ZA	2009	2009	4
country	ZA	2009	2008	4
country	ZA	2009	2007	4
country	ZA	2009	2006	4
country	ZA	2009	2005	4
country	ZA	2009	2004	4
country	ZA	2009	2003	4
country	ZA	2009	2002	4
country	ZA	2009	2001	4
country	ZA	2009	2000	4
\.


--
-- Name: nurses_and_midwives pk_nurses_and_midwives; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nurses_and_midwives
    ADD CONSTRAINT pk_nurses_and_midwives PRIMARY KEY (geo_level, geo_code, geo_version, nurses_and_midwives_year);


--
-- PostgreSQL database dump complete
--

