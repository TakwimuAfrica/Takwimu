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

ALTER TABLE IF EXISTS ONLY public.hiv_prevalence DROP CONSTRAINT IF EXISTS pk_hiv_prevalence;
DROP TABLE IF EXISTS public.hiv_prevalence;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hiv_prevalence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hiv_prevalence (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    hiv_prevalence_year character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: hiv_prevalence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hiv_prevalence (geo_level, geo_code, geo_version, hiv_prevalence_year, sex, total) FROM stdin;
country	ET	2009	2017	female	0
country	ET	2009	2016	female	0
country	ET	2009	2015	female	0
country	ET	2009	2014	female	0
country	ET	2009	2013	female	0
country	ET	2009	2012	female	0
country	ET	2009	2011	female	0
country	ET	2009	2010	female	1
country	ET	2009	2009	female	1
country	ET	2009	2008	female	1
country	ET	2009	2007	female	1
country	ET	2009	2006	female	1
country	ET	2009	2005	female	1
country	ET	2009	2004	female	1
country	ET	2009	2003	female	2
country	ET	2009	2002	female	2
country	ET	2009	2001	female	2
country	ET	2009	2000	female	3
country	KE	2009	2017	female	3
country	KE	2009	2016	female	3
country	KE	2009	2015	female	3
country	KE	2009	2014	female	3
country	KE	2009	2013	female	3
country	KE	2009	2012	female	3
country	KE	2009	2011	female	3
country	KE	2009	2010	female	3
country	KE	2009	2009	female	4
country	KE	2009	2008	female	4
country	KE	2009	2007	female	4
country	KE	2009	2006	female	4
country	KE	2009	2005	female	4
country	KE	2009	2004	female	4
country	KE	2009	2003	female	5
country	KE	2009	2002	female	5
country	KE	2009	2001	female	6
country	KE	2009	2000	female	7
country	NG	2009	2017	female	2
country	NG	2009	2016	female	2
country	NG	2009	2015	female	2
country	NG	2009	2014	female	2
country	NG	2009	2013	female	2
country	NG	2009	2012	female	2
country	NG	2009	2011	female	2
country	NG	2009	2010	female	2
country	NG	2009	2009	female	2
country	NG	2009	2008	female	2
country	NG	2009	2007	female	2
country	NG	2009	2006	female	2
country	NG	2009	2005	female	2
country	NG	2009	2004	female	3
country	NG	2009	2003	female	3
country	NG	2009	2002	female	3
country	NG	2009	2001	female	3
country	NG	2009	2000	female	3
country	SN	2009	2017	female	0
country	SN	2009	2016	female	0
country	SN	2009	2015	female	0
country	SN	2009	2014	female	0
country	SN	2009	2013	female	0
country	SN	2009	2012	female	0
country	SN	2009	2011	female	0
country	SN	2009	2010	female	0
country	SN	2009	2009	female	0
country	SN	2009	2008	female	0
country	SN	2009	2007	female	0
country	SN	2009	2006	female	1
country	SN	2009	2005	female	1
country	SN	2009	2004	female	1
country	SN	2009	2003	female	1
country	SN	2009	2002	female	1
country	SN	2009	2001	female	1
country	SN	2009	2000	female	1
country	TZ	2009	2017	female	2
country	TZ	2009	2016	female	2
country	TZ	2009	2015	female	2
country	TZ	2009	2014	female	2
country	TZ	2009	2013	female	3
country	TZ	2009	2012	female	3
country	TZ	2009	2011	female	3
country	TZ	2009	2010	female	3
country	TZ	2009	2009	female	3
country	TZ	2009	2008	female	3
country	TZ	2009	2007	female	3
country	TZ	2009	2006	female	3
country	TZ	2009	2005	female	3
country	TZ	2009	2004	female	4
country	TZ	2009	2003	female	4
country	TZ	2009	2002	female	4
country	TZ	2009	2001	female	5
country	TZ	2009	2000	female	5
country	ZA	2009	2017	female	10
country	ZA	2009	2016	female	10
country	ZA	2009	2015	female	10
country	ZA	2009	2014	female	10
country	ZA	2009	2013	female	11
country	ZA	2009	2012	female	11
country	ZA	2009	2011	female	11
country	ZA	2009	2010	female	11
country	ZA	2009	2009	female	12
country	ZA	2009	2008	female	12
country	ZA	2009	2007	female	12
country	ZA	2009	2006	female	13
country	ZA	2009	2005	female	13
country	ZA	2009	2004	female	14
country	ZA	2009	2003	female	15
country	ZA	2009	2002	female	15
country	ZA	2009	2001	female	16
country	ZA	2009	2000	female	16
country	ET	2009	2017	male	0
country	ET	2009	2016	male	0
country	ET	2009	2015	male	0
country	ET	2009	2014	male	0
country	ET	2009	2013	male	0
country	ET	2009	2012	male	0
country	ET	2009	2011	male	0
country	ET	2009	2010	male	0
country	ET	2009	2009	male	0
country	ET	2009	2008	male	0
country	ET	2009	2007	male	0
country	ET	2009	2006	male	0
country	ET	2009	2005	male	0
country	ET	2009	2004	male	0
country	ET	2009	2003	male	0
country	ET	2009	2002	male	1
country	ET	2009	2001	male	1
country	ET	2009	2000	male	1
country	KE	2009	2017	male	1
country	KE	2009	2016	male	1
country	KE	2009	2015	male	1
country	KE	2009	2014	male	2
country	KE	2009	2013	male	2
country	KE	2009	2012	male	2
country	KE	2009	2011	male	2
country	KE	2009	2010	male	2
country	KE	2009	2009	male	1
country	KE	2009	2008	male	1
country	KE	2009	2007	male	1
country	KE	2009	2006	male	1
country	KE	2009	2005	male	1
country	KE	2009	2004	male	2
country	KE	2009	2003	male	2
country	KE	2009	2002	male	2
country	KE	2009	2001	male	2
country	KE	2009	2000	male	2
country	NG	2009	2017	male	1
country	NG	2009	2016	male	1
country	NG	2009	2015	male	1
country	NG	2009	2014	male	1
country	NG	2009	2013	male	1
country	NG	2009	2012	male	1
country	NG	2009	2011	male	1
country	NG	2009	2010	male	1
country	NG	2009	2009	male	1
country	NG	2009	2008	male	2
country	NG	2009	2007	male	2
country	NG	2009	2006	male	2
country	NG	2009	2005	male	2
country	NG	2009	2004	male	2
country	NG	2009	2003	male	2
country	NG	2009	2002	male	2
country	NG	2009	2001	male	2
country	NG	2009	2000	male	3
country	SN	2009	2017	male	0
country	SN	2009	2016	male	0
country	SN	2009	2015	male	0
country	SN	2009	2014	male	0
country	SN	2009	2013	male	0
country	SN	2009	2012	male	0
country	SN	2009	2011	male	0
country	SN	2009	2010	male	0
country	SN	2009	2009	male	0
country	SN	2009	2008	male	0
country	SN	2009	2007	male	0
country	SN	2009	2006	male	0
country	SN	2009	2005	male	0
country	SN	2009	2004	male	0
country	SN	2009	2003	male	0
country	SN	2009	2002	male	0
country	SN	2009	2001	male	0
country	SN	2009	2000	male	0
country	TZ	2009	2017	male	1
country	TZ	2009	2016	male	1
country	TZ	2009	2015	male	1
country	TZ	2009	2014	male	1
country	TZ	2009	2013	male	1
country	TZ	2009	2012	male	1
country	TZ	2009	2011	male	1
country	TZ	2009	2010	male	1
country	TZ	2009	2009	male	1
country	TZ	2009	2008	male	1
country	TZ	2009	2007	male	1
country	TZ	2009	2006	male	1
country	TZ	2009	2005	male	2
country	TZ	2009	2004	male	2
country	TZ	2009	2003	male	2
country	TZ	2009	2002	male	2
country	TZ	2009	2001	male	2
country	TZ	2009	2000	male	2
country	ZA	2009	2017	male	4
country	ZA	2009	2016	male	4
country	ZA	2009	2015	male	4
country	ZA	2009	2014	male	4
country	ZA	2009	2013	male	4
country	ZA	2009	2012	male	4
country	ZA	2009	2011	male	4
country	ZA	2009	2010	male	4
country	ZA	2009	2009	male	4
country	ZA	2009	2008	male	4
country	ZA	2009	2007	male	4
country	ZA	2009	2006	male	5
country	ZA	2009	2005	male	5
country	ZA	2009	2004	male	5
country	ZA	2009	2003	male	5
country	ZA	2009	2002	male	5
country	ZA	2009	2001	male	6
country	ZA	2009	2000	male	6
\.


--
-- Name: hiv_prevalence pk_hiv_prevalence; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hiv_prevalence
    ADD CONSTRAINT pk_hiv_prevalence PRIMARY KEY (geo_level, geo_code, geo_version, hiv_prevalence_year, sex);


--
-- PostgreSQL database dump complete
--

