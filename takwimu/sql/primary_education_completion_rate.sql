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

ALTER TABLE IF EXISTS ONLY public.primary_education_completion_rate DROP CONSTRAINT IF EXISTS pk_primary_education_completion_rate;
DROP TABLE IF EXISTS public.primary_education_completion_rate;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: primary_education_completion_rate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.primary_education_completion_rate (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    primary_education_completion_rate_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: primary_education_completion_rate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.primary_education_completion_rate (geo_level, geo_code, geo_version, primary_education_completion_rate_year, total) FROM stdin;
country	ET	2009	2015	53
country	ET	2009	2014	53
country	ET	2009	2012	51
country	ET	2009	2011	50
country	ET	2009	2010	56
country	ET	2009	2009	50
country	ET	2009	2008	46
country	ET	2009	2007	42
country	ET	2009	2006	42
country	ET	2009	2005	36
country	ET	2009	2004	29
country	ET	2009	2003	25
country	ET	2009	2002	22
country	ET	2009	2001	20
country	ET	2009	2000	16
country	KE	2009	2016	102
country	KE	2009	2015	102
country	KE	2009	2014	100
country	KE	2009	2005	87
country	KE	2009	2004	86
country	NG	2009	2010	69
country	NG	2009	2009	68
country	NG	2009	2008	64
country	NG	2009	2007	72
country	NG	2009	2006	80
country	NG	2009	2005	75
country	NG	2009	2004	72
country	NG	2009	2000	74
country	SN	2009	2017	66
country	SN	2009	2016	63
country	SN	2009	2015	63
country	SN	2009	2014	64
country	SN	2009	2013	63
country	SN	2009	2012	62
country	SN	2009	2011	62
country	SN	2009	2010	58
country	SN	2009	2009	58
country	SN	2009	2008	56
country	SN	2009	2007	48
country	SN	2009	2006	47
country	SN	2009	2005	48
country	SN	2009	2004	43
country	SN	2009	2003	41
country	SN	2009	2002	41
country	SN	2009	2001	37
country	SN	2009	2000	33
country	TZ	2009	2016	61
country	TZ	2009	2013	76
country	TZ	2009	2012	81
country	TZ	2009	2010	89
country	TZ	2009	2009	99
country	TZ	2009	2007	78
country	TZ	2009	2005	52
country	TZ	2009	2004	56
country	TZ	2009	2002	59
country	TZ	2009	2001	56
country	TZ	2009	2000	50
country	ZA	2009	2016	82
country	ZA	2009	2015	83
country	ZA	2009	2004	97
country	ZA	2009	2003	95
country	ZA	2009	2002	92
country	ZA	2009	2000	85
\.


--
-- Name: primary_education_completion_rate pk_primary_education_completion_rate; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.primary_education_completion_rate
    ADD CONSTRAINT pk_primary_education_completion_rate PRIMARY KEY (geo_level, geo_code, geo_version, primary_education_completion_rate_year);


--
-- PostgreSQL database dump complete
--

