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

ALTER TABLE IF EXISTS ONLY public.external_internal_debt DROP CONSTRAINT IF EXISTS pk_external_internal_debt;
DROP TABLE IF EXISTS public.external_internal_debt;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: external_internal_debt; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.external_internal_debt (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    external_or_internal character varying(128) NOT NULL,
    year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: external_internal_debt; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.external_internal_debt (geo_level, geo_code, geo_version, external_or_internal, year, total) FROM stdin;
country	KE	2009	External	2014	1138505.00
country	KE	2009	External	2015	1423252.00
country	KE	2009	External	2016	1796198.00
country	KE	2009	External	2017	2294153.00
country	KE	2009	External	2018	2568399.00
country	KE	2009	Internal	2014	1078807.00
country	KE	2009	Internal	2015	1178180.00
country	KE	2009	Internal	2016	1407082.00
country	KE	2009	Internal	2017	1677235.00
country	KE	2009	Internal	2018	1969242.09
\.


--
-- Name: external_internal_debt pk_external_internal_debt; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.external_internal_debt
    ADD CONSTRAINT pk_external_internal_debt PRIMARY KEY (geo_level, geo_code, geo_version, external_or_internal, year);


--
-- PostgreSQL database dump complete
--
