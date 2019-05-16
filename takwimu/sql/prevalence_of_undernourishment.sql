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

ALTER TABLE IF EXISTS ONLY public.prevalence_of_undernourishment DROP CONSTRAINT IF EXISTS pk_prevalence_of_undernourishment;
DROP TABLE IF EXISTS public.prevalence_of_undernourishment;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: prevalence_of_undernourishment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prevalence_of_undernourishment (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    prevalence_of_undernourishment_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: prevalence_of_undernourishment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prevalence_of_undernourishment (geo_level, geo_code, geo_version, prevalence_of_undernourishment_year, total) FROM stdin;
country	BF	2009	2000	25
country	BF	2009	2001	26
country	BF	2009	2002	26
country	BF	2009	2003	26
country	BF	2009	2004	25
country	BF	2009	2005	25
country	BF	2009	2006	24
country	BF	2009	2007	24
country	BF	2009	2008	23
country	BF	2009	2009	22
country	BF	2009	2010	21
country	BF	2009	2011	21
country	BF	2009	2012	20
country	BF	2009	2013	20
country	BF	2009	2014	19
country	BF	2009	2015	20
country	BF	2009	2016	21
country	ET	2009	2016	21
country	ET	2009	2015	23
country	ET	2009	2014	25
country	ET	2009	2013	27
country	ET	2009	2012	29
country	ET	2009	2011	31
country	ET	2009	2010	32
country	ET	2009	2009	34
country	ET	2009	2008	36
country	ET	2009	2007	37
country	ET	2009	2006	39
country	ET	2009	2005	40
country	ET	2009	2004	42
country	ET	2009	2003	44
country	ET	2009	2002	47
country	ET	2009	2001	49
country	ET	2009	2000	52
country	KE	2009	2016	24
country	KE	2009	2015	23
country	KE	2009	2014	21
country	KE	2009	2013	21
country	KE	2009	2012	22
country	KE	2009	2011	23
country	KE	2009	2010	24
country	KE	2009	2009	25
country	KE	2009	2008	25
country	KE	2009	2007	26
country	KE	2009	2006	26
country	KE	2009	2005	28
country	KE	2009	2004	31
country	KE	2009	2003	33
country	KE	2009	2002	33
country	KE	2009	2001	32
country	KE	2009	2000	31
country	NG	2009	2016	12
country	NG	2009	2015	9
country	NG	2009	2014	8
country	NG	2009	2013	7
country	NG	2009	2012	7
country	NG	2009	2011	7
country	NG	2009	2010	6
country	NG	2009	2009	6
country	NG	2009	2008	6
country	NG	2009	2007	6
country	NG	2009	2006	6
country	NG	2009	2005	7
country	NG	2009	2004	7
country	NG	2009	2003	8
country	NG	2009	2002	9
country	NG	2009	2001	9
country	NG	2009	2000	9
country	SN	2009	2016	11
country	SN	2009	2015	12
country	SN	2009	2014	12
country	SN	2009	2013	12
country	SN	2009	2012	13
country	SN	2009	2011	13
country	SN	2009	2010	13
country	SN	2009	2009	14
country	SN	2009	2008	15
country	SN	2009	2007	17
country	SN	2009	2006	19
country	SN	2009	2005	22
country	SN	2009	2004	23
country	SN	2009	2003	25
country	SN	2009	2002	27
country	SN	2009	2001	28
country	SN	2009	2000	29
country	TZ	2009	2016	32
country	TZ	2009	2015	32
country	TZ	2009	2014	32
country	TZ	2009	2013	33
country	TZ	2009	2012	33
country	TZ	2009	2011	34
country	TZ	2009	2010	35
country	TZ	2009	2009	35
country	TZ	2009	2008	34
country	TZ	2009	2007	33
country	TZ	2009	2006	33
country	TZ	2009	2005	34
country	TZ	2009	2004	36
country	TZ	2009	2003	37
country	TZ	2009	2002	37
country	TZ	2009	2001	37
country	TZ	2009	2000	37
country	UG	2009	2000	28
country	UG	2009	2001	28
country	UG	2009	2002	27
country	UG	2009	2003	25
country	UG	2009	2004	24
country	UG	2009	2005	24
country	UG	2009	2006	26
country	UG	2009	2007	28
country	UG	2009	2008	30
country	UG	2009	2009	31
country	UG	2009	2010	31
country	UG	2009	2011	32
country	UG	2009	2012	33
country	UG	2009	2013	35
country	UG	2009	2014	36
country	UG	2009	2015	39
country	ZA	2009	2016	6
country	ZA	2009	2015	6
country	ZA	2009	2014	5
country	ZA	2009	2013	5
country	ZA	2009	2012	5
country	ZA	2009	2011	4
country	ZA	2009	2010	4
country	ZA	2009	2009	5
country	ZA	2009	2008	5
country	ZA	2009	2007	5
country	ZA	2009	2006	5
country	ZA	2009	2005	4
country	ZA	2009	2004	4
country	ZA	2009	2003	4
country	ZA	2009	2002	5
country	ZA	2009	2001	5
country	ZA	2009	2000	5
country	ZM	2009	2000	48
country	ZM	2009	2001	49
country	ZM	2009	2002	50
country	ZM	2009	2003	50
country	ZM	2009	2004	50
country	ZM	2009	2005	51
country	ZM	2009	2006	53
country	ZM	2009	2007	54
country	ZM	2009	2008	53
country	ZM	2009	2009	51
country	ZM	2009	2010	50
country	ZM	2009	2011	49
country	ZM	2009	2012	48
country	ZM	2009	2013	47
country	ZM	2009	2014	47
country	ZM	2009	2015	46
\.


--
-- Name: prevalence_of_undernourishment pk_prevalence_of_undernourishment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prevalence_of_undernourishment
    ADD CONSTRAINT pk_prevalence_of_undernourishment PRIMARY KEY (geo_level, geo_code, geo_version, prevalence_of_undernourishment_year);


--
-- PostgreSQL database dump complete
--
