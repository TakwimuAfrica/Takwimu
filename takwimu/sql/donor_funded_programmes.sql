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

ALTER TABLE IF EXISTS ONLY public.donor_funded_programmes DROP CONSTRAINT IF EXISTS pk_donor_funded_programmes;
DROP TABLE IF EXISTS public.donor_funded_programmes;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: donor_funded_programmes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.donor_funded_programmes (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    programme character varying(128) NOT NULL,
    donor character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: donor_funded_programmes; Type: TABLE DATA; Schema: public; Owner: -
--
-- Legend:
-- Kenya Market Assistance Programme KMAP
-- Adolescent Girls Initiative AGI
-- Reducing Maternal and Newborn Deaths in Kenya RMNDK
-- Delivering Increased Family Planning Across Rural Kenya DIFPARK
-- Kenya Climate Smart Agriculture Project KCSAP
-- National Agricultural and Rural Inclusive Growth Project NARIGP
-- Kenya Secondary Education Quality Improvement Project SEQUIP
-- Primary Education Development Project PRIEDE
-- Transforming Health Systems for Universal Care Project THSUCP

COPY public.donor_funded_programmes (geo_level, geo_code, geo_version, programme, donor, total) FROM stdin;
country	KE	2009	KMAP	 DFID	69000000
country	KE	2009	AGI	 DFID	15000000
country	KE	2009	RMNDK	 DFID	85000000
country	KE	2009	DIFPARK	 DFID	52000000
country	KE	2009	KCSAP	 World Bank	279000000
country	KE	2009	NARIGP	 World Bank	219000000
country	KE	2009	SEQUIP	 World Bank	200000000
country	KE	2009	PRIEDE	 World Bank	88000000
country	KE	2009	THSUCP	 World Bank	150000000
\.


--
-- Name: donor_funded_programmes pk_donor_funded_programmes; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.donor_funded_programmes
    ADD CONSTRAINT pk_donor_funded_programmes PRIMARY KEY (geo_level, geo_code, geo_version, programme, donor);


--
-- PostgreSQL database dump complete
--

