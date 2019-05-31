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

ALTER TABLE IF EXISTS ONLY public.gdp_per_capita_growth DROP CONSTRAINT IF EXISTS pk_gdp_per_capita_growth;
DROP TABLE IF EXISTS public.gdp_per_capita_growth;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gdp_per_capita_growth; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gdp_per_capita_growth (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    gdp_per_capita_growth_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: gdp_per_capita_growth; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gdp_per_capita_growth (geo_level, geo_code, geo_version, gdp_per_capita_growth_year, total) FROM stdin;
country	ET	2009	2017	8
country	ET	2009	2016	5
country	ET	2009	2015	8
country	ET	2009	2014	7
country	ET	2009	2013	8
country	ET	2009	2012	6
country	ET	2009	2011	8
country	ET	2009	2010	10
country	ET	2009	2009	6
country	ET	2009	2008	8
country	ET	2009	2007	8
country	ET	2009	2006	8
country	ET	2009	2005	9
country	ET	2009	2004	10
country	ET	2009	2003	-5
country	ET	2009	2002	-1
country	ET	2009	2001	5
country	ET	2009	2000	3
country	KE	2009	2017	2
country	KE	2009	2016	3
country	KE	2009	2015	3
country	KE	2009	2014	3
country	KE	2009	2013	3
country	KE	2009	2012	2
country	KE	2009	2011	3
country	KE	2009	2010	5
country	KE	2009	2009	1
country	KE	2009	2008	-2
country	KE	2009	2007	4
country	KE	2009	2006	4
country	KE	2009	2005	3
country	KE	2009	2004	2
country	KE	2009	2003	0
country	KE	2009	2002	-2
country	KE	2009	2001	1
country	KE	2009	2000	-2
country	NG	2009	2017	-2
country	NG	2009	2016	-4
country	NG	2009	2015	0
country	NG	2009	2014	4
country	NG	2009	2013	4
country	NG	2009	2012	1
country	NG	2009	2011	3
country	NG	2009	2010	5
country	NG	2009	2009	5
country	NG	2009	2008	4
country	NG	2009	2007	4
country	NG	2009	2006	3
country	NG	2009	2005	4
country	NG	2009	2004	6
country	NG	2009	2003	5
country	NG	2009	2002	12
country	NG	2009	2001	3
country	NG	2009	2000	2
country	SN	2009	2017	4
country	SN	2009	2016	3
country	SN	2009	2015	3
country	SN	2009	2014	3
country	SN	2009	2013	0
country	SN	2009	2012	2
country	SN	2009	2011	-1
country	SN	2009	2010	1
country	SN	2009	2009	-1
country	SN	2009	2008	1
country	SN	2009	2007	2
country	SN	2009	2006	0
country	SN	2009	2005	3
country	SN	2009	2004	3
country	SN	2009	2003	4
country	SN	2009	2002	-2
country	SN	2009	2001	2
country	SN	2009	2000	1
country	TZ	2009	2017	4
country	TZ	2009	2016	4
country	TZ	2009	2015	4
country	TZ	2009	2014	4
country	TZ	2009	2013	4
country	TZ	2009	2012	2
country	TZ	2009	2011	5
country	TZ	2009	2010	3
country	TZ	2009	2009	2
country	TZ	2009	2008	2
country	TZ	2009	2007	5
country	TZ	2009	2006	2
country	TZ	2009	2005	5
country	TZ	2009	2004	5
country	TZ	2009	2003	4
country	TZ	2009	2002	4
country	TZ	2009	2001	3
country	TZ	2009	2000	2
country	ZA	2009	2017	0
country	ZA	2009	2016	-1
country	ZA	2009	2015	0
country	ZA	2009	2014	0
country	ZA	2009	2013	1
country	ZA	2009	2012	1
country	ZA	2009	2011	2
country	ZA	2009	2010	2
country	ZA	2009	2009	-3
country	ZA	2009	2008	2
country	ZA	2009	2007	4
country	ZA	2009	2006	4
country	ZA	2009	2005	4
country	ZA	2009	2004	3
country	ZA	2009	2003	2
country	ZA	2009	2002	2
country	ZA	2009	2001	1
country	ZA	2009	2000	3
\.


--
-- Name: gdp_per_capita_growth pk_gdp_per_capita_growth; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gdp_per_capita_growth
    ADD CONSTRAINT pk_gdp_per_capita_growth PRIMARY KEY (geo_level, geo_code, geo_version, gdp_per_capita_growth_year);


--
-- PostgreSQL database dump complete
--

