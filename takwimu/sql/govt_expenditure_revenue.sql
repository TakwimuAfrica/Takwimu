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

ALTER TABLE IF EXISTS ONLY public.govt_expenditure_revenue DROP CONSTRAINT IF EXISTS pk_govt_expenditure_revenue;
DROP TABLE IF EXISTS public.govt_expenditure_revenue;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: govt_expenditure_revenue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.govt_expenditure_revenue (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    expenditure_revenue character varying(128) NOT NULL,
    year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: govt_expenditure_revenue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.govt_expenditure_revenue (geo_level, geo_code, geo_version, expenditure_revenue, year, total) FROM stdin;
country	NG	2009	Expenditure	2013	13.38
country	NG	2009	Expenditure	2014	12.64
country	NG	2009	Expenditure	2015	11.07
country	NG	2009	Expenditure	2016	9.49
country	NG	2009	Expenditure	2017	11.58
country	NG	2009	Revenue	2013	11.05
country	NG	2009	Revenue	2014	10.52
country	NG	2009	Revenue	2015	7.56
country	NG	2009	Revenue	2016	5.54
country	NG	2009	Revenue	2017	6.17
country	KE	2009	Expenditure	2014	27.15
country	KE	2009	Expenditure	2015	27.2
country	KE	2009	Expenditure	2016	27.02
country	KE	2009	Expenditure	2017	25.72
country	KE	2009	Revenue	2013	19.7
country	KE	2009	Revenue	2014	19.76
country	KE	2009	Revenue	2015	19.11
country	KE	2009	Revenue	2016	18.73
country	KE	2009	Revenue	2017	17.94
\.


--
-- Name: govt_expenditure_revenue pk_govt_expenditure_revenue; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.govt_expenditure_revenue
    ADD CONSTRAINT pk_govt_expenditure_revenue PRIMARY KEY (geo_level, geo_code, geo_version, expenditure_revenue, year);


--
-- PostgreSQL database dump complete
--
