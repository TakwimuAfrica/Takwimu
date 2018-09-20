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

ALTER TABLE IF EXISTS ONLY public.fgm_prevalence DROP CONSTRAINT IF EXISTS pk_fgm_prevalence;
DROP TABLE IF EXISTS public.fgm_prevalence;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: fgm_prevalence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fgm_prevalence (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    age character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: fgm_prevalence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fgm_prevalence (geo_level, geo_code, geo_version, age, total) FROM stdin;
country	KE	2009	15-19	11
country	KE	2009	20-24	15
country	KE	2009	25-29	18
country	KE	2009	30-34	23
country	KE	2009	35-39	28
country	KE	2009	40-44	32
country	KE	2009	45-49	41
\.


--
-- Name: fgm_prevalence pk_fgm_prevalence; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fgm_prevalence
    ADD CONSTRAINT pk_fgm_prevalence PRIMARY KEY (geo_level, geo_code, geo_version, age);


--
-- PostgreSQL database dump complete
--

