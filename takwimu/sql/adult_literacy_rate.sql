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
country	BF	2009	2014	F	26
country	BF	2009	2007	F	22
country	BF	2009	2006	F	16
country	BF	2009	2005	F	17
country	BF	2009	2003	F	15
country	BF	2009	1996	F	8
country	CD	2009	2016	F	66
country	CD	2009	2012	F	63
country	CD	2009	2007	F	46
country	CD	2009	2001	F	54
country	ET	2009	2007	F	29
country	ET	2009	2005	F	18
country	ET	2009	2004	F	23
country	KE	2009	2014	F	74
country	KE	2009	2007	F	67
country	KE	2009	2000	F	78
country	NG	2009	2008	F	41
country	NG	2009	2003	F	43
country	NG	2009	1991	F	44
country	SN	2009	2017	F	40
country	SN	2009	2013	F	34
country	SN	2009	2011	F	40
country	SN	2009	2009	F	39
country	SN	2009	2006	F	33
country	SN	2009	2002	F	29
country	TZ	2009	2015	F	73
country	TZ	2009	2012	F	73
country	TZ	2009	2010	F	61
country	TZ	2009	2002	F	62
country	UG	2009	2012	F	62
country	UG	2009	2010	F	65
country	UG	2009	2006	F	62
country	UG	2009	2002	F	59
country	ZA	2009	2015	F	93
country	ZA	2009	2014	F	93
country	ZA	2009	2012	F	93
country	ZA	2009	2011	F	92
country	ZA	2009	2010	F	92
country	ZA	2009	2009	F	92
country	ZA	2009	2007	F	87
country	ZM	2009	2010	F	78
country	ZM	2009	2007	F	52
country	ZM	2009	2002	F	62
country	ZM	2009	1999	F	60
country	BF	2009	2014	M	44
country	BF	2009	2007	M	37
country	BF	2009	2006	M	30
country	BF	2009	2005	M	31
country	BF	2009	2003	M	29
country	BF	2009	1996	M	19
country	CD	2009	2016	M	89
country	CD	2009	2012	M	88
country	CD	2009	2007	M	77
country	CD	2009	2001	M	81
country	ET	2009	2007	M	49
country	ET	2009	2005	M	42
country	ET	2009	2004	M	50
country	KE	2009	2014	M	84
country	KE	2009	2007	M	78
country	KE	2009	2000	M	87
country	NG	2009	2008	M	61
country	NG	2009	2003	M	67
country	NG	1991	2003	M	68
country	SN	2009	2017	M	65
country	SN	2009	2013	M	53
country	SN	2009	2011	M	66
country	SN	2009	2009	M	62
country	SN	2009	2006	M	52
country	SN	2009	2002	M	51
country	TZ	2009	2015	M	83
country	TZ	2009	2012	M	83
country	TZ	2009	2010	M	75
country	TZ	2009	2002	M	78
country	UG	2009	2012	M	79
country	UG	2009	2010	M	83
country	UG	2009	2006	M	81
country	UG	2009	2002	M	78
country	ZA	2009	2015	M	95
country	ZA	2009	2014	M	95
country	ZA	2009	2012	M	95
country	ZA	2009	2011	M	94
country	ZA	2009	2010	M	94
country	ZA	2009	2009	M	94
country	ZA	2009	2007	M	91
country	ZM	2009	2010	M	89
country	ZM	2009	2007	M	72
country	ZM	2009	2002	M	81
country	ZM	2009	1999	M	76
\.


--
-- Name: adult_literacy_rate pk_adult_literacy_rate; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.adult_literacy_rate
    ADD CONSTRAINT pk_adult_literacy_rate PRIMARY KEY (geo_level, geo_code, geo_version, adult_literacy_rate_year, sex);


--
-- PostgreSQL database dump complete
--
