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

ALTER TABLE IF EXISTS ONLY public.hiv_prevalence_year DROP CONSTRAINT IF EXISTS pk_hiv_prevalence_year;
DROP TABLE IF EXISTS public.hiv_prevalence_year;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hiv_prevalence_year; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE hiv_prevalence_year (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "HIV_Prevalence_Year" character varying(128) NOT NULL,
    total double precision
);


--
-- Data for Name: hiv_prevalence_year; Type: TABLE DATA; Schema: public; Owner: -
--

COPY hiv_prevalence_year (geo_level, geo_code, geo_version, "HIV_Prevalence_Year", total) FROM stdin;
country	NGA	2009	2000	4
country	SEN	2009	2000	0.699999999999999956
country	TZA	2009	2000	8.90000000000000036
country	NGA	2009	2001	4.09999999999999964
country	SEN	2009	2001	0.699999999999999956
country	TZA	2009	2001	8.59999999999999964
country	NGA	2009	2002	4.09999999999999964
country	SEN	2009	2002	0.699999999999999956
country	TZA	2009	2002	8.30000000000000071
country	NGA	2009	2003	4.09999999999999964
country	SEN	2009	2003	0.800000000000000044
country	TZA	2009	2003	7.90000000000000036
country	NGA	2009	2004	4
country	SEN	2009	2004	0.800000000000000044
country	TZA	2009	2004	7.5
country	NGA	2009	2005	3.89999999999999991
country	SEN	2009	2005	0.800000000000000044
country	TZA	2009	2005	7
country	NGA	2009	2006	3.79999999999999982
country	SEN	2009	2006	0.699999999999999956
country	TZA	2009	2006	6.59999999999999964
country	NGA	2009	2007	3.70000000000000018
country	SEN	2009	2007	0.699999999999999956
country	TZA	2009	2007	6.29999999999999982
country	NGA	2009	2008	3.60000000000000009
country	SEN	2009	2008	0.699999999999999956
country	TZA	2009	2008	6.09999999999999964
country	NGA	2009	2009	3.5
country	SEN	2009	2009	0.699999999999999956
country	TZA	2009	2009	5.79999999999999982
country	NGA	2009	2010	3.39999999999999991
country	SEN	2009	2010	0.599999999999999978
country	TZA	2009	2010	5.59999999999999964
country	NGA	2009	2011	3.29999999999999982
country	SEN	2009	2011	0.599999999999999978
country	TZA	2009	2011	5.40000000000000036
country	NGA	2009	2012	3.20000000000000018
country	SEN	2009	2012	0.599999999999999978
country	TZA	2009	2012	5.20000000000000018
country	NGA	2009	2013	3.10000000000000009
country	SEN	2009	2013	0.5
country	TZA	2009	2013	5.09999999999999964
country	NGA	2009	2014	3.10000000000000009
country	SEN	2009	2014	0.5
country	TZA	2009	2014	5
country	NGA	2009	2015	3
country	SEN	2009	2015	0.5
country	TZA	2009	2015	4.79999999999999982
country	NGA	2009	2016	2.89999999999999991
country	SEN	2009	2016	0.400000000000000022
country	TZA	2009	2016	4.70000000000000018
\.


--
-- Name: hiv_prevalence_year pk_hiv_prevalence_year; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hiv_prevalence_year
    ADD CONSTRAINT pk_hiv_prevalence_year PRIMARY KEY (geo_level, geo_code, geo_version, "HIV_Prevalence_Year");


--
-- PostgreSQL database dump complete
--

