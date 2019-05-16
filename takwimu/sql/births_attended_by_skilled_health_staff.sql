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

ALTER TABLE IF EXISTS ONLY public.births_attended_by_skilled_health_staff DROP CONSTRAINT IF EXISTS pk_births_attended_by_skilled_health_staff;
DROP TABLE IF EXISTS public.births_attended_by_skilled_health_staff;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: births_attended_by_skilled_health_staff; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.births_attended_by_skilled_health_staff (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    births_attended_by_skilled_health_staff_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: births_attended_by_skilled_health_staff; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.births_attended_by_skilled_health_staff (geo_level, geo_code, geo_version, births_attended_by_skilled_health_staff_year, total) FROM stdin;
country	BF	2009	2015	80
country	BF	2009	2010	66
country	BF	2009	2006	54
country	BF	2009	2003	38
country	BF	2009	1999	31
country	BF	2009	1993	42
country	CD	2009	2014	80
country	CD	2009	2010	74
country	CD	2009	2007	65
country	CD	2009	2001	61
country	ET	2009	2016	28
country	ET	2009	2014	16
country	ET	2009	2013	23
country	ET	2009	2011	10
country	ET	2009	2005	6
country	ET	2009	2004	6
country	ET	2009	2000	6
country	KE	2009	2014	62
country	KE	2009	2009	44
country	KE	2009	2003	42
country	KE	2009	2000	43
country	KE	2009	1998	44
country	NG	2009	2017	43
country	NG	2009	2013	35
country	NG	2009	2011	47
country	NG	2009	2008	34
country	NG	2009	2003	35
country	NG	2009	1999	42
country	SN	2009	2016	53
country	SN	2009	2015	53
country	SN	2009	2014	59
country	SN	2009	2013	51
country	SN	2009	2011	65
country	SN	2009	2005	52
country	SN	2009	2004	58
country	SN	2009	2002	58
country	SN	2009	2000	58
country	SN	2009	1999	48
country	SN	2009	1997	47
country	TZ	2009	2016	64
country	TZ	2009	2012	61
country	TZ	2009	2010	49
country	TZ	2009	2005	45
country	TZ	2009	2004	43
country	TZ	2009	1999	36
country	TZ	2009	1996	38
country	TZ	2009	1992	44
country	UG	2009	2016	74
country	UG	2009	2011	57
country	UG	2009	2006	42
country	UG	2009	2001	39
country	UG	2009	2000	36
country	ZA	2009	2016	97
country	ZA	2009	2008	94
country	ZA	2009	2003	91
country	ZA	2009	1998	84
country	ZA	2009	1995	82
country	ZA	2009	1994	82
country	ZM	2009	2014	63
country	ZM	2009	2007	45
country	ZM	2009	2002	42
country	ZM	2009	1999	45
country	ZM	2009	1996	47
\.


--
-- Name: births_attended_by_skilled_health_staff pk_births_attended_by_skilled_health_staff; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.births_attended_by_skilled_health_staff
    ADD CONSTRAINT pk_births_attended_by_skilled_health_staff PRIMARY KEY (geo_level, geo_code, geo_version, births_attended_by_skilled_health_staff_year);


--
-- PostgreSQL database dump complete
--
