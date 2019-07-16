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

ALTER TABLE IF EXISTS ONLY public.prevalence_fgm DROP CONSTRAINT IF EXISTS pk_prevalence_fgm;
DROP TABLE IF EXISTS public.prevalence_fgm;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: prevalence_fgm; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prevalence_fgm (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    prevalence_fgm character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: prevalence_fgm; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prevalence_fgm (geo_level, geo_code, geo_version, prevalence_fgm, total) FROM stdin;
country	NG	2009	2016-2017	21.46
level1	NG_1_001	2009	2016-2017	31.1
level1	NG_1_002	2009	2016-2017	0
level1	NG_1_003	2009	2016-2017	10.5
level1	NG_1_004	2009	2016-2017	17.1
level1	NG_1_005	2009	2016-2017	0
level1	NG_1_006	2009	2016-2017	28
level1	NG_1_007	2009	2016-2017	4.1
level1	NG_1_008	2009	2016-2017	4.2
level1	NG_1_009	2009	2016-2017	25.4
level1	NG_1_010	2009	2016-2017	36.4
level1	NG_1_011	2009	2016-2017	43.2
level1	NG_1_012	2009	2016-2017	37.1
level1	NG_1_013	2009	2016-2017	62.6
level1	NG_1_014	2009	2016-2017	20.3
level1	NG_1_015	2009	2016-2017	7.2
level1	NG_1_016	2009	2016-2017	0
level1	NG_1_017	2009	2016-2017	51.6
level1	NG_1_018	2009	2016-2017	14.4
level1	NG_1_019	2009	2016-2017	39.3
level1	NG_1_020	2009	2016-2017	30.9
level1	NG_1_021	2009	2016-2017	0.6
level1	NG_1_022	2009	2016-2017	0.1
level1	NG_1_023	2009	2016-2017	1.4
level1	NG_1_024	2009	2016-2017	55.1
level1	NG_1_025	2009	2016-2017	25
level1	NG_1_026	2009	2016-2017	14.5
level1	NG_1_027	2009	2016-2017	0.6
level1	NG_1_028	2009	2016-2017	18.8
level1	NG_1_029	2009	2016-2017	44.2
level1	NG_1_030	2009	2016-2017	67.8
level1	NG_1_031	2009	2016-2017	55
level1	NG_1_032	2009	2016-2017	4.5
level1	NG_1_033	2009	2016-2017	15.1
level1	NG_1_034	2009	2016-2017	0.5
level1	NG_1_035	2009	2016-2017	1
level1	NG_1_036	2009	2016-2017	0
level1	NG_1_037	2009	2016-2017	26.4
\.


--
-- Name: prevalence_fgm pk_prevalence_fgm; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prevalence_fgm
    ADD CONSTRAINT pk_prevalence_fgm PRIMARY KEY (geo_level, geo_code, geo_version, prevalence_fgm);


--
-- PostgreSQL database dump complete
--
