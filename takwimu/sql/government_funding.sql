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

ALTER TABLE IF EXISTS ONLY public.government_funding DROP CONSTRAINT IF EXISTS pk_government_funding;
DROP TABLE IF EXISTS public.government_funding;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: government_funding; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.government_funding (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year character varying(128) NOT NULL,
    sector character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: government_funding; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.government_funding (geo_level, geo_code, geo_version, year, sector, total) FROM stdin;
country	KE	2009	2014	Health	3
country	KE	2009	2014	Education	16
country	KE	2009	2014	Social protection	3
country	KE	2009	2015	Health	2
country	KE	2009	2015	Education	15
country	KE	2009	2015	Social protection	4
country	KE	2009	2016	Health	2
country	KE	2009	2016	Education	14
country	KE	2009	2016	Social protection	4
country	KE	2009	2017	Health	2
country	KE	2009	2017	Education	15
country	KE	2009	2017	Social protection	4
\.


--
-- Name: government_funding pk_government_funding; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.government_funding
    ADD CONSTRAINT pk_government_funding PRIMARY KEY (geo_level, geo_code, geo_version, year, sector);


--
-- PostgreSQL database dump complete
--

