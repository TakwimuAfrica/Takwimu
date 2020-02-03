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
    total numeric
);


--
-- Data for Name: secondary_school_enrollment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.secondary_school_enrollment (geo_level, geo_code, geo_version, secondary_school_enrollment_year, sex, total) FROM stdin;
country	BF	2009	1999	F	7
country	BF	2009	2000	F	8
country	BF	2009	2001	F	8
country	BF	2009	2003	F	10
country	BF	2009	2004	F	11
country	BF	2009	2005	F	12
country	BF	2009	2006	F	13
country	BF	2009	2007	F	14
country	BF	2009	2008	F	16
country	BF	2009	2009	F	17
country	BF	2009	2010	F	19
country	BF	2009	2011	F	21
country	BF	2009	2012	F	23
country	BF	2009	2013	F	26
country	BF	2009	2014	F	28
country	BF	2009	2015	F	32
country	BF	2009	2016	F	35
country	CD	2009	1995	F	21
country	CD	2009	2007	F	25
country	CD	2009	2008	F	28
country	CD	2009	2009	F	30
country	CD	2009	2010	F	30
country	CD	2009	2011	F	32
country	CD	2009	2012	F	32
country	CD	2009	2013	F	33
country	CD	2009	2014	F	35
country	CD	2009	2015	F	36
country	ET	2009	2015	F	34
country	ET	2009	2012	F	36
country	ET	2009	2011	F	34
country	ET	2009	2010	F	32
country	ET	2009	2009	F	29
country	ET	2009	2008	F	28
country	ET	2009	2007	F	26
country	ET	2009	2006	F	22
country	ET	2009	2005	F	19
country	ET	2009	2004	F	16
country	ET	2009	2003	F	14
country	ET	2009	2002	F	14
country	ET	2009	2001	F	13
country	ET	2009	2000	F	11
country	KE	2009	2009	F	55
country	KE	2009	2008	F	55
country	KE	2009	2007	F	48
country	KE	2009	2006	F	48
country	KE	2009	2005	F	47
country	KE	2009	2004	F	45
country	KE	2009	2003	F	44
country	KE	2009	2002	F	40
country	KE	2009	2001	F	39
country	KE	2009	2000	F	38
country	NG	2009	1999	F	22.4
country	NG	2009	2000	F	22.4
country	NG	2009	2001	F	24.5
country	NG	2009	2002	F	25.6
country	NG	2009	2004	F	31
country	NG	2009	2005	F	31.7
country	NG	2009	2006	F	30.9
country	NG	2009	2007	F	27.7
country	NG	2009	2008	F	32.1
country	NG	2009	2009	F	36.4
country	NG	2009	2010	F	41.2
country	NG	2009	2011	F	41.9
country	NG	2009	2012	F	45
country	NG	2009	2013	F	53.5
country	NG	2009	2014	F	43
country	NG	2009	2015	F	44.7
country	NG	2009	2016	F	39.8
country	SN	2009	2017	F	47
country	SN	2009	2016	F	48
country	SN	2009	2014	F	49
country	SN	2009	2013	F	47
country	SN	2009	2012	F	43
country	SN	2009	2011	F	39
country	SN	2009	2010	F	33
country	SN	2009	2008	F	26
country	SN	2009	2006	F	21
country	SN	2009	2005	F	19
country	SN	2009	2004	F	17
country	SN	2009	2002	F	14
country	SN	2009	2001	F	13
country	SN	2009	2000	F	12
country	TZ	2009	2017	F	26
country	TZ	2009	2013	F	30
country	TZ	2009	2010	F	27
country	UG	2009	1997	F	8
country	UG	2009	2004	F	17
country	UG	2009	2007	F	22
country	ZA	2009	2016	F	105
country	ZA	2009	2015	F	102
country	ZA	2009	2014	F	106
country	ZA	2009	2012	F	98
country	ZA	2009	2011	F	96
country	ZA	2009	2010	F	95
country	ZA	2009	2009	F	94
country	ZA	2009	2008	F	93
country	ZA	2009	2007	F	96
country	ZA	2009	2006	F	96
country	ZA	2009	2005	F	93
country	ZA	2009	2004	F	92
country	ZA	2009	2003	F	89
country	ZA	2009	2002	F	88
country	ZA	2009	2001	F	88
country	ZA	2009	2000	F	87
country	BF	2009	1999	M	12
country	BF	2009	2000	M	13
country	BF	2009	2001	M	13
country	BF	2009	2003	M	14
country	BF	2009	2004	M	16
country	BF	2009	2005	M	17
country	BF	2009	2006	M	17
country	BF	2009	2007	M	19
country	BF	2009	2008	M	22
country	BF	2009	2009	M	23
country	BF	2009	2010	M	25
country	BF	2009	2011	M	27
country	BF	2009	2012	M	29
country	BF	2009	2013	M	31
country	BF	2009	2014	M	32
country	BF	2009	2015	M	35
country	BF	2009	2016	M	37
country	CD	2009	1995	M	35
country	CD	2009	2007	M	48
country	CD	2009	2008	M	51
country	CD	2009	2009	M	53
country	CD	2009	2010	M	52
country	CD	2009	2011	M	55
country	CD	2009	2012	M	54
country	CD	2009	2013	M	53
country	CD	2009	2014	M	56
country	CD	2009	2015	M	56
country	ET	2009	2015	M	36
country	ET	2009	2012	M	40
country	ET	2009	2011	M	38
country	ET	2009	2010	M	38
country	ET	2009	2009	M	38
country	ET	2009	2008	M	38
country	ET	2009	2007	M	38
country	ET	2009	2006	M	35
country	ET	2009	2005	M	31
country	ET	2009	2004	M	28
country	ET	2009	2003	M	25
country	ET	2009	2002	M	23
country	ET	2009	2001	M	20
country	ET	2009	2000	M	16
country	KE	2009	2009	M	61
country	KE	2009	2008	M	60
country	KE	2009	2007	M	55
country	KE	2009	2006	M	51
country	KE	2009	2005	M	49
country	KE	2009	2004	M	49
country	KE	2009	2003	M	43
country	KE	2009	2002	M	42
country	KE	2009	2001	M	42
country	KE	2009	2000	M	40
country	NG	2009	1999	M	24.7
country	NG	2009	2000	M	26.7
country	NG	2009	2001	M	29.5
country	NG	2009	2002	M	33.5
country	NG	2009	2004	M	38.9
country	NG	2009	2005	M	38.1
country	NG	2009	2006	M	37.9
country	NG	2009	2007	M	35.9
country	NG	2009	2008	M	38.5
country	NG	2009	2009	M	41.9
country	NG	2009	2010	M	47.2
country	NG	2009	2011	M	49.1
country	NG	2009	2012	M	49.3
country	NG	2009	2013	M	58.8
country	NG	2009	2014	M	48.2
country	NG	2009	2015	M	48.8
country	NG	2009	2016	M	44.1
country	SN	2009	2017	M	43
country	SN	2009	2016	M	48
country	SN	2009	2014	M	50
country	SN	2009	2013	M	48
country	SN	2009	2012	M	46
country	SN	2009	2011	M	43
country	SN	2009	2010	M	38
country	SN	2009	2008	M	33
country	SN	2009	2006	M	27
country	SN	2009	2005	M	25
country	SN	2009	2004	M	23
country	SN	2009	2002	M	21
country	SN	2009	2001	M	19
country	SN	2009	2000	M	19
country	TZ	2009	2017	M	26
country	TZ	2009	2013	M	33
country	TZ	2009	2010	M	34
country	UG	2009	1997	M	12
country	UG	2009	2004	M	21
country	UG	2009	2007	M	26
country	ZA	2009	2016	M	96
country	ZA	2009	2015	M	104
country	ZA	2009	2014	M	97
country	ZA	2009	2012	M	92
country	ZA	2009	2011	M	91
country	ZA	2009	2010	M	89
country	ZA	2009	2009	M	89
country	ZA	2009	2008	M	89
country	ZA	2009	2007	M	91
country	ZA	2009	2006	M	90
country	ZA	2009	2005	M	87
country	ZA	2009	2004	M	86
country	ZA	2009	2003	M	83
country	ZA	2009	2002	M	82
country	ZA	2009	2001	M	80
country	ZA	2009	2000	M	78
\.


--
-- Name: secondary_school_enrollment pk_secondary_school_enrollment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.secondary_school_enrollment
    ADD CONSTRAINT pk_secondary_school_enrollment PRIMARY KEY (geo_level, geo_code, geo_version, secondary_school_enrollment_year, sex);


--
-- PostgreSQL database dump complete
--
