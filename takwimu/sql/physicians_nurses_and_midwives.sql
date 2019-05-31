--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.physicians_nurses_and_midwives DROP CONSTRAINT IF EXISTS pk_physicians_nurses_and_midwives;
DROP TABLE IF EXISTS public.physicians_nurses_and_midwives;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: physicians_nurses_and_midwives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.physicians_nurses_and_midwives (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    physicians_nurses_and_midwives_year character varying(128) NOT NULL,
    total double precision
);


--
-- Data for Name: physicians_nurses_and_midwives; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.physicians_nurses_and_midwives (geo_level, geo_code, geo_version, physicians_nurses_and_midwives_year, total) FROM stdin;
country	BF	2009	2012	0.0470000000000000001
country	BF	2009	2011	0.0379999999999999991
country	BF	2009	2010	0.0459999999999999992
country	BF	2009	2009	0.0449999999999999983
country	BF	2009	2008	0.0320000000000000007
country	BF	2009	2006	0.0279999999999999971
country	BF	2009	2004	0.0540000000000000063
country	BF	2009	2001	0.0400000000000000008
country	CD	2009	2009	0.0909999999999999976
country	CD	2009	2004	0.106999999999999998
country	ET	2009	2010	0.0220000000000000022
country	ET	2009	2009	0.0250000000000000014
country	ET	2009	2008	0.0250000000000000014
country	ET	2009	2007	0.0220000000000000022
country	ET	2009	2006	0.0270000000000000032
country	ET	2009	2005	0.0320000000000000007
country	ET	2009	2004	0.0270000000000000032
country	ET	2009	2003	0.0270000000000000032
country	ET	2009	2002	0.028999999999999998
country	ET	2009	2001	0.0279999999999999971
country	ET	2009	2000	0.0210000000000000013
country	KE	2009	2014	0.203999999999999987
country	KE	2009	2013	0.198999999999999982
country	KE	2009	2012	0.190000000000000002
country	KE	2009	2011	0.181999999999999995
country	KE	2009	2010	0.176999999999999991
country	KE	2009	2009	0.176000000000000018
country	KE	2009	2008	0.173000000000000015
country	KE	2009	2002	0.138000000000000012
country	NG	2009	2010	0.395000000000000018
country	NG	2009	2009	0.376000000000000001
country	NG	2009	2008	0.373999999999999999
country	NG	2009	2007	0.376000000000000001
country	NG	2009	2006	0.34600000000000003
country	NG	2009	2005	0.281000000000000028
country	NG	2009	2003	0.263000000000000012
country	NG	2009	2000	0.268999999999999961
country	SN	2009	2016	0.0680000000000000049
country	SN	2009	2010	0.0590000000000000038
country	SN	2009	2008	0.0609999999999999987
country	SN	2009	2004	0.0540000000000000063
country	TZ	2009	2014	0.0220000000000000022
country	TZ	2009	2012	0.0299999999999999989
country	TZ	2009	2010	0.00800000000000000017
country	TZ	2009	2002	0.0229999999999999996
country	UG	2009	2015	0.0930000000000000132
country	UG	2009	2010	0.116999999999999993
country	UG	2009	2005	0.119999999999999996
country	UG	2009	2004	0.0810000000000000026
country	UG	2009	2002	0.0470000000000000001
country	ZA	2009	2016	0.817999999999999949
country	ZA	2009	2015	0.767000000000000015
country	ZA	2009	2014	0.755999999999999894
country	ZA	2009	2013	0.741999999999999993
country	ZA	2009	2012	0.724999999999999978
country	ZA	2009	2011	0.714999999999999969
country	ZA	2009	2010	0.72799999999999998
country	ZA	2009	2004	0.730999999999999983
country	ZM	2009	2016	0.0909999999999999976
country	ZM	2009	2012	0.162000000000000005
country	ZM	2009	2011	0.161000000000000004
country	ZM	2009	2010	0.0599999999999999978
country	ZM	2009	2009	0.0590000000000000038
country	ZM	2009	2008	0.0609999999999999987
country	ZM	2009	2006	0.0520000000000000046
country	ZM	2009	2005	0.0540000000000000063
country	ZM	2009	2004	0.128000000000000003
\.


--
-- Name: physicians_nurses_and_midwives pk_physicians_nurses_and_midwives; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.physicians_nurses_and_midwives
    ADD CONSTRAINT pk_physicians_nurses_and_midwives PRIMARY KEY (geo_level, geo_code, geo_version, physicians_nurses_and_midwives_year);


--
-- PostgreSQL database dump complete
--

