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

ALTER TABLE IF EXISTS ONLY public.employment_in_agriculture DROP CONSTRAINT IF EXISTS pk_employment_in_agriculture;
DROP TABLE IF EXISTS public.employment_in_agriculture;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: employment_in_agriculture; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employment_in_agriculture (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    employment_in_agriculture_year character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: employment_in_agriculture; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.employment_in_agriculture (geo_level, geo_code, geo_version, employment_in_agriculture_year, sex, total) FROM stdin;
country	KE	2009	1991	F	57
country	KE	2009	1991	M	38
country	KE	2009	1992	F	57
country	KE	2009	1992	M	38
country	KE	2009	1993	F	57
country	KE	2009	1993	M	38
country	KE	2009	1994	F	57
country	KE	2009	1994	M	38
country	KE	2009	1995	F	56
country	KE	2009	1995	M	38
country	KE	2009	1996	F	56
country	KE	2009	1996	M	37
country	KE	2009	1997	F	56
country	KE	2009	1997	M	37
country	KE	2009	1998	F	55
country	KE	2009	1998	M	37
country	KE	2009	1999	F	55
country	KE	2009	1999	M	37
country	KE	2009	2000	F	58
country	KE	2009	2000	M	40
country	KE	2009	2001	F	60
country	KE	2009	2001	M	43
country	KE	2009	2002	F	63
country	KE	2009	2002	M	47
country	KE	2009	2003	F	65
country	KE	2009	2003	M	50
country	KE	2009	2004	F	67
country	KE	2009	2004	M	52
country	KE	2009	2005	F	68
country	KE	2009	2005	M	55
country	KE	2009	2006	F	68
country	KE	2009	2006	M	54
country	KE	2009	2007	F	67
country	KE	2009	2007	M	54
country	KE	2009	2008	F	67
country	KE	2009	2008	M	54
country	KE	2009	2009	F	67
country	KE	2009	2009	M	54
country	KE	2009	2010	F	67
country	KE	2009	2010	M	54
country	KE	2009	2011	F	66
country	KE	2009	2011	M	53
country	KE	2009	2012	F	66
country	KE	2009	2012	M	53
country	KE	2009	2013	F	65
country	KE	2009	2013	M	53
country	KE	2009	2014	F	65
country	KE	2009	2014	M	52
country	KE	2009	2015	F	65
country	KE	2009	2015	M	52
country	KE	2009	2016	F	65
country	KE	2009	2016	M	52
country	KE	2009	2017	F	64
country	KE	2009	2017	M	52
country	KE	2009	2018	F	64
country	KE	2009	2018	M	51
\.


--
-- Name: employment_in_agriculture pk_employment_in_agriculture; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employment_in_agriculture
    ADD CONSTRAINT pk_employment_in_agriculture PRIMARY KEY (geo_level, geo_code, geo_version, employment_in_agriculture_year, sex);


--
-- PostgreSQL database dump complete
--