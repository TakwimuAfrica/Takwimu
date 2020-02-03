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

ALTER TABLE IF EXISTS ONLY public.debt_service_to_revenue DROP CONSTRAINT IF EXISTS pk_debt_service_to_revenue;
DROP TABLE IF EXISTS public.debt_service_to_revenue;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: debt_service_to_revenue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.debt_service_to_revenue (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    debt_service_to_revenue_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: debt_service_to_revenue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.debt_service_to_revenue (geo_level, geo_code, geo_version, debt_service_to_revenue_year, total) FROM stdin;
country	NG	2009	2010	11
country	NG	2009	2011	16
country	NG	2009	2012	17
country	NG	2009	2013	18
country	NG	2009	2014	19
country	NG	2009	2015	27
country	NG	2009	2016	34
country	NG	2009	2017	45
country	NG	2009	2018	63
\.


--
-- Name: debt_service_to_revenue pk_debt_service_to_revenue; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.debt_service_to_revenue
    ADD CONSTRAINT pk_debt_service_to_revenue PRIMARY KEY (geo_level, geo_code, geo_version, debt_service_to_revenue_year);


--
-- PostgreSQL database dump complete
--
