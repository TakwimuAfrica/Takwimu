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

ALTER TABLE IF EXISTS ONLY public.gdp_growth DROP CONSTRAINT IF EXISTS pk_gdp_growth;
DROP TABLE IF EXISTS public.gdp_growth;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gdp_growth; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gdp_growth (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    gdp_growth_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: gdp_growth; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gdp_growth (geo_level, geo_code, geo_version, gdp_growth_year, total) FROM stdin;
country	ET	2009	2017	10
country	ET	2009	2016	8
country	ET	2009	2015	10
country	ET	2009	2014	10
country	ET	2009	2013	11
country	ET	2009	2012	9
country	ET	2009	2011	11
country	ET	2009	2010	13
country	ET	2009	2009	9
country	ET	2009	2008	11
country	ET	2009	2007	11
country	ET	2009	2006	11
country	ET	2009	2005	12
country	ET	2009	2004	14
country	ET	2009	2003	-2
country	ET	2009	2002	2
country	ET	2009	2001	8
country	ET	2009	2000	6
country	KE	2009	2017	5
country	KE	2009	2016	6
country	KE	2009	2015	6
country	KE	2009	2014	5
country	KE	2009	2013	6
country	KE	2009	2012	5
country	KE	2009	2011	6
country	KE	2009	2010	8
country	KE	2009	2009	3
country	KE	2009	2008	0
country	KE	2009	2007	7
country	KE	2009	2006	6
country	KE	2009	2005	6
country	KE	2009	2004	5
country	KE	2009	2003	3
country	KE	2009	2002	1
country	KE	2009	2001	4
country	KE	2009	2000	1
country	NG	2009	2017	1
country	NG	2009	2016	-2
country	NG	2009	2015	3
country	NG	2009	2014	6
country	NG	2009	2013	7
country	NG	2009	2012	4
country	NG	2009	2011	5
country	NG	2009	2010	8
country	NG	2009	2009	8
country	NG	2009	2008	7
country	NG	2009	2007	7
country	NG	2009	2006	6
country	NG	2009	2005	6
country	NG	2009	2004	9
country	NG	2009	2003	7
country	NG	2009	2002	15
country	NG	2009	2001	6
country	NG	2009	2000	5
country	SN	2009	2017	7
country	SN	2009	2016	6
country	SN	2009	2015	6
country	SN	2009	2014	7
country	SN	2009	2013	3
country	SN	2009	2012	5
country	SN	2009	2011	1
country	SN	2009	2010	4
country	SN	2009	2009	2
country	SN	2009	2008	4
country	SN	2009	2007	5
country	SN	2009	2006	2
country	SN	2009	2005	6
country	SN	2009	2004	6
country	SN	2009	2003	7
country	SN	2009	2002	1
country	SN	2009	2001	5
country	SN	2009	2000	3
country	TZ	2009	2017	7
country	TZ	2009	2016	7
country	TZ	2009	2015	7
country	TZ	2009	2014	7
country	TZ	2009	2013	7
country	TZ	2009	2012	5
country	TZ	2009	2011	8
country	TZ	2009	2010	6
country	TZ	2009	2009	5
country	TZ	2009	2008	6
country	TZ	2009	2007	8
country	TZ	2009	2006	5
country	TZ	2009	2005	8
country	TZ	2009	2004	8
country	TZ	2009	2003	7
country	TZ	2009	2002	7
country	TZ	2009	2001	6
country	TZ	2009	2000	5
country	ZA	2009	2017	1
country	ZA	2009	2016	1
country	ZA	2009	2015	1
country	ZA	2009	2014	2
country	ZA	2009	2013	2
country	ZA	2009	2012	2
country	ZA	2009	2011	3
country	ZA	2009	2010	3
country	ZA	2009	2009	-2
country	ZA	2009	2008	3
country	ZA	2009	2007	5
country	ZA	2009	2006	6
country	ZA	2009	2005	5
country	ZA	2009	2004	5
country	ZA	2009	2003	3
country	ZA	2009	2002	4
country	ZA	2009	2001	3
country	ZA	2009	2000	4
\.


--
-- Name: gdp_growth pk_gdp_growth; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gdp_growth
    ADD CONSTRAINT pk_gdp_growth PRIMARY KEY (geo_level, geo_code, geo_version, gdp_growth_year);


--
-- PostgreSQL database dump complete
--

