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
country	ET	2009	2018	female	71
country	ET	2009	2017	female	71
country	ET	2009	2016	female	71
country	ET	2009	2015	female	71
country	ET	2009	2014	female	72
country	ET	2009	2013	female	72
country	ET	2009	2012	female	72
country	ET	2009	2011	female	72
country	ET	2009	2010	female	72
country	ET	2009	2009	female	72
country	ET	2009	2008	female	72
country	ET	2009	2007	female	72
country	ET	2009	2006	female	72
country	ET	2009	2005	female	72
country	ET	2009	2004	female	70
country	ET	2009	2003	female	69
country	ET	2009	2002	female	67
country	ET	2009	2001	female	65
country	ET	2009	2000	female	64
country	KE	2009	2018	female	53
country	KE	2009	2017	female	53
country	KE	2009	2016	female	53
country	KE	2009	2015	female	53
country	KE	2009	2014	female	53
country	KE	2009	2013	female	52
country	KE	2009	2012	female	52
country	KE	2009	2011	female	52
country	KE	2009	2010	female	52
country	KE	2009	2009	female	51
country	KE	2009	2008	female	52
country	KE	2009	2007	female	52
country	KE	2009	2006	female	52
country	KE	2009	2005	female	52
country	KE	2009	2004	female	53
country	KE	2009	2003	female	55
country	KE	2009	2002	female	56
country	KE	2009	2001	female	58
country	KE	2009	2000	female	59
country	NG	2009	2018	female	47
country	NG	2009	2017	female	47
country	NG	2009	2016	female	47
country	NG	2009	2015	female	48
country	NG	2009	2014	female	48
country	NG	2009	2013	female	48
country	NG	2009	2012	female	48
country	NG	2009	2011	female	48
country	NG	2009	2010	female	47
country	NG	2009	2009	female	47
country	NG	2009	2008	female	47
country	NG	2009	2007	female	46
country	NG	2009	2006	female	46
country	NG	2009	2005	female	46
country	NG	2009	2004	female	45
country	NG	2009	2003	female	45
country	NG	2009	2002	female	45
country	NG	2009	2001	female	45
country	NG	2009	2000	female	45
country	SN	2009	2018	female	44
country	SN	2009	2017	female	43
country	SN	2009	2016	female	43
country	SN	2009	2015	female	43
country	SN	2009	2014	female	42
country	SN	2009	2013	female	41
country	SN	2009	2012	female	40
country	SN	2009	2011	female	38
country	SN	2009	2010	female	37
country	SN	2009	2009	female	35
country	SN	2009	2008	female	33
country	SN	2009	2007	female	31
country	SN	2009	2006	female	30
country	SN	2009	2005	female	30
country	SN	2009	2004	female	30
country	SN	2009	2003	female	31
country	SN	2009	2002	female	31
country	SN	2009	2001	female	31
country	SN	2009	2000	female	31
country	TZ	2009	2018	female	77
country	TZ	2009	2017	female	77
country	TZ	2009	2016	female	77
country	TZ	2009	2015	female	77
country	TZ	2009	2014	female	77
country	TZ	2009	2013	female	77
country	TZ	2009	2012	female	78
country	TZ	2009	2011	female	78
country	TZ	2009	2010	female	79
country	TZ	2009	2009	female	79
country	TZ	2009	2008	female	78
country	TZ	2009	2007	female	78
country	TZ	2009	2006	female	77
country	TZ	2009	2005	female	77
country	TZ	2009	2004	female	77
country	TZ	2009	2003	female	78
country	TZ	2009	2002	female	78
country	TZ	2009	2001	female	76
country	TZ	2009	2000	female	77
country	ZA	2009	2018	female	34
country	ZA	2009	2017	female	34
country	ZA	2009	2016	female	34
country	ZA	2009	2015	female	35
country	ZA	2009	2014	female	34
country	ZA	2009	2013	female	34
country	ZA	2009	2012	female	33
country	ZA	2009	2011	female	33
country	ZA	2009	2010	female	33
country	ZA	2009	2009	female	34
country	ZA	2009	2008	female	36
country	ZA	2009	2007	female	34
country	ZA	2009	2006	female	33
country	ZA	2009	2005	female	33
country	ZA	2009	2004	female	33
country	ZA	2009	2003	female	31
country	ZA	2009	2002	female	31
country	ZA	2009	2001	female	32
country	ZA	2009	2000	female	33
country	ET	2009	2018	male	85
country	ET	2009	2017	male	85
country	ET	2009	2016	male	85
country	ET	2009	2015	male	86
country	ET	2009	2014	male	86
country	ET	2009	2013	male	87
country	ET	2009	2012	male	87
country	ET	2009	2011	male	87
country	ET	2009	2010	male	87
country	ET	2009	2009	male	88
country	ET	2009	2008	male	88
country	ET	2009	2007	male	88
country	ET	2009	2006	male	88
country	ET	2009	2005	male	88
country	ET	2009	2004	male	88
country	ET	2009	2003	male	87
country	ET	2009	2002	male	87
country	ET	2009	2001	male	87
country	ET	2009	2000	male	86
country	KE	2009	2018	male	63
country	KE	2009	2017	male	63
country	KE	2009	2016	male	63
country	KE	2009	2015	male	63
country	KE	2009	2014	male	64
country	KE	2009	2013	male	64
country	KE	2009	2012	male	64
country	KE	2009	2011	male	64
country	KE	2009	2010	male	64
country	KE	2009	2009	male	64
country	KE	2009	2008	male	65
country	KE	2009	2007	male	65
country	KE	2009	2006	male	64
country	KE	2009	2005	male	64
country	KE	2009	2004	male	65
country	KE	2009	2003	male	66
country	KE	2009	2002	male	67
country	KE	2009	2001	male	67
country	KE	2009	2000	male	68
country	NG	2009	2018	male	55
country	NG	2009	2017	male	55
country	NG	2009	2016	male	55
country	NG	2009	2015	male	57
country	NG	2009	2014	male	57
country	NG	2009	2013	male	58
country	NG	2009	2012	male	58
country	NG	2009	2011	male	58
country	NG	2009	2010	male	58
country	NG	2009	2009	male	58
country	NG	2009	2008	male	59
country	NG	2009	2007	male	59
country	NG	2009	2006	male	59
country	NG	2009	2005	male	59
country	NG	2009	2004	male	59
country	NG	2009	2003	male	60
country	NG	2009	2002	male	60
country	NG	2009	2001	male	60
country	NG	2009	2000	male	60
country	SN	2009	2018	male	67
country	SN	2009	2017	male	67
country	SN	2009	2016	male	66
country	SN	2009	2015	male	66
country	SN	2009	2014	male	66
country	SN	2009	2013	male	65
country	SN	2009	2012	male	65
country	SN	2009	2011	male	64
country	SN	2009	2010	male	64
country	SN	2009	2009	male	64
country	SN	2009	2008	male	64
country	SN	2009	2007	male	64
country	SN	2009	2006	male	64
country	SN	2009	2005	male	65
country	SN	2009	2004	male	66
country	SN	2009	2003	male	66
country	SN	2009	2002	male	67
country	SN	2009	2001	male	68
country	SN	2009	2000	male	68
country	TZ	2009	2018	male	86
country	TZ	2009	2017	male	86
country	TZ	2009	2016	male	86
country	TZ	2009	2015	male	86
country	TZ	2009	2014	male	86
country	TZ	2009	2013	male	85
country	TZ	2009	2012	male	84
country	TZ	2009	2011	male	82
country	TZ	2009	2010	male	83
country	TZ	2009	2009	male	83
country	TZ	2009	2008	male	82
country	TZ	2009	2007	male	82
country	TZ	2009	2006	male	82
country	TZ	2009	2005	male	82
country	TZ	2009	2004	male	82
country	TZ	2009	2003	male	82
country	TZ	2009	2002	male	82
country	TZ	2009	2001	male	81
country	TZ	2009	2000	male	81
country	ZA	2009	2018	male	46
country	ZA	2009	2017	male	46
country	ZA	2009	2016	male	47
country	ZA	2009	2015	male	48
country	ZA	2009	2014	male	47
country	ZA	2009	2013	male	47
country	ZA	2009	2012	male	47
country	ZA	2009	2011	male	46
country	ZA	2009	2010	male	47
country	ZA	2009	2009	male	49
country	ZA	2009	2008	male	51
country	ZA	2009	2007	male	51
country	ZA	2009	2006	male	51
country	ZA	2009	2005	male	49
country	ZA	2009	2004	male	48
country	ZA	2009	2003	male	46
country	ZA	2009	2002	male	47
country	ZA	2009	2001	male	47
country	ZA	2009	2000	male	49
\.


--
-- Name: employment_to_population_ratio pk_employment_to_population_ratio; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employment_to_population_ratio
    ADD CONSTRAINT pk_employment_to_population_ratio PRIMARY KEY (geo_level, geo_code, geo_version, employment_to_population_ratio_year, sex);


--
-- PostgreSQL database dump complete
--

