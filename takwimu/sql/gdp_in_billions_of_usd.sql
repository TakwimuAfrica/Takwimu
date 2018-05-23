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

ALTER TABLE IF EXISTS ONLY public.gdp_year DROP CONSTRAINT IF EXISTS pk_gdp_year;
DROP TABLE IF EXISTS public.gdp_year;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gdp_year; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gdp_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "GDP_Year" character varying(128) NOT NULL,
    total double precision
);


--
-- Data for Name: gdp_year; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gdp_year (geo_level, geo_code, geo_version, "GDP_Year", total) FROM stdin;
country	NGA	2009	2000	157
country	SEN	2009	2000	9
country	TZA	2009	2000	17
country	NGA	2009	2001	164
country	SEN	2009	2001	9
country	TZA	2009	2001	18
country	NGA	2009	2002	171
country	SEN	2009	2002	9
country	TZA	2009	2002	19
country	NGA	2009	2003	188
country	SEN	2009	2003	10
country	TZA	2009	2003	20
country	NGA	2009	2004	252
country	SEN	2009	2004	10
country	TZA	2009	2004	22
country	NGA	2009	2005	261
country	SEN	2009	2005	11
country	TZA	2009	2005	23
country	NGA	2009	2006	282
country	SEN	2009	2006	11
country	TZA	2009	2006	24
country	NGA	2009	2007	301
country	SEN	2009	2007	12
country	TZA	2009	2007	27
country	NGA	2009	2008	320
country	SEN	2009	2008	12
country	TZA	2009	2008	28
country	NGA	2009	2009	342
country	SEN	2009	2009	12
country	TZA	2009	2009	30
country	NGA	2009	2010	369
country	SEN	2009	2010	13
country	TZA	2009	2010	31
country	NGA	2009	2011	387
country	SEN	2009	2011	13
country	TZA	2009	2011	34
country	NGA	2009	2012	404
country	SEN	2009	2012	14
country	TZA	2009	2012	36
country	NGA	2009	2013	425
country	SEN	2009	2013	14
country	TZA	2009	2013	38
country	NGA	2009	2014	452
country	SEN	2009	2014	15
country	TZA	2009	2014	41
country	NGA	2009	2015	464
country	SEN	2009	2015	16
country	TZA	2009	2015	44
country	NGA	2009	2016	457
country	SEN	2009	2016	17
country	TZA	2009	2016	47
\.


--
-- Name: gdp_year pk_gdp_year; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gdp_year
    ADD CONSTRAINT pk_gdp_year PRIMARY KEY (geo_level, geo_code, geo_version, "GDP_Year");


--
-- PostgreSQL database dump complete
--

