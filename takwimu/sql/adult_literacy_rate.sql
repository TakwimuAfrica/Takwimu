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

ALTER TABLE IF EXISTS ONLY public.adult_literacy_rate DROP CONSTRAINT IF EXISTS pk_adult_literacy_rate;
DROP TABLE IF EXISTS public.adult_literacy_rate;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adult_literacy_rate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.adult_literacy_rate (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    adult_literacy_rate_year character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: adult_literacy_rate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.adult_literacy_rate (geo_level, geo_code, geo_version, adult_literacy_rate_year, sex, total) FROM stdin;
country	ET	2009	2007	female	29
country	ET	2009	2005	female	18
country	ET	2009	2004	female	23
country	KE	2009	2014	female	74
country	KE	2009	2007	female	67
country	KE	2009	2000	female	78
country	NG	2009	2008	female	41
country	NG	2009	2003	female	43
country	SN	2009	2017	female	40
country	SN	2009	2013	female	34
country	SN	2009	2011	female	40
country	SN	2009	2009	female	39
country	SN	2009	2006	female	33
country	SN	2009	2002	female	29
country	TZ	2009	2015	female	73
country	TZ	2009	2012	female	73
country	TZ	2009	2010	female	61
country	TZ	2009	2002	female	62
country	ZA	2009	2015	female	93
country	ZA	2009	2014	female	93
country	ZA	2009	2012	female	93
country	ZA	2009	2011	female	92
country	ZA	2009	2010	female	92
country	ZA	2009	2009	female	92
country	ZA	2009	2007	female	87
country	ET	2009	2007	male	49
country	ET	2009	2005	male	42
country	ET	2009	2004	male	50
country	KE	2009	2014	male	84
country	KE	2009	2007	male	78
country	KE	2009	2000	male	87
country	NG	2009	2008	male	61
country	NG	2009	2003	male	67
country	SN	2009	2017	male	65
country	SN	2009	2013	male	53
country	SN	2009	2011	male	66
country	SN	2009	2009	male	62
country	SN	2009	2006	male	52
country	SN	2009	2002	male	51
country	TZ	2009	2015	male	83
country	TZ	2009	2012	male	83
country	TZ	2009	2010	male	75
country	TZ	2009	2002	male	78
country	ZA	2009	2015	male	95
country	ZA	2009	2014	male	95
country	ZA	2009	2012	male	95
country	ZA	2009	2011	male	94
country	ZA	2009	2010	male	94
country	ZA	2009	2009	male	94
country	ZA	2009	2007	male	91
\.


--
-- Name: adult_literacy_rate pk_adult_literacy_rate; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.adult_literacy_rate
    ADD CONSTRAINT pk_adult_literacy_rate PRIMARY KEY (geo_level, geo_code, geo_version, adult_literacy_rate_year, sex);


--
-- PostgreSQL database dump complete
--

