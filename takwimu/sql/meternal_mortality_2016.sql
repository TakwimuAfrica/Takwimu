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

ALTER TABLE IF EXISTS ONLY public.maternal_mortality_2016 DROP CONSTRAINT IF EXISTS pk_maternal_mortality_2016;
DROP TABLE IF EXISTS public.maternal_mortality_2016;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: maternal_mortality_2016; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.maternal_mortality_2016 (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    maternal_mortality_2016_year character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: maternal_mortality_2016; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.maternal_mortality_2016 (geo_level, geo_code, geo_version, maternal_mortality_2016_year, total) FROM stdin;
country	NG	2009	2016	567.5
level1	NG_1_001	2009	2016	375.9
level1	NG_1_002	2009	2016	1841.9
level1	NG_1_003	2009	2016	150.9
level1	NG_1_004	2009	2016	279
level1	NG_1_005	2009	2016	593.8
level1	NG_1_006	2009	2016	471.1
level1	NG_1_007	2009	2016	809.6
level1	NG_1_008	2009	2016	2374.8
level1	NG_1_009	2009	2016	642.3
level1	NG_1_010	2009	2016	394.1
level1	NG_1_011	2009	2016	218
level1	NG_1_012	2009	2016	641.4
level1	NG_1_013	2009	2016	876.8
level1	NG_1_014	2009	2016	519
level1	NG_1_015	2009	2016	83.6
level1	NG_1_016	2009	2016	371.3
level1	NG_1_017	2009	2016	642.9
level1	NG_1_018	2009	2016	298.8
level1	NG_1_019	2009	2016	452.6
level1	NG_1_020	2009	2016	364.3
level1	NG_1_021	2009	2016	214.2
level1	NG_1_022	2009	2016	506.1
level1	NG_1_023	2009	2016	1267.8
level1	NG_1_024	2009	2016	904.4
level1	NG_1_025	2009	2016	110.4
level1	NG_1_026	2009	2016	817
level1	NG_1_027	2009	2016	387
level1	NG_1_028	2009	2016	258.8
level1	NG_1_029	2009	2016	115.9
level1	NG_1_030	2009	2016	344.1
level1	NG_1_031	2009	2016	184
level1	NG_1_032	2009	2016	278.5
level1	NG_1_033	2009	2016	483.4
level1	NG_1_034	2009	2016	737.4
level1	NG_1_035	2009	2016	623.2
level1	NG_1_036	2009	2016	1678.9
level1	NG_1_037	2009	2016	259.8
\.


--
-- Name: maternal_mortality_2016 pk_maternal_mortality_2016; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.maternal_mortality_2016
    ADD CONSTRAINT pk_maternal_mortality_2016 PRIMARY KEY (geo_level, geo_code, geo_version, maternal_mortality_2016_year);


--
-- PostgreSQL database dump complete
--
