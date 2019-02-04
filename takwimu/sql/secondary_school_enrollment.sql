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

ALTER TABLE IF EXISTS ONLY public.secondary_school_enrollment DROP CONSTRAINT IF EXISTS pk_secondary_school_enrollment;
DROP TABLE IF EXISTS public.secondary_school_enrollment;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: secondary_school_enrollment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.secondary_school_enrollment (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    secondary_school_enrollment_year character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: secondary_school_enrollment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.secondary_school_enrollment (geo_level, geo_code, geo_version, secondary_school_enrollment_year, sex, total) FROM stdin;
country	ET	2009	2015	female	34
country	ET	2009	2012	female	36
country	ET	2009	2011	female	34
country	ET	2009	2010	female	32
country	ET	2009	2009	female	29
country	ET	2009	2008	female	28
country	ET	2009	2007	female	26
country	ET	2009	2006	female	22
country	ET	2009	2005	female	19
country	ET	2009	2004	female	16
country	ET	2009	2003	female	14
country	ET	2009	2002	female	14
country	ET	2009	2001	female	13
country	ET	2009	2000	female	11
country	KE	2009	2009	female	55
country	KE	2009	2008	female	55
country	KE	2009	2007	female	48
country	KE	2009	2006	female	48
country	KE	2009	2005	female	47
country	KE	2009	2004	female	45
country	KE	2009	2003	female	44
country	KE	2009	2002	female	40
country	KE	2009	2001	female	39
country	KE	2009	2000	female	38
country	NG	2009	2016	female	40
country	NG	2009	2015	female	45
country	NG	2009	2014	female	43
country	NG	2009	2013	female	53
country	NG	2009	2012	female	45
country	NG	2009	2011	female	42
country	NG	2009	2010	female	41
country	NG	2009	2009	female	36
country	NG	2009	2008	female	32
country	NG	2009	2007	female	28
country	NG	2009	2006	female	31
country	NG	2009	2005	female	32
country	NG	2009	2004	female	31
country	NG	2009	2002	female	26
country	NG	2009	2001	female	25
country	NG	2009	2000	female	22
country	SN	2009	2017	female	47
country	SN	2009	2016	female	48
country	SN	2009	2014	female	49
country	SN	2009	2013	female	47
country	SN	2009	2012	female	43
country	SN	2009	2011	female	39
country	SN	2009	2010	female	33
country	SN	2009	2008	female	26
country	SN	2009	2006	female	21
country	SN	2009	2005	female	19
country	SN	2009	2004	female	17
country	SN	2009	2002	female	14
country	SN	2009	2001	female	13
country	SN	2009	2000	female	12
country	TZ	2009	2017	female	26
country	TZ	2009	2013	female	30
country	TZ	2009	2010	female	27
country	ZA	2009	2016	female	105
country	ZA	2009	2015	female	102
country	ZA	2009	2014	female	106
country	ZA	2009	2012	female	98
country	ZA	2009	2011	female	96
country	ZA	2009	2010	female	95
country	ZA	2009	2009	female	94
country	ZA	2009	2008	female	93
country	ZA	2009	2007	female	96
country	ZA	2009	2006	female	96
country	ZA	2009	2005	female	93
country	ZA	2009	2004	female	92
country	ZA	2009	2003	female	89
country	ZA	2009	2002	female	88
country	ZA	2009	2001	female	88
country	ZA	2009	2000	female	87
country	ET	2009	2015	male	36
country	ET	2009	2012	male	40
country	ET	2009	2011	male	38
country	ET	2009	2010	male	38
country	ET	2009	2009	male	38
country	ET	2009	2008	male	38
country	ET	2009	2007	male	38
country	ET	2009	2006	male	35
country	ET	2009	2005	male	31
country	ET	2009	2004	male	28
country	ET	2009	2003	male	25
country	ET	2009	2002	male	23
country	ET	2009	2001	male	20
country	ET	2009	2000	male	16
country	KE	2009	2009	male	61
country	KE	2009	2008	male	60
country	KE	2009	2007	male	55
country	KE	2009	2006	male	51
country	KE	2009	2005	male	49
country	KE	2009	2004	male	49
country	KE	2009	2003	male	43
country	KE	2009	2002	male	42
country	KE	2009	2001	male	42
country	KE	2009	2000	male	40
country	NG	2009	2016	male	44
country	NG	2009	2015	male	49
country	NG	2009	2014	male	48
country	NG	2009	2013	male	59
country	NG	2009	2012	male	49
country	NG	2009	2011	male	49
country	NG	2009	2010	male	47
country	NG	2009	2009	male	42
country	NG	2009	2008	male	39
country	NG	2009	2007	male	36
country	NG	2009	2006	male	38
country	NG	2009	2005	male	38
country	NG	2009	2004	male	39
country	NG	2009	2002	male	34
country	NG	2009	2001	male	29
country	NG	2009	2000	male	27
country	SN	2009	2017	male	43
country	SN	2009	2016	male	48
country	SN	2009	2014	male	50
country	SN	2009	2013	male	48
country	SN	2009	2012	male	46
country	SN	2009	2011	male	43
country	SN	2009	2010	male	38
country	SN	2009	2008	male	33
country	SN	2009	2006	male	27
country	SN	2009	2005	male	25
country	SN	2009	2004	male	23
country	SN	2009	2002	male	21
country	SN	2009	2001	male	19
country	SN	2009	2000	male	19
country	TZ	2009	2017	male	26
country	TZ	2009	2013	male	33
country	TZ	2009	2010	male	34
country	ZA	2009	2016	male	96
country	ZA	2009	2015	male	104
country	ZA	2009	2014	male	97
country	ZA	2009	2012	male	92
country	ZA	2009	2011	male	91
country	ZA	2009	2010	male	89
country	ZA	2009	2009	male	89
country	ZA	2009	2008	male	89
country	ZA	2009	2007	male	91
country	ZA	2009	2006	male	90
country	ZA	2009	2005	male	87
country	ZA	2009	2004	male	86
country	ZA	2009	2003	male	83
country	ZA	2009	2002	male	82
country	ZA	2009	2001	male	80
country	ZA	2009	2000	male	78
\.


--
-- Name: secondary_school_enrollment pk_secondary_school_enrollment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.secondary_school_enrollment
    ADD CONSTRAINT pk_secondary_school_enrollment PRIMARY KEY (geo_level, geo_code, geo_version, secondary_school_enrollment_year, sex);


--
-- PostgreSQL database dump complete
--

