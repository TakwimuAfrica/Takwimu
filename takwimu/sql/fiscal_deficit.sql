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

ALTER TABLE IF EXISTS ONLY public.fiscal_deficit DROP CONSTRAINT IF EXISTS pk_fiscal_deficit;
DROP TABLE IF EXISTS public.fiscal_deficit;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: fiscal_deficit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fiscal_deficit (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    fiscal_deficit_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: fiscal_deficit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.fiscal_deficit (geo_level, geo_code, geo_version, fiscal_deficit_year, total) FROM stdin;
country	NG	2009	2017	4.3
country	NG	2009	2018	1.4
country	NG	2009	2019	1.37
country	NG	2009	2020	1.52
country	KE	2009	2015	4.7
country	KE	2009	2016	4.9
country	KE	2009	2017	4.8
country	KE	2009	2018	2.6
\.


--
-- Name: fiscal_deficit pk_fiscal_deficit; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fiscal_deficit
    ADD CONSTRAINT pk_fiscal_deficit PRIMARY KEY (geo_level, geo_code, geo_version, fiscal_deficit_year);


--
-- PostgreSQL database dump complete
--
