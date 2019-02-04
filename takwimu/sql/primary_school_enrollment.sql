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

ALTER TABLE IF EXISTS ONLY public.primary_school_enrollment DROP CONSTRAINT IF EXISTS pk_primary_school_enrollment;
DROP TABLE IF EXISTS public.primary_school_enrollment;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: primary_school_enrollment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.primary_school_enrollment (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    primary_school_enrollment_year character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: primary_school_enrollment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.primary_school_enrollment (geo_level, geo_code, geo_version, primary_school_enrollment_year, sex, total) FROM stdin;
country	ET	2009	2015	female	97
country	ET	2009	2014	female	96
country	ET	2009	2012	female	91
country	ET	2009	2011	female	91
country	ET	2009	2010	female	88
country	ET	2009	2009	female	90
country	ET	2009	2008	female	90
country	ET	2009	2007	female	84
country	ET	2009	2006	female	78
country	ET	2009	2005	female	72
country	ET	2009	2004	female	59
country	ET	2009	2003	female	55
country	ET	2009	2002	female	53
country	ET	2009	2001	female	49
country	ET	2009	2000	female	43
country	KE	2009	2016	female	105
country	KE	2009	2015	female	106
country	KE	2009	2014	female	108
country	KE	2009	2012	female	112
country	KE	2009	2009	female	105
country	KE	2009	2008	female	104
country	KE	2009	2007	female	104
country	KE	2009	2006	female	97
country	KE	2009	2005	female	99
country	KE	2009	2004	female	100
country	KE	2009	2003	female	101
country	KE	2009	2002	female	88
country	KE	2009	2001	female	95
country	KE	2009	2000	female	94
country	NG	2009	2016	female	82
country	NG	2009	2014	female	89
country	NG	2009	2013	female	93
country	NG	2009	2012	female	91
country	NG	2009	2011	female	87
country	NG	2009	2010	female	81
country	NG	2009	2009	female	81
country	NG	2009	2008	female	79
country	NG	2009	2007	female	87
country	NG	2009	2006	female	94
country	NG	2009	2005	female	93
country	NG	2009	2004	female	92
country	NG	2009	2003	female	90
country	NG	2009	2002	female	88
country	NG	2009	2001	female	87
country	NG	2009	2000	female	88
country	SN	2009	2017	female	90
country	SN	2009	2016	female	88
country	SN	2009	2015	female	88
country	SN	2009	2014	female	89
country	SN	2009	2013	female	88
country	SN	2009	2012	female	90
country	SN	2009	2011	female	91
country	SN	2009	2010	female	85
country	SN	2009	2009	female	85
country	SN	2009	2008	female	84
country	SN	2009	2007	female	83
country	SN	2009	2006	female	79
country	SN	2009	2005	female	78
country	SN	2009	2004	female	75
country	SN	2009	2003	female	72
country	SN	2009	2002	female	68
country	SN	2009	2001	female	66
country	SN	2009	2000	female	63
country	TZ	2009	2017	female	86
country	TZ	2009	2016	female	83
country	TZ	2009	2015	female	82
country	TZ	2009	2014	female	84
country	TZ	2009	2013	female	86
country	TZ	2009	2012	female	89
country	TZ	2009	2011	female	93
country	TZ	2009	2010	female	98
country	TZ	2009	2009	female	101
country	TZ	2009	2007	female	106
country	TZ	2009	2005	female	100
country	TZ	2009	2004	female	96
country	TZ	2009	2003	female	91
country	TZ	2009	2002	female	86
country	TZ	2009	2001	female	72
country	TZ	2009	2000	female	67
country	ZA	2009	2016	female	100
country	ZA	2009	2015	female	99
country	ZA	2009	2014	female	96
country	ZA	2009	2013	female	95
country	ZA	2009	2012	female	95
country	ZA	2009	2011	female	95
country	ZA	2009	2010	female	96
country	ZA	2009	2009	female	98
country	ZA	2009	2008	female	100
country	ZA	2009	2007	female	101
country	ZA	2009	2006	female	100
country	ZA	2009	2005	female	101
country	ZA	2009	2004	female	102
country	ZA	2009	2003	female	103
country	ZA	2009	2002	female	103
country	ZA	2009	2001	female	102
country	ZA	2009	2000	female	101
country	ET	2009	2015	male	107
country	ET	2009	2014	male	104
country	ET	2009	2012	male	98
country	ET	2009	2011	male	98
country	ET	2009	2010	male	95
country	ET	2009	2009	male	97
country	ET	2009	2008	male	100
country	ET	2009	2007	male	94
country	ET	2009	2006	male	89
country	ET	2009	2005	male	86
country	ET	2009	2004	male	76
country	ET	2009	2003	male	75
country	ET	2009	2002	male	74
country	ET	2009	2001	male	71
country	ET	2009	2000	male	66
country	KE	2009	2016	male	105
country	KE	2009	2015	male	106
country	KE	2009	2014	male	108
country	KE	2009	2012	male	112
country	KE	2009	2009	male	107
country	KE	2009	2008	male	106
country	KE	2009	2007	male	105
country	KE	2009	2006	male	100
country	KE	2009	2005	male	103
country	KE	2009	2004	male	105
country	KE	2009	2003	male	106
country	KE	2009	2002	male	92
country	KE	2009	2001	male	97
country	KE	2009	2000	male	96
country	NG	2009	2016	male	87
country	NG	2009	2014	male	91
country	NG	2009	2013	male	95
country	NG	2009	2012	male	93
country	NG	2009	2011	male	94
country	NG	2009	2010	male	89
country	NG	2009	2009	male	90
country	NG	2009	2008	male	89
country	NG	2009	2007	male	99
country	NG	2009	2006	male	110
country	NG	2009	2005	male	110
country	NG	2009	2004	male	109
country	NG	2009	2003	male	108
country	NG	2009	2002	male	107
country	NG	2009	2001	male	105
country	NG	2009	2000	male	109
country	SN	2009	2017	male	78
country	SN	2009	2016	male	78
country	SN	2009	2015	male	79
country	SN	2009	2014	male	79
country	SN	2009	2013	male	79
country	SN	2009	2012	male	81
country	SN	2009	2011	male	81
country	SN	2009	2010	male	81
country	SN	2009	2009	male	81
country	SN	2009	2008	male	82
country	SN	2009	2007	male	83
country	SN	2009	2006	male	80
country	SN	2009	2005	male	81
country	SN	2009	2004	male	79
country	SN	2009	2003	male	78
country	SN	2009	2002	male	75
country	SN	2009	2001	male	74
country	SN	2009	2000	male	73
country	TZ	2009	2017	male	84
country	TZ	2009	2016	male	80
country	TZ	2009	2015	male	80
country	TZ	2009	2014	male	82
country	TZ	2009	2013	male	85
country	TZ	2009	2012	male	89
country	TZ	2009	2011	male	91
country	TZ	2009	2010	male	97
country	TZ	2009	2009	male	101
country	TZ	2009	2007	male	108
country	TZ	2009	2005	male	105
country	TZ	2009	2004	male	101
country	TZ	2009	2003	male	97
country	TZ	2009	2002	male	90
country	TZ	2009	2001	male	74
country	TZ	2009	2000	male	68
country	ZA	2009	2016	male	104
country	ZA	2009	2015	male	107
country	ZA	2009	2014	male	101
country	ZA	2009	2013	male	100
country	ZA	2009	2012	male	99
country	ZA	2009	2011	male	99
country	ZA	2009	2010	male	100
country	ZA	2009	2009	male	101
country	ZA	2009	2008	male	103
country	ZA	2009	2007	male	104
country	ZA	2009	2006	male	104
country	ZA	2009	2005	male	105
country	ZA	2009	2004	male	106
country	ZA	2009	2003	male	106
country	ZA	2009	2002	male	106
country	ZA	2009	2001	male	105
country	ZA	2009	2000	male	106
\.


--
-- Name: primary_school_enrollment pk_primary_school_enrollment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.primary_school_enrollment
    ADD CONSTRAINT pk_primary_school_enrollment PRIMARY KEY (geo_level, geo_code, geo_version, primary_school_enrollment_year, sex);


--
-- PostgreSQL database dump complete
--

