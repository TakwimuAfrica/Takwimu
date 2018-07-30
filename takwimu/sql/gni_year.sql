--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.gni_year DROP CONSTRAINT IF EXISTS pk_gni_year;
DROP TABLE IF EXISTS public.gni_year;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gni_year; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gni_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "GNI_Year" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: gni_year; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.gni_year (geo_level, geo_code, geo_version, "GNI_Year", total) FROM stdin;
country	NG	2009	2000	270
country	SN	2009	2000	510
country	TZ	2009	2000	300
country	NG	2009	2001	310
country	SN	2009	2001	490
country	TZ	2009	2001	300
country	NG	2009	2002	350
country	SN	2009	2002	470
country	TZ	2009	2002	310
country	NG	2009	2003	410
country	SN	2009	2003	550
country	TZ	2009	2003	320
country	NG	2009	2004	610
country	SN	2009	2004	670
country	TZ	2009	2004	350
country	NG	2009	2005	670
country	SN	2009	2005	780
country	TZ	2009	2005	400
country	NG	2009	2006	850
country	SN	2009	2006	810
country	TZ	2009	2006	450
country	NG	2009	2007	980
country	SN	2009	2007	870
country	TZ	2009	2007	510
country	NG	2009	2008	1160
country	SN	2009	2008	990
country	TZ	2009	2008	580
country	NG	2009	2009	1160
country	SN	2009	2009	1040
country	TZ	2009	2009	630
country	NG	2009	2010	1470
country	SN	2009	2010	1050
country	TZ	2009	2010	690
country	NG	2009	2011	1730
country	SN	2009	2011	1020
country	TZ	2009	2011	730
country	NG	2009	2012	2480
country	SN	2009	2012	1040
country	TZ	2009	2012	770
country	NG	2009	2013	2700
country	SN	2009	2013	1050
country	TZ	2009	2013	840
country	NG	2009	2014	2980
country	SN	2009	2014	1030
country	TZ	2009	2014	920
country	NG	2009	2015	2850
country	SN	2009	2015	980
country	TZ	2009	2015	910
country	NG	2009	2016	2450
country	SN	2009	2016	950
country	TZ	2009	2016	900
\.


--
-- Name: gni_year pk_gni_year; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gni_year
    ADD CONSTRAINT pk_gni_year PRIMARY KEY (geo_level, geo_code, geo_version, "GNI_Year");


--
-- PostgreSQL database dump complete
--

