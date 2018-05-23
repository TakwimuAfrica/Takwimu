--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gni_year; Type: TABLE; Schema: public; Owner: humandev
--

CREATE TABLE gni_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "GNI_Year" character varying(128) NOT NULL,
    total integer
);


ALTER TABLE gni_year OWNER TO humandev;

--
-- Data for Name: gni_year; Type: TABLE DATA; Schema: public; Owner: humandev
--

COPY gni_year (geo_level, geo_code, geo_version, "GNI_Year", total) FROM stdin;
country	NGA	2009	2000	270
country	SEN	2009	2000	510
country	TZA	2009	2000	300
country	NGA	2009	2001	310
country	SEN	2009	2001	490
country	TZA	2009	2001	300
country	NGA	2009	2002	350
country	SEN	2009	2002	470
country	TZA	2009	2002	310
country	NGA	2009	2003	410
country	SEN	2009	2003	550
country	TZA	2009	2003	320
country	NGA	2009	2004	610
country	SEN	2009	2004	670
country	TZA	2009	2004	350
country	NGA	2009	2005	670
country	SEN	2009	2005	780
country	TZA	2009	2005	400
country	NGA	2009	2006	850
country	SEN	2009	2006	810
country	TZA	2009	2006	450
country	NGA	2009	2007	980
country	SEN	2009	2007	870
country	TZA	2009	2007	510
country	NGA	2009	2008	1160
country	SEN	2009	2008	990
country	TZA	2009	2008	580
country	NGA	2009	2009	1160
country	SEN	2009	2009	1040
country	TZA	2009	2009	630
country	NGA	2009	2010	1470
country	SEN	2009	2010	1050
country	TZA	2009	2010	690
country	NGA	2009	2011	1730
country	SEN	2009	2011	1020
country	TZA	2009	2011	730
country	NGA	2009	2012	2480
country	SEN	2009	2012	1040
country	TZA	2009	2012	770
country	NGA	2009	2013	2700
country	SEN	2009	2013	1050
country	TZA	2009	2013	840
country	NGA	2009	2014	2980
country	SEN	2009	2014	1030
country	TZA	2009	2014	920
country	NGA	2009	2015	2850
country	SEN	2009	2015	980
country	TZA	2009	2015	910
country	NGA	2009	2016	2450
country	SEN	2009	2016	950
country	TZA	2009	2016	900
\.


--
-- Name: gni_year pk_gni_year; Type: CONSTRAINT; Schema: public; Owner: humandev
--

ALTER TABLE ONLY gni_year
    ADD CONSTRAINT pk_gni_year PRIMARY KEY (geo_level, geo_code, geo_version, "GNI_Year");


--
-- PostgreSQL database dump complete
--