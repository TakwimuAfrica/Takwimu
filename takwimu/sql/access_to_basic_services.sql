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

ALTER TABLE IF EXISTS ONLY public.access_to_basic_services DROP CONSTRAINT IF EXISTS pk_access_to_basic_services;
DROP TABLE IF EXISTS public.access_to_basic_services;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: access_to_basic_services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.access_to_basic_services (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    access_to_basic_services_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: access_to_basic_services; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.access_to_basic_services (geo_level, geo_code, geo_version, access_to_basic_services_year, total) FROM stdin;
country	ET	2009	2015	39
country	ET	2009	2014	38
country	ET	2009	2013	36
country	ET	2009	2012	35
country	ET	2009	2011	33
country	ET	2009	2010	32
country	ET	2009	2009	30
country	ET	2009	2008	28
country	ET	2009	2007	27
country	ET	2009	2006	25
country	ET	2009	2005	24
country	ET	2009	2004	23
country	ET	2009	2003	21
country	ET	2009	2002	20
country	ET	2009	2001	18
country	ET	2009	2000	17
country	KE	2009	2015	58
country	KE	2009	2014	58
country	KE	2009	2013	57
country	KE	2009	2012	56
country	KE	2009	2011	55
country	KE	2009	2010	55
country	KE	2009	2009	54
country	KE	2009	2008	53
country	KE	2009	2007	52
country	KE	2009	2006	51
country	KE	2009	2005	51
country	KE	2009	2004	50
country	KE	2009	2003	49
country	KE	2009	2002	48
country	KE	2009	2001	47
country	KE	2009	2000	46
country	NG	2009	2015	67
country	NG	2009	2014	66
country	NG	2009	2013	65
country	NG	2009	2012	63
country	NG	2009	2011	62
country	NG	2009	2010	61
country	NG	2009	2009	59
country	NG	2009	2008	58
country	NG	2009	2007	56
country	NG	2009	2006	55
country	NG	2009	2005	54
country	NG	2009	2004	52
country	NG	2009	2003	51
country	NG	2009	2002	49
country	NG	2009	2001	48
country	NG	2009	2000	46
country	SN	2009	2015	75
country	SN	2009	2014	74
country	SN	2009	2013	73
country	SN	2009	2012	73
country	SN	2009	2011	72
country	SN	2009	2010	71
country	SN	2009	2009	70
country	SN	2009	2008	69
country	SN	2009	2007	68
country	SN	2009	2006	67
country	SN	2009	2005	66
country	SN	2009	2004	65
country	SN	2009	2003	64
country	SN	2009	2002	63
country	SN	2009	2001	63
country	SN	2009	2000	62
country	TZ	2009	2015	50
country	TZ	2009	2014	49
country	TZ	2009	2013	48
country	TZ	2009	2012	46
country	TZ	2009	2011	45
country	TZ	2009	2010	44
country	TZ	2009	2009	43
country	TZ	2009	2008	41
country	TZ	2009	2007	40
country	TZ	2009	2006	39
country	TZ	2009	2005	38
country	TZ	2009	2004	36
country	TZ	2009	2003	35
country	TZ	2009	2002	34
country	TZ	2009	2001	33
country	TZ	2009	2000	32
country	ZA	2009	2015	85
country	ZA	2009	2014	84
country	ZA	2009	2013	84
country	ZA	2009	2012	83
country	ZA	2009	2011	83
country	ZA	2009	2010	82
country	ZA	2009	2009	82
country	ZA	2009	2008	81
country	ZA	2009	2007	81
country	ZA	2009	2006	80
country	ZA	2009	2005	80
country	ZA	2009	2004	79
country	ZA	2009	2003	79
country	ZA	2009	2002	78
country	ZA	2009	2001	78
country	ZA	2009	2000	77
\.


--
-- Name: access_to_basic_services pk_access_to_basic_services; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_to_basic_services
    ADD CONSTRAINT pk_access_to_basic_services PRIMARY KEY (geo_level, geo_code, geo_version, access_to_basic_services_year);


--
-- PostgreSQL database dump complete
--

