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

ALTER TABLE IF EXISTS ONLY public.tertiary_school_tot_enrollment DROP CONSTRAINT IF EXISTS pk_tertiary_school_tot_enrollment;
DROP TABLE IF EXISTS public.tertiary_school_tot_enrollment;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tertiary_school_tot_enrollment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tertiary_school_tot_enrollment (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    enrollment_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: tertiary_school_tot_enrollment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tertiary_school_tot_enrollment (geo_level, geo_code, geo_version, enrollment_year, total) FROM stdin;
country	ZA	2009	2012	19.1
country	ZA	2009	2013	19.9
country	ZA	2009	2014	19.8
country	ZA	2009	2016	20.9
country	ZA	2009	2017	22.4
\.


--
-- Name: tertiary_school_tot_enrollment pk_tertiary_school_tot_enrollment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tertiary_school_tot_enrollment
    ADD CONSTRAINT pk_tertiary_school_tot_enrollment PRIMARY KEY (geo_level, geo_code, geo_version, enrollment_year);


--
-- PostgreSQL database dump complete
--
