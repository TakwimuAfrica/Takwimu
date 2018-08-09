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

ALTER TABLE IF EXISTS ONLY public.number_of_households DROP CONSTRAINT IF EXISTS pk_number_of_households;
DROP TABLE IF EXISTS public.number_of_households;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: number_of_households; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.number_of_households (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    location character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: number_of_households; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.number_of_households (geo_level, geo_code, geo_version, location, total) FROM stdin;
level1	SN_1_001	2009	Urban	321110
level1	SN_1_001	2009	Rural	6959
level1	SN_1_002	2009	Urban	20190
level1	SN_1_002	2009	Rural	100730
level1	SN_1_003	2009	Urban	12149
level1	SN_1_003	2009	Rural	69304
level1	SN_1_005	2009	Urban	27455
level1	SN_1_005	2009	Rural	49511
level1	SN_1_007	2009	Urban	16781
level1	SN_1_007	2009	Rural	42339
level1	SN_1_008	2009	Urban	21325
level1	SN_1_008	2009	Rural	82508
level1	SN_1_009	2009	Urban	10662
level1	SN_1_009	2009	Rural	39397
level1	SN_1_010	2009	Urban	51144
level1	SN_1_010	2009	Rural	55807
level1	SN_1_012	2009	Urban	16860
level1	SN_1_012	2009	Rural	52260
level1	SN_1_013	2009	Urban	82425
level1	SN_1_013	2009	Rural	95665
level1	SN_1_014	2009	Rural	41251
level1	SN_1_014	2009	Urban 46546
country	SN	2009	Urban	626647
country	SN	2009	Rural	635731
\.


--
-- Name: number_of_households pk_number_of_households; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.number_of_households
    ADD CONSTRAINT pk_number_of_households PRIMARY KEY (geo_level, geo_code, geo_version, location);


--
-- PostgreSQL database dump complete
--

