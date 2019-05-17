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

ALTER TABLE IF EXISTS ONLY public.employment_to_population_ratio DROP CONSTRAINT IF EXISTS pk_employment_to_population_ratio;
DROP TABLE IF EXISTS public.employment_to_population_ratio;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: employment_to_population_ratio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employment_to_population_ratio (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    employment_to_population_ratio_year character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: employment_to_population_ratio; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.employment_to_population_ratio (geo_level, geo_code, geo_version, employment_to_population_ratio_year, sex, total) FROM stdin;
country	BF	2009	1997	F	69
country	BF	2009	1998	F	68
country	BF	2009	1999	F	67
country	BF	2009	2000	F	66
country	BF	2009	2001	F	65
country	BF	2009	2002	F	64
country	BF	2009	2003	F	63
country	BF	2009	2004	F	61
country	BF	2009	2005	F	60
country	BF	2009	2006	F	60
country	BF	2009	2007	F	59
country	BF	2009	2008	F	58
country	BF	2009	2009	F	57
country	BF	2009	2010	F	56
country	BF	2009	2011	F	55
country	BF	2009	2012	F	54
country	BF	2009	2013	F	54
country	BF	2009	2014	F	53
country	BF	2009	2015	F	53
country	BF	2009	2016	F	53
country	BF	2009	2017	F	53
country	CD	2009	1997	F	68
country	CD	2009	1998	F	68
country	CD	2009	1999	F	68
country	CD	2009	2000	F	68
country	CD	2009	2001	F	68
country	CD	2009	2002	F	68
country	CD	2009	2003	F	68
country	CD	2009	2004	F	68
country	CD	2009	2005	F	68
country	CD	2009	2006	F	68
country	CD	2009	2007	F	68
country	CD	2009	2008	F	68
country	CD	2009	2009	F	68
country	CD	2009	2010	F	68
country	CD	2009	2011	F	68
country	CD	2009	2012	F	68
country	CD	2009	2013	F	68
country	CD	2009	2014	F	68
country	CD	2009	2015	F	68
country	CD	2009	2016	F	68
country	CD	2009	2017	F	68
country	ET	2009	2018	F	71
country	ET	2009	2017	F	71
country	ET	2009	2016	F	71
country	ET	2009	2015	F	71
country	ET	2009	2014	F	72
country	ET	2009	2013	F	72
country	ET	2009	2012	F	72
country	ET	2009	2011	F	72
country	ET	2009	2010	F	72
country	ET	2009	2009	F	72
country	ET	2009	2008	F	72
country	ET	2009	2007	F	72
country	ET	2009	2006	F	72
country	ET	2009	2005	F	72
country	ET	2009	2004	F	70
country	ET	2009	2003	F	69
country	ET	2009	2002	F	67
country	ET	2009	2001	F	65
country	ET	2009	2000	F	64
country	KE	2009	2018	F	53
country	KE	2009	2017	F	53
country	KE	2009	2016	F	53
country	KE	2009	2015	F	53
country	KE	2009	2014	F	53
country	KE	2009	2013	F	52
country	KE	2009	2012	F	52
country	KE	2009	2011	F	52
country	KE	2009	2010	F	52
country	KE	2009	2009	F	51
country	KE	2009	2008	F	52
country	KE	2009	2007	F	52
country	KE	2009	2006	F	52
country	KE	2009	2005	F	52
country	KE	2009	2004	F	53
country	KE	2009	2003	F	55
country	KE	2009	2002	F	56
country	KE	2009	2001	F	58
country	KE	2009	2000	F	59
country	NG	2009	2018	F	47
country	NG	2009	2017	F	47
country	NG	2009	2016	F	47
country	NG	2009	2015	F	48
country	NG	2009	2014	F	48
country	NG	2009	2013	F	48
country	NG	2009	2012	F	48
country	NG	2009	2011	F	48
country	NG	2009	2010	F	47
country	NG	2009	2009	F	47
country	NG	2009	2008	F	47
country	NG	2009	2007	F	46
country	NG	2009	2006	F	46
country	NG	2009	2005	F	46
country	NG	2009	2004	F	45
country	NG	2009	2003	F	45
country	NG	2009	2002	F	45
country	NG	2009	2001	F	45
country	NG	2009	2000	F	45
country	SN	2009	2018	F	44
country	SN	2009	2017	F	43
country	SN	2009	2016	F	43
country	SN	2009	2015	F	43
country	SN	2009	2014	F	42
country	SN	2009	2013	F	41
country	SN	2009	2012	F	40
country	SN	2009	2011	F	38
country	SN	2009	2010	F	37
country	SN	2009	2009	F	35
country	SN	2009	2008	F	33
country	SN	2009	2007	F	31
country	SN	2009	2006	F	30
country	SN	2009	2005	F	30
country	SN	2009	2004	F	30
country	SN	2009	2003	F	31
country	SN	2009	2002	F	31
country	SN	2009	2001	F	31
country	SN	2009	2000	F	31
country	TZ	2009	2018	F	77
country	TZ	2009	2017	F	77
country	TZ	2009	2016	F	77
country	TZ	2009	2015	F	77
country	TZ	2009	2014	F	77
country	TZ	2009	2013	F	77
country	TZ	2009	2012	F	78
country	TZ	2009	2011	F	78
country	TZ	2009	2010	F	79
country	TZ	2009	2009	F	79
country	TZ	2009	2008	F	78
country	TZ	2009	2007	F	78
country	TZ	2009	2006	F	77
country	TZ	2009	2005	F	77
country	TZ	2009	2004	F	77
country	TZ	2009	2003	F	78
country	TZ	2009	2002	F	78
country	TZ	2009	2001	F	76
country	TZ	2009	2000	F	77
country	UG	2009	1996	F	51
country	UG	2009	1997	F	51
country	UG	2009	1998	F	51
country	UG	2009	1999	F	51
country	UG	2009	2000	F	50
country	UG	2009	2001	F	50
country	UG	2009	2002	F	50
country	UG	2009	2003	F	50
country	UG	2009	2004	F	51
country	UG	2009	2005	F	51
country	UG	2009	2006	F	50
country	UG	2009	2007	F	50
country	UG	2009	2008	F	49
country	UG	2009	2009	F	49
country	UG	2009	2010	F	49
country	UG	2009	2011	F	49
country	UG	2009	2012	F	49
country	UG	2009	2013	F	50
country	UG	2009	2014	F	50
country	UG	2009	2015	F	49
country	UG	2009	2016	F	49
country	UG	2009	2017	F	49
country	ZA	2009	2018	F	34
country	ZA	2009	2017	F	34
country	ZA	2009	2016	F	34
country	ZA	2009	2015	F	35
country	ZA	2009	2014	F	34
country	ZA	2009	2013	F	34
country	ZA	2009	2012	F	33
country	ZA	2009	2011	F	33
country	ZA	2009	2010	F	33
country	ZA	2009	2009	F	34
country	ZA	2009	2008	F	36
country	ZA	2009	2007	F	34
country	ZA	2009	2006	F	33
country	ZA	2009	2005	F	33
country	ZA	2009	2004	F	33
country	ZA	2009	2003	F	31
country	ZA	2009	2002	F	31
country	ZA	2009	2001	F	32
country	ZA	2009	2000	F	33
country	ZM	2009	1996	F	46
country	ZM	2009	1997	F	48
country	ZM	2009	1998	F	50
country	ZM	2009	1999	F	49
country	ZM	2009	2000	F	52
country	ZM	2009	2001	F	53
country	ZM	2009	2002	F	53
country	ZM	2009	2003	F	53
country	ZM	2009	2004	F	54
country	ZM	2009	2005	F	54
country	ZM	2009	2006	F	53
country	ZM	2009	2007	F	52
country	ZM	2009	2008	F	52
country	ZM	2009	2009	F	47
country	ZM	2009	2010	F	43
country	ZM	2009	2011	F	46
country	ZM	2009	2012	F	47
country	ZM	2009	2013	F	47
country	ZM	2009	2014	F	46
country	ZM	2009	2015	F	46
country	ZM	2009	2016	F	46
country	ZM	2009	2017	F	45
country	BF	2009	1997	M	87
country	BF	2009	1998	M	87
country	BF	2009	1999	M	86
country	BF	2009	2000	M	86
country	BF	2009	2001	M	86
country	BF	2009	2002	M	86
country	BF	2009	2003	M	85
country	BF	2009	2004	M	84
country	BF	2009	2005	M	84
country	BF	2009	2006	M	84
country	BF	2009	2007	M	83
country	BF	2009	2008	M	82
country	BF	2009	2009	M	80
country	BF	2009	2010	M	79
country	BF	2009	2011	M	77
country	BF	2009	2012	M	76
country	BF	2009	2013	M	74
country	BF	2009	2014	M	72
country	BF	2009	2015	M	72
country	BF	2009	2016	M	72
country	BF	2009	2017	M	72
country	CD	2009	1997	M	71
country	CD	2009	1998	M	71
country	CD	2009	1999	M	71
country	CD	2009	2000	M	71
country	CD	2009	2001	M	71
country	CD	2009	2002	M	71
country	CD	2009	2003	M	71
country	CD	2009	2004	M	71
country	CD	2009	2005	M	71
country	CD	2009	2006	M	71
country	CD	2009	2007	M	71
country	CD	2009	2008	M	71
country	CD	2009	2009	M	71
country	CD	2009	2010	M	71
country	CD	2009	2011	M	71
country	CD	2009	2012	M	71
country	CD	2009	2013	M	71
country	CD	2009	2014	M	71
country	CD	2009	2015	M	71
country	CD	2009	2016	M	71
country	CD	2009	2017	M	71
country	ET	2009	2018	M	85
country	ET	2009	2017	M	85
country	ET	2009	2016	M	85
country	ET	2009	2015	M	86
country	ET	2009	2014	M	86
country	ET	2009	2013	M	87
country	ET	2009	2012	M	87
country	ET	2009	2011	M	87
country	ET	2009	2010	M	87
country	ET	2009	2009	M	88
country	ET	2009	2008	M	88
country	ET	2009	2007	M	88
country	ET	2009	2006	M	88
country	ET	2009	2005	M	88
country	ET	2009	2004	M	88
country	ET	2009	2003	M	87
country	ET	2009	2002	M	87
country	ET	2009	2001	M	87
country	ET	2009	2000	M	86
country	KE	2009	2018	M	63
country	KE	2009	2017	M	63
country	KE	2009	2016	M	63
country	KE	2009	2015	M	63
country	KE	2009	2014	M	64
country	KE	2009	2013	M	64
country	KE	2009	2012	M	64
country	KE	2009	2011	M	64
country	KE	2009	2010	M	64
country	KE	2009	2009	M	64
country	KE	2009	2008	M	65
country	KE	2009	2007	M	65
country	KE	2009	2006	M	64
country	KE	2009	2005	M	64
country	KE	2009	2004	M	65
country	KE	2009	2003	M	66
country	KE	2009	2002	M	67
country	KE	2009	2001	M	67
country	KE	2009	2000	M	68
country	NG	2009	2018	M	55
country	NG	2009	2017	M	55
country	NG	2009	2016	M	55
country	NG	2009	2015	M	57
country	NG	2009	2014	M	57
country	NG	2009	2013	M	58
country	NG	2009	2012	M	58
country	NG	2009	2011	M	58
country	NG	2009	2010	M	58
country	NG	2009	2009	M	58
country	NG	2009	2008	M	59
country	NG	2009	2007	M	59
country	NG	2009	2006	M	59
country	NG	2009	2005	M	59
country	NG	2009	2004	M	59
country	NG	2009	2003	M	60
country	NG	2009	2002	M	60
country	NG	2009	2001	M	60
country	NG	2009	2000	M	60
country	SN	2009	2018	M	67
country	SN	2009	2017	M	67
country	SN	2009	2016	M	66
country	SN	2009	2015	M	66
country	SN	2009	2014	M	66
country	SN	2009	2013	M	65
country	SN	2009	2012	M	65
country	SN	2009	2011	M	64
country	SN	2009	2010	M	64
country	SN	2009	2009	M	64
country	SN	2009	2008	M	64
country	SN	2009	2007	M	64
country	SN	2009	2006	M	64
country	SN	2009	2005	M	65
country	SN	2009	2004	M	66
country	SN	2009	2003	M	66
country	SN	2009	2002	M	67
country	SN	2009	2001	M	68
country	SN	2009	2000	M	68
country	TZ	2009	2018	M	86
country	TZ	2009	2017	M	86
country	TZ	2009	2016	M	86
country	TZ	2009	2015	M	86
country	TZ	2009	2014	M	86
country	TZ	2009	2013	M	85
country	TZ	2009	2012	M	84
country	TZ	2009	2011	M	82
country	TZ	2009	2010	M	83
country	TZ	2009	2009	M	83
country	TZ	2009	2008	M	82
country	TZ	2009	2007	M	82
country	TZ	2009	2006	M	82
country	TZ	2009	2005	M	82
country	TZ	2009	2004	M	82
country	TZ	2009	2003	M	82
country	TZ	2009	2002	M	82
country	TZ	2009	2001	M	81
country	TZ	2009	2000	M	81
country	UG	2009	1996	M	56
country	UG	2009	1997	M	56
country	UG	2009	1998	M	56
country	UG	2009	1999	M	56
country	UG	2009	2000	M	56
country	UG	2009	2001	M	55
country	UG	2009	2002	M	55
country	UG	2009	2003	M	56
country	UG	2009	2004	M	56
country	UG	2009	2005	M	57
country	UG	2009	2006	M	56
country	UG	2009	2007	M	56
country	UG	2009	2008	M	55
country	UG	2009	2009	M	55
country	UG	2009	2010	M	55
country	UG	2009	2011	M	55
country	UG	2009	2012	M	56
country	UG	2009	2013	M	57
country	UG	2009	2014	M	56
country	UG	2009	2015	M	55
country	UG	2009	2016	M	55
country	UG	2009	2017	M	55
country	ZA	2009	2018	M	46
country	ZA	2009	2017	M	46
country	ZA	2009	2016	M	47
country	ZA	2009	2015	M	48
country	ZA	2009	2014	M	47
country	ZA	2009	2013	M	47
country	ZA	2009	2012	M	47
country	ZA	2009	2011	M	46
country	ZA	2009	2010	M	47
country	ZA	2009	2009	M	49
country	ZA	2009	2008	M	51
country	ZA	2009	2007	M	51
country	ZA	2009	2006	M	51
country	ZA	2009	2005	M	49
country	ZA	2009	2004	M	48
country	ZA	2009	2003	M	46
country	ZA	2009	2002	M	47
country	ZA	2009	2001	M	47
country	ZA	2009	2000	M	49
country	ZM	2009	1996	M	51
country	ZM	2009	1997	M	53
country	ZM	2009	1998	M	55
country	ZM	2009	1999	M	54
country	ZM	2009	2000	M	54
country	ZM	2009	2001	M	55
country	ZM	2009	2002	M	56
country	ZM	2009	2003	M	56
country	ZM	2009	2004	M	57
country	ZM	2009	2005	M	58
country	ZM	2009	2006	M	57
country	ZM	2009	2007	M	56
country	ZM	2009	2008	M	56
country	ZM	2009	2009	M	52
country	ZM	2009	2010	M	46
country	ZM	2009	2011	M	49
country	ZM	2009	2012	M	50
country	ZM	2009	2013	M	50
country	ZM	2009	2014	M	49
country	ZM	2009	2015	M	48
country	ZM	2009	2016	M	48
country	ZM	2009	2017	M	48
\.


--
-- Name: employment_to_population_ratio pk_employment_to_population_ratio; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employment_to_population_ratio
    ADD CONSTRAINT pk_employment_to_population_ratio PRIMARY KEY (geo_level, geo_code, geo_version, employment_to_population_ratio_year, sex);


--
-- PostgreSQL database dump complete
--
