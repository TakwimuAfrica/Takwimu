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

ALTER TABLE IF EXISTS ONLY public.size_of_households DROP CONSTRAINT IF EXISTS pk_size_of_households;
DROP TABLE IF EXISTS public.size_of_households;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: size_of_households; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.size_of_households (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    location character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: size_of_households; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.size_of_households (geo_level, geo_code, geo_version, location, total) FROM stdin;
level1	SN_1_001	2009	Urban	10
level1	SN_1_001	2009	Rural	8
country	SN	2009	Urban	10
country	SN	2009	Rural	8
level1	SN_1_002	2009	Urban	11
level1	SN_1_002	2009	Rural	10
level1	SN_1_003	2009	Urban	9
level1	SN_1_003	2009	Rural	8
level1	SN_1_005	2009	Urban	11
level1	SN_1_005	2009	Rural	9
level1	SN_1_007	2009	Urban	11
level1	SN_1_007	2009	Rural	8
level1	SN_1_008	2009	Urban	8
level1	SN_1_008	2009	Rural	7
level1	SN_1_009	2009	Urban	11
level1	SN_1_009	2009	Rural	9
level1	SN_1_010	2009	Urban	9
level1	SN_1_010	2009	Rural	8
level1	SN_1_012	2009	Urban	10
level1	SN_1_012	2009	Rural	8
level1	SN_1_013	2009	Urban	10
level1	SN_1_013	2009	Rural	9
level1	SN_1_014	2009	Urban	8
level1	SN_1_014	2009	Rural	8
\.


--
-- Name: size_of_households pk_size_of_households; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.size_of_households
    ADD CONSTRAINT pk_size_of_households PRIMARY KEY (geo_level, geo_code, geo_version, location);


--
-- PostgreSQL database dump complete
--

