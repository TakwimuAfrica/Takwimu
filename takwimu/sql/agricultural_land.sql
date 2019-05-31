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

ALTER TABLE IF EXISTS ONLY public.agricultural_land DROP CONSTRAINT IF EXISTS pk_agricultural_land;
DROP TABLE IF EXISTS public.agricultural_land;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agricultural_land; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.agricultural_land (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    agricultural_land_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: agricultural_land; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.agricultural_land (geo_level, geo_code, geo_version, agricultural_land_year, total) FROM stdin;
country	ET	2009	2016	36
country	ET	2009	2015	36
country	ET	2009	2014	36
country	ET	2009	2013	36
country	ET	2009	2012	36
country	ET	2009	2011	36
country	ET	2009	2010	36
country	ET	2009	2009	35
country	ET	2009	2008	35
country	ET	2009	2007	35
country	ET	2009	2006	34
country	ET	2009	2005	34
country	ET	2009	2004	33
country	ET	2009	2003	32
country	ET	2009	2002	30
country	ET	2009	2001	31
country	ET	2009	2000	31
country	KE	2009	2016	49
country	KE	2009	2015	49
country	KE	2009	2014	49
country	KE	2009	2013	49
country	KE	2009	2012	49
country	KE	2009	2011	49
country	KE	2009	2010	48
country	KE	2009	2009	48
country	KE	2009	2008	48
country	KE	2009	2007	48
country	KE	2009	2006	48
country	KE	2009	2005	47
country	KE	2009	2004	47
country	KE	2009	2003	47
country	KE	2009	2002	47
country	KE	2009	2001	47
country	KE	2009	2000	47
country	NG	2009	2016	78
country	NG	2009	2015	78
country	NG	2009	2014	78
country	NG	2009	2013	78
country	NG	2009	2012	79
country	NG	2009	2011	78
country	NG	2009	2010	77
country	NG	2009	2009	76
country	NG	2009	2008	80
country	NG	2009	2007	81
country	NG	2009	2006	80
country	NG	2009	2005	80
country	NG	2009	2004	79
country	NG	2009	2003	79
country	NG	2009	2002	78
country	NG	2009	2001	76
country	NG	2009	2000	78
country	SN	2009	2016	46
country	SN	2009	2015	46
country	SN	2009	2014	46
country	SN	2009	2013	46
country	SN	2009	2012	47
country	SN	2009	2011	47
country	SN	2009	2010	49
country	SN	2009	2009	49
country	SN	2009	2008	48
country	SN	2009	2007	44
country	SN	2009	2006	44
country	SN	2009	2005	46
country	SN	2009	2004	45
country	SN	2009	2003	45
country	SN	2009	2002	45
country	SN	2009	2001	46
country	SN	2009	2000	47
country	TZ	2009	2016	45
country	TZ	2009	2015	45
country	TZ	2009	2014	45
country	TZ	2009	2013	45
country	TZ	2009	2012	45
country	TZ	2009	2011	43
country	TZ	2009	2010	42
country	TZ	2009	2009	42
country	TZ	2009	2008	42
country	TZ	2009	2007	40
country	TZ	2009	2006	40
country	TZ	2009	2005	40
country	TZ	2009	2004	40
country	TZ	2009	2003	39
country	TZ	2009	2002	39
country	TZ	2009	2001	38
country	TZ	2009	2000	38
country	ZA	2009	2016	80
country	ZA	2009	2015	80
country	ZA	2009	2014	80
country	ZA	2009	2013	80
country	ZA	2009	2012	80
country	ZA	2009	2011	79
country	ZA	2009	2010	80
country	ZA	2009	2009	80
country	ZA	2009	2008	80
country	ZA	2009	2007	80
country	ZA	2009	2006	80
country	ZA	2009	2005	80
country	ZA	2009	2004	80
country	ZA	2009	2003	81
country	ZA	2009	2002	81
country	ZA	2009	2001	81
country	ZA	2009	2000	81
\.


--
-- Name: agricultural_land pk_agricultural_land; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.agricultural_land
    ADD CONSTRAINT pk_agricultural_land PRIMARY KEY (geo_level, geo_code, geo_version, agricultural_land_year);


--
-- PostgreSQL database dump complete
--

