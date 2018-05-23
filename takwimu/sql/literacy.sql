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

ALTER TABLE IF EXISTS ONLY public.literacy_year DROP CONSTRAINT IF EXISTS pk_literacy_year;
DROP TABLE IF EXISTS public.literacy_year;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: literacy_year; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE literacy_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Literacy_Year" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: literacy_year; Type: TABLE DATA; Schema: public; Owner: -
--

COPY literacy_year (geo_level, geo_code, geo_version, "Literacy_Year", total) FROM stdin;
country	NGA	2009	1991	55
country	NGA	2009	2003	55
country	NGA	2009	2008	51
country	NGA	2009	2015	60
country	SEN	2009	1988	27
country	SEN	2009	2002	39
country	SEN	2009	2006	42
country	SEN	2009	2009	50
country	SEN	2009	2011	52
country	SEN	2009	2013	43
country	SEN	2009	2015	56
country	TZA	2009	1988	59
country	TZA	2009	2002	69
country	TZA	2009	2010	68
country	TZA	2009	2012	78
country	TZA	2009	2015	80
\.


--
-- Name: literacy_year pk_literacy_year; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY literacy_year
    ADD CONSTRAINT pk_literacy_year PRIMARY KEY (geo_level, geo_code, geo_version, "Literacy_Year");


--
-- PostgreSQL database dump complete
--

