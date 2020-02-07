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

ALTER TABLE IF EXISTS ONLY public.immunization_coverage DROP CONSTRAINT IF EXISTS pk_immunization_coverage;
DROP TABLE IF EXISTS public.immunization_coverage;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: immunization_coverage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.immunization_coverage (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: immunization_coverage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.immunization_coverage (geo_level, geo_code, geo_version, year, total) FROM stdin;
country	KE	2009	2014	77.5
country	KE	2009	2015	79.5
country	KE	2009	2016	78.3
country	KE	2009	2017	68.4
country	KE	2009	2018	81.4
\.


--
-- Name: immunization_coverage pk_immunization_coverage; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.immunization_coverage
    ADD CONSTRAINT pk_immunization_coverage PRIMARY KEY (geo_level, geo_code, geo_version, year);


--
-- PostgreSQL database dump complete
--
