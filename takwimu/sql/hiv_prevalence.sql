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

ALTER TABLE IF EXISTS ONLY public.hiv_prevalence DROP CONSTRAINT IF EXISTS pk_hiv_prevalence;
DROP TABLE IF EXISTS public.hiv_prevalence;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hiv_prevalence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hiv_prevalence (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    hiv_prevalence_year character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: hiv_prevalence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hiv_prevalence (geo_level, geo_code, geo_version, hiv_prevalence_year, sex, total) FROM stdin;
country	ET	2009	2017	F	0
country	ET	2009	2016	F	0
country	ET	2009	2015	F	0
country	ET	2009	2014	F	0
country	ET	2009	2013	F	0
country	ET	2009	2012	F	0
country	ET	2009	2011	F	0
country	ET	2009	2010	F	1
country	ET	2009	2009	F	1
country	ET	2009	2008	F	1
country	ET	2009	2007	F	1
country	ET	2009	2006	F	1
country	ET	2009	2005	F	1
country	ET	2009	2004	F	1
country	ET	2009	2003	F	2
country	ET	2009	2002	F	2
country	ET	2009	2001	F	2
country	ET	2009	2000	F	3
country	KE	2009	2017	F	3
country	KE	2009	2016	F	3
country	KE	2009	2015	F	3
country	KE	2009	2014	F	3
country	KE	2009	2013	F	3
country	KE	2009	2012	F	3
country	KE	2009	2011	F	3
country	KE	2009	2010	F	3
country	KE	2009	2009	F	4
country	KE	2009	2008	F	4
country	KE	2009	2007	F	4
country	KE	2009	2006	F	4
country	KE	2009	2005	F	4
country	KE	2009	2004	F	4
country	KE	2009	2003	F	5
country	KE	2009	2002	F	5
country	KE	2009	2001	F	6
country	KE	2009	2000	F	7
country	NG	2009	2017	F	2
country	NG	2009	2016	F	2
country	NG	2009	2015	F	2
country	NG	2009	2014	F	2
country	NG	2009	2013	F	2
country	NG	2009	2012	F	2
country	NG	2009	2011	F	2
country	NG	2009	2010	F	2
country	NG	2009	2009	F	2
country	NG	2009	2008	F	2
country	NG	2009	2007	F	2
country	NG	2009	2006	F	2
country	NG	2009	2005	F	2
country	NG	2009	2004	F	3
country	NG	2009	2003	F	3
country	NG	2009	2002	F	3
country	NG	2009	2001	F	3
country	NG	2009	2000	F	3
country	SN	2009	2017	F	0
country	SN	2009	2016	F	0
country	SN	2009	2015	F	0
country	SN	2009	2014	F	0
country	SN	2009	2013	F	0
country	SN	2009	2012	F	0
country	SN	2009	2011	F	0
country	SN	2009	2010	F	0
country	SN	2009	2009	F	0
country	SN	2009	2008	F	0
country	SN	2009	2007	F	0
country	SN	2009	2006	F	1
country	SN	2009	2005	F	1
country	SN	2009	2004	F	1
country	SN	2009	2003	F	1
country	SN	2009	2002	F	1
country	SN	2009	2001	F	1
country	SN	2009	2000	F	1
country	TZ	2009	2017	F	2
country	TZ	2009	2016	F	2
country	TZ	2009	2015	F	2
country	TZ	2009	2014	F	2
country	TZ	2009	2013	F	3
country	TZ	2009	2012	F	3
country	TZ	2009	2011	F	3
country	TZ	2009	2010	F	3
country	TZ	2009	2009	F	3
country	TZ	2009	2008	F	3
country	TZ	2009	2007	F	3
country	TZ	2009	2006	F	3
country	TZ	2009	2005	F	3
country	TZ	2009	2004	F	4
country	TZ	2009	2003	F	4
country	TZ	2009	2002	F	4
country	TZ	2009	2001	F	5
country	TZ	2009	2000	F	5
country	ZA	2009	2017	F	10
country	ZA	2009	2016	F	10
country	ZA	2009	2015	F	10
country	ZA	2009	2014	F	10
country	ZA	2009	2013	F	11
country	ZA	2009	2012	F	11
country	ZA	2009	2011	F	11
country	ZA	2009	2010	F	11
country	ZA	2009	2009	F	12
country	ZA	2009	2008	F	12
country	ZA	2009	2007	F	12
country	ZA	2009	2006	F	13
country	ZA	2009	2005	F	13
country	ZA	2009	2004	F	14
country	ZA	2009	2003	F	15
country	ZA	2009	2002	F	15
country	ZA	2009	2001	F	16
country	ZA	2009	2000	F	16
country	ET	2009	2017	M	0
country	ET	2009	2016	M	0
country	ET	2009	2015	M	0
country	ET	2009	2014	M	0
country	ET	2009	2013	M	0
country	ET	2009	2012	M	0
country	ET	2009	2011	M	0
country	ET	2009	2010	M	0
country	ET	2009	2009	M	0
country	ET	2009	2008	M	0
country	ET	2009	2007	M	0
country	ET	2009	2006	M	0
country	ET	2009	2005	M	0
country	ET	2009	2004	M	0
country	ET	2009	2003	M	0
country	ET	2009	2002	M	1
country	ET	2009	2001	M	1
country	ET	2009	2000	M	1
country	KE	2009	2017	M	1
country	KE	2009	2016	M	1
country	KE	2009	2015	M	1
country	KE	2009	2014	M	2
country	KE	2009	2013	M	2
country	KE	2009	2012	M	2
country	KE	2009	2011	M	2
country	KE	2009	2010	M	2
country	KE	2009	2009	M	1
country	KE	2009	2008	M	1
country	KE	2009	2007	M	1
country	KE	2009	2006	M	1
country	KE	2009	2005	M	1
country	KE	2009	2004	M	2
country	KE	2009	2003	M	2
country	KE	2009	2002	M	2
country	KE	2009	2001	M	2
country	KE	2009	2000	M	2
country	NG	2009	2017	M	1
country	NG	2009	2016	M	1
country	NG	2009	2015	M	1
country	NG	2009	2014	M	1
country	NG	2009	2013	M	1
country	NG	2009	2012	M	1
country	NG	2009	2011	M	1
country	NG	2009	2010	M	1
country	NG	2009	2009	M	1
country	NG	2009	2008	M	2
country	NG	2009	2007	M	2
country	NG	2009	2006	M	2
country	NG	2009	2005	M	2
country	NG	2009	2004	M	2
country	NG	2009	2003	M	2
country	NG	2009	2002	M	2
country	NG	2009	2001	M	2
country	NG	2009	2000	M	3
country	SN	2009	2017	M	0
country	SN	2009	2016	M	0
country	SN	2009	2015	M	0
country	SN	2009	2014	M	0
country	SN	2009	2013	M	0
country	SN	2009	2012	M	0
country	SN	2009	2011	M	0
country	SN	2009	2010	M	0
country	SN	2009	2009	M	0
country	SN	2009	2008	M	0
country	SN	2009	2007	M	0
country	SN	2009	2006	M	0
country	SN	2009	2005	M	0
country	SN	2009	2004	M	0
country	SN	2009	2003	M	0
country	SN	2009	2002	M	0
country	SN	2009	2001	M	0
country	SN	2009	2000	M	0
country	TZ	2009	2017	M	1
country	TZ	2009	2016	M	1
country	TZ	2009	2015	M	1
country	TZ	2009	2014	M	1
country	TZ	2009	2013	M	1
country	TZ	2009	2012	M	1
country	TZ	2009	2011	M	1
country	TZ	2009	2010	M	1
country	TZ	2009	2009	M	1
country	TZ	2009	2008	M	1
country	TZ	2009	2007	M	1
country	TZ	2009	2006	M	1
country	TZ	2009	2005	M	2
country	TZ	2009	2004	M	2
country	TZ	2009	2003	M	2
country	TZ	2009	2002	M	2
country	TZ	2009	2001	M	2
country	TZ	2009	2000	M	2
country	ZA	2009	2017	M	4
country	ZA	2009	2016	M	4
country	ZA	2009	2015	M	4
country	ZA	2009	2014	M	4
country	ZA	2009	2013	M	4
country	ZA	2009	2012	M	4
country	ZA	2009	2011	M	4
country	ZA	2009	2010	M	4
country	ZA	2009	2009	M	4
country	ZA	2009	2008	M	4
country	ZA	2009	2007	M	4
country	ZA	2009	2006	M	5
country	ZA	2009	2005	M	5
country	ZA	2009	2004	M	5
country	ZA	2009	2003	M	5
country	ZA	2009	2002	M	5
country	ZA	2009	2001	M	6
country	ZA	2009	2000	M	6
level1	KE_1_030	2009	2018	F	1.9
level1	KE_1_036	2009	2018	F	2.7
level1	KE_1_039	2009	2018	F	3.9
level1	KE_1_040	2009	2018	F	9.4
level1	KE_1_028	2009	2018	F	2.3
level1	KE_1_014	2009	2018	F	3.8
level1	KE_1_007	2009	2018	F	1.4
level1	KE_1_043	2009	2018	F	22.1
level1	KE_1_011	2009	2018	F	4.3
level1	KE_1_034	2009	2018	F	5.5
level1	KE_1_037	2009	2018	F	5.6
level1	KE_1_035	2009	2018	F	4.1
level1	KE_1_022	2009	2018	F	5.9
level1	KE_1_003	2009	2018	F	5.4
level1	KE_1_020	2009	2018	F	4.6
level1	KE_1_045	2009	2018	F	4.7
level1	KE_1_042	2009	2018	F	17.4
level1	KE_1_015	2009	2018	F	6.1
level1	KE_1_002	2009	2018	F	5.4
level1	KE_1_031	2009	2018	F	3.8
level1	KE_1_005	2009	2018	F	4.3
level1	KE_1_016	2009	2018	F	5.1
level1	KE_1_017	2009	2018	F	5.7
level1	KE_1_009	2009	2018	F	0.3
level1	KE_1_010	2009	2018	F	1.8
level1	KE_1_012	2009	2018	F	3.3
level1	KE_1_044	2009	2018	F	14.2
level1	KE_1_001	2009	2018	F	5.9
level1	KE_1_021	2009	2018	F	6.2
level1	KE_1_047	2009	2018	F	7.5
level1	KE_1_032	2009	2018	F	4.8
level1	KE_1_029	2009	2018	F	2.9
level1	KE_1_033	2009	2018	F	3.9
level1	KE_1_046	2009	2018	F	4.5
level1	KE_1_018	2009	2018	F	5.2
level1	KE_1_019	2009	2018	F	5.5
level1	KE_1_025	2009	2018	F	2.5
level1	KE_1_041	2009	2018	F	22.4
level1	KE_1_006	2009	2018	F	5.8
level1	KE_1_004	2009	2018	F	1.8
level1	KE_1_013	2009	2018	F	4.4
level1	KE_1_026	2009	2018	F	6.1
level1	KE_1_023	2009	2018	F	4.5
level1	KE_1_027	2009	2018	F	5.5
level1	KE_1_038	2009	2018	F	6.7
level1	KE_1_008	2009	2018	F	0.2
level1	KE_1_024	2009	2018	F	2.2
level1	KE_1_030	2009	2018	M	1.1
level1	KE_1_036	2009	2018	M	1.6
level1	KE_1_039	2009	2018	M	2.4
level1	KE_1_040	2009	2018	M	5.7
level1	KE_1_028	2009	2018	M	1.4
level1	KE_1_014	2009	2018	M	1.6
level1	KE_1_007	2009	2018	M	0.3
level1	KE_1_043	2009	2018	M	19.1
level1	KE_1_011	2009	2018	M	1.9
level1	KE_1_034	2009	2018	M	3.3
level1	KE_1_037	2009	2018	M	3.4
level1	KE_1_035	2009	2018	M	2.4
level1	KE_1_022	2009	2018	M	2.1
level1	KE_1_003	2009	2018	M	2.3
level1	KE_1_020	2009	2018	M	1.7
level1	KE_1_045	2009	2018	M	4
level1	KE_1_042	2009	2018	M	15
level1	KE_1_015	2009	2018	M	2.7
level1	KE_1_002	2009	2018	M	2.3
level1	KE_1_031	2009	2018	M	2.3
level1	KE_1_005	2009	2018	M	1.8
level1	KE_1_016	2009	2018	M	2.2
level1	KE_1_017	2009	2018	M	2.5
level1	KE_1_009	2009	2018	M	0.1
level1	KE_1_010	2009	2018	M	0.8
level1	KE_1_012	2009	2018	M	1.4
level1	KE_1_044	2009	2018	M	12.2
level1	KE_1_001	2009	2018	M	2.5
level1	KE_1_021	2009	2018	M	2.2
level1	KE_1_047	2009	2018	M	4.7
level1	KE_1_032	2009	2018	M	2.9
level1	KE_1_029	2009	2018	M	1.7
level1	KE_1_033	2009	2018	M	2.3
level1	KE_1_046	2009	2018	M	3.9
level1	KE_1_018	2009	2018	M	1.9
level1	KE_1_019	2009	2018	M	1.9
level1	KE_1_025	2009	2018	M	1.5
level1	KE_1_041	2009	2018	M	19.4
level1	KE_1_006	2009	2018	M	2.5
level1	KE_1_004	2009	2018	M	0.8
level1	KE_1_013	2009	2018	M	1.9
level1	KE_1_026	2009	2018	M	3.7
level1	KE_1_023	2009	2018	M	2.7
level1	KE_1_027	2009	2018	M	3.3
level1	KE_1_038	2009	2018	M	4
level1	KE_1_008	2009	2018	M	0.03
level1	KE_1_024	2009	2018	M	1.3
\.


--
-- Name: hiv_prevalence pk_hiv_prevalence; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hiv_prevalence
    ADD CONSTRAINT pk_hiv_prevalence PRIMARY KEY (geo_level, geo_code, geo_version, hiv_prevalence_year, sex);


--
-- PostgreSQL database dump complete
--

