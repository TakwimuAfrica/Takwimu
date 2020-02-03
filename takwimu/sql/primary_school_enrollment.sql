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
    total numeric
);


--
-- Data for Name: primary_school_enrollment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.primary_school_enrollment (geo_level, geo_code, geo_version, primary_school_enrollment_year, sex, total) FROM stdin;
country	BF	2009	1999	F	36
country	BF	2009	2000	F	37
country	BF	2009	2001	F	39
country	BF	2009	2002	F	40
country	BF	2009	2003	F	42
country	BF	2009	2004	F	47
country	BF	2009	2005	F	52
country	BF	2009	2006	F	56
country	BF	2009	2007	F	62
country	BF	2009	2008	F	68
country	BF	2009	2009	F	73
country	BF	2009	2010	F	74
country	BF	2009	2011	F	78
country	BF	2009	2012	F	82
country	BF	2009	2013	F	84
country	BF	2009	2014	F	86
country	BF	2009	2015	F	87
country	BF	2009	2016	F	90
country	CD	2009	1995	F	66
country	CD	2009	1998	F	56
country	CD	2009	1999	F	51
country	CD	2009	2002	F	59
country	CD	2009	2007	F	84
country	CD	2009	2008	F	93
country	CD	2009	2009	F	93
country	CD	2009	2010	F	93
country	CD	2009	2011	F	94
country	CD	2009	2012	F	99
country	CD	2009	2013	F	101
country	CD	2009	2014	F	105
country	CD	2009	2015	F	108
country	ET	2009	2015	F	97
country	ET	2009	2014	F	96
country	ET	2009	2012	F	91
country	ET	2009	2011	F	91
country	ET	2009	2010	F	88
country	ET	2009	2009	F	90
country	ET	2009	2008	F	90
country	ET	2009	2007	F	84
country	ET	2009	2006	F	78
country	ET	2009	2005	F	72
country	ET	2009	2004	F	59
country	ET	2009	2003	F	55
country	ET	2009	2002	F	53
country	ET	2009	2001	F	49
country	ET	2009	2000	F	43
country	KE	2009	2016	F	105
country	KE	2009	2015	F	106
country	KE	2009	2014	F	108
country	KE	2009	2012	F	112
country	KE	2009	2009	F	105
country	KE	2009	2008	F	104
country	KE	2009	2007	F	104
country	KE	2009	2006	F	97
country	KE	2009	2005	F	99
country	KE	2009	2004	F	100
country	KE	2009	2003	F	101
country	KE	2009	2002	F	88
country	KE	2009	2001	F	95
country	KE	2009	2000	F	94
country	NG	2009	1999	F	83.90638
country	NG	2009	2000	F	88.19535
country	NG	2009	2001	F	87.08653
country	NG	2009	2002	F	88.49938
country	NG	2009	2003	F	90.19695
country	NG	2009	2004	F	91.65238
country	NG	2009	2005	F	92.60578
country	NG	2009	2006	F	94.28542
country	NG	2009	2007	F	87.37689
country	NG	2009	2008	F	79.06753
country	NG	2009	2009	F	80.63669
country	NG	2009	2010	F	80.96385
country	NG	2009	2011	F	87.459
country	NG	2009	2012	F	90.86255
country	NG	2009	2013	F	92.89585
country	NG	2009	2014	F	89.42713
country	NG	2009	2016	F	82.17733
country	SN	2009	2017	F	90
country	SN	2009	2016	F	88
country	SN	2009	2015	F	88
country	SN	2009	2014	F	89
country	SN	2009	2013	F	88
country	SN	2009	2012	F	90
country	SN	2009	2011	F	91
country	SN	2009	2010	F	85
country	SN	2009	2009	F	85
country	SN	2009	2008	F	84
country	SN	2009	2007	F	83
country	SN	2009	2006	F	79
country	SN	2009	2005	F	78
country	SN	2009	2004	F	75
country	SN	2009	2003	F	72
country	SN	2009	2002	F	68
country	SN	2009	2001	F	66
country	SN	2009	2000	F	63
country	TZ	2009	2017	F	86
country	TZ	2009	2016	F	83
country	TZ	2009	2015	F	82
country	TZ	2009	2014	F	84
country	TZ	2009	2013	F	86
country	TZ	2009	2012	F	89
country	TZ	2009	2011	F	93
country	TZ	2009	2010	F	98
country	TZ	2009	2009	F	101
country	TZ	2009	2007	F	106
country	TZ	2009	2005	F	100
country	TZ	2009	2004	F	96
country	TZ	2009	2003	F	91
country	TZ	2009	2002	F	86
country	TZ	2009	2001	F	72
country	TZ	2009	2000	F	67
country	UG	2009	1996	F	65
country	UG	2009	1997	F	110
country	UG	2009	1998	F	117
country	UG	2009	1999	F	123
country	UG	2009	2000	F	126
country	UG	2009	2001	F	129
country	UG	2009	2002	F	134
country	UG	2009	2003	F	134
country	UG	2009	2004	F	125
country	UG	2009	2005	F	119
country	UG	2009	2006	F	118
country	UG	2009	2007	F	117
country	UG	2009	2008	F	119
country	UG	2009	2009	F	120
country	UG	2009	2010	F	118
country	UG	2009	2011	F	110
country	UG	2009	2012	F	109
country	UG	2009	2013	F	108
country	UG	2009	2015	F	99
country	UG	2009	2016	F	101
country	ZA	2009	2016	F	100
country	ZA	2009	2015	F	99
country	ZA	2009	2014	F	96
country	ZA	2009	2013	F	95
country	ZA	2009	2012	F	95
country	ZA	2009	2011	F	95
country	ZA	2009	2010	F	96
country	ZA	2009	2009	F	98
country	ZA	2009	2008	F	100
country	ZA	2009	2007	F	101
country	ZA	2009	2006	F	100
country	ZA	2009	2005	F	101
country	ZA	2009	2004	F	102
country	ZA	2009	2003	F	103
country	ZA	2009	2002	F	103
country	ZA	2009	2001	F	102
country	ZA	2009	2000	F	101
country	ZM	2009	1996	F	80
country	ZM	2009	1998	F	78
country	ZM	2009	1999	F	76
country	ZM	2009	2000	F	76
country	ZM	2009	2001	F	76
country	ZM	2009	2002	F	78
country	ZM	2009	2004	F	97
country	ZM	2009	2005	F	107
country	ZM	2009	2006	F	110
country	ZM	2009	2007	F	110
country	ZM	2009	2008	F	111
country	ZM	2009	2009	F	106
country	ZM	2009	2010	F	106
country	ZM	2009	2011	F	106
country	ZM	2009	2012	F	108
country	ZM	2009	2013	F	103
country	BF	2009	1999	M	52
country	BF	2009	2000	M	52
country	BF	2009	2001	M	54
country	BF	2009	2002	M	54
country	BF	2009	2003	M	56
country	BF	2009	2004	M	60
country	BF	2009	2005	M	65
country	BF	2009	2006	M	68
country	BF	2009	2007	M	73
country	BF	2009	2008	M	78
country	BF	2009	2009	M	82
country	BF	2009	2010	M	82
country	BF	2009	2011	M	85
country	BF	2009	2012	M	86
country	BF	2009	2013	M	87
country	BF	2009	2014	M	88
country	BF	2009	2015	M	89
country	BF	2009	2016	M	92
country	CD	2009	1995	M	95
country	CD	2009	1998	M	75
country	CD	2009	1999	M	56
country	CD	2009	2002	M	75
country	CD	2009	2007	M	102
country	CD	2009	2008	M	110
country	CD	2009	2009	M	108
country	CD	2009	2010	M	107
country	CD	2009	2011	M	108
country	CD	2009	2012	M	112
country	CD	2009	2013	M	112
country	CD	2009	2014	M	115
country	CD	2009	2015	M	108
country	ET	2009	2015	M	107
country	ET	2009	2014	M	104
country	ET	2009	2012	M	98
country	ET	2009	2011	M	98
country	ET	2009	2010	M	95
country	ET	2009	2009	M	97
country	ET	2009	2008	M	100
country	ET	2009	2007	M	94
country	ET	2009	2006	M	89
country	ET	2009	2005	M	86
country	ET	2009	2004	M	76
country	ET	2009	2003	M	75
country	ET	2009	2002	M	74
country	ET	2009	2001	M	71
country	ET	2009	2000	M	66
country	KE	2009	2016	M	105
country	KE	2009	2015	M	106
country	KE	2009	2014	M	108
country	KE	2009	2012	M	112
country	KE	2009	2009	M	107
country	KE	2009	2008	M	106
country	KE	2009	2007	M	105
country	KE	2009	2006	M	100
country	KE	2009	2005	M	103
country	KE	2009	2004	M	105
country	KE	2009	2003	M	106
country	KE	2009	2002	M	92
country	KE	2009	2001	M	97
country	KE	2009	2000	M	96
country	NG	2009	1999	M	103.9826
country	NG	2009	2000	M	108.8362
country	NG	2009	2001	M	105.3563
country	NG	2009	2002	M	107.1947
country	NG	2009	2003	M	108.4261
country	NG	2009	2004	M	109.3959
country	NG	2009	2005	M	109.8247
country	NG	2009	2006	M	109.6608
country	NG	2009	2007	M	99.03583
country	NG	2009	2008	M	89.02941
country	NG	2009	2009	M	89.96664
country	NG	2009	2010	M	89.11822
country	NG	2009	2011	M	93.76269
country	NG	2009	2012	M	93.27269
country	NG	2009	2013	M	95.29357
country	NG	2009	2014	M	90.75322
country	NG	2009	2016	M	87.17114
country	SN	2009	2017	M	78
country	SN	2009	2016	M	78
country	SN	2009	2015	M	79
country	SN	2009	2014	M	79
country	SN	2009	2013	M	79
country	SN	2009	2012	M	81
country	SN	2009	2011	M	81
country	SN	2009	2010	M	81
country	SN	2009	2009	M	81
country	SN	2009	2008	M	82
country	SN	2009	2007	M	83
country	SN	2009	2006	M	80
country	SN	2009	2005	M	81
country	SN	2009	2004	M	79
country	SN	2009	2003	M	78
country	SN	2009	2002	M	75
country	SN	2009	2001	M	74
country	SN	2009	2000	M	73
country	TZ	2009	2017	M	84
country	TZ	2009	2016	M	80
country	TZ	2009	2015	M	80
country	TZ	2009	2014	M	82
country	TZ	2009	2013	M	85
country	TZ	2009	2012	M	89
country	TZ	2009	2011	M	91
country	TZ	2009	2010	M	97
country	TZ	2009	2009	M	101
country	TZ	2009	2007	M	108
country	TZ	2009	2005	M	105
country	TZ	2009	2004	M	101
country	TZ	2009	2003	M	97
country	TZ	2009	2002	M	90
country	TZ	2009	2001	M	74
country	TZ	2009	2000	M	68
country	UG	2009	1996	M	75
country	UG	2009	1997	M	125
country	UG	2009	1998	M	130
country	UG	2009	1999	M	135
country	UG	2009	2000	M	134
country	UG	2009	2001	M	134
country	UG	2009	2002	M	136
country	UG	2009	2003	M	137
country	UG	2009	2004	M	127
country	UG	2009	2005	M	120
country	UG	2009	2006	M	118
country	UG	2009	2007	M	116
country	UG	2009	2008	M	119
country	UG	2009	2009	M	119
country	UG	2009	2010	M	116
country	UG	2009	2011	M	108
country	UG	2009	2012	M	108
country	UG	2009	2013	M	106
country	UG	2009	2015	M	97
country	UG	2009	2016	M	98
country	ZA	2009	2016	M	104
country	ZA	2009	2015	M	107
country	ZA	2009	2014	M	101
country	ZA	2009	2013	M	100
country	ZA	2009	2012	M	99
country	ZA	2009	2011	M	99
country	ZA	2009	2010	M	100
country	ZA	2009	2009	M	101
country	ZA	2009	2008	M	103
country	ZA	2009	2007	M	104
country	ZA	2009	2006	M	104
country	ZA	2009	2005	M	105
country	ZA	2009	2004	M	106
country	ZA	2009	2003	M	106
country	ZA	2009	2002	M	106
country	ZA	2009	2001	M	105
country	ZA	2009	2000	M	106
country	ZM	2009	1996	M	87
country	ZM	2009	1998	M	84
country	ZM	2009	1999	M	82
country	ZM	2009	2000	M	81
country	ZM	2009	2001	M	81
country	ZM	2009	2002	M	84
country	ZM	2009	2004	M	102
country	ZM	2009	2005	M	112
country	ZM	2009	2006	M	112
country	ZM	2009	2007	M	113
country	ZM	2009	2008	M	114
country	ZM	2009	2009	M	107
country	ZM	2009	2010	M	105
country	ZM	2009	2011	M	107
country	ZM	2009	2012	M	107
country	ZM	2009	2013	M	102
\.


--
-- Name: primary_school_enrollment pk_primary_school_enrollment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.primary_school_enrollment
    ADD CONSTRAINT pk_primary_school_enrollment PRIMARY KEY (geo_level, geo_code, geo_version, primary_school_enrollment_year, sex);


--
-- PostgreSQL database dump complete
--
