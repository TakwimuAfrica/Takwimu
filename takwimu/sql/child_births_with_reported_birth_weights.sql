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

ALTER TABLE IF EXISTS ONLY public.child_births_with_reported_birth_weights DROP CONSTRAINT IF EXISTS pk_child_births_with_reported_birth_weights;
DROP TABLE IF EXISTS public.child_births_with_reported_birth_weights;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: child_births_with_reported_birth_weights; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.child_births_with_reported_birth_weights (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    reported_birth_weights character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: child_births_with_reported_birth_weights; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.child_births_with_reported_birth_weights (geo_level, geo_code, geo_version, reported_birth_weights, total) FROM stdin;
level1	NG_1_001	2009	reported birth weight	57
level1	NG_1_002	2009	reported birth weight	15
level1	NG_1_003	2009	reported birth weight	18
level1	NG_1_004	2009	reported birth weight	67
level1	NG_1_005	2009	reported birth weight	2
level1	NG_1_006	2009	reported birth weight	12
level1	NG_1_007	2009	reported birth weight	6
level1	NG_1_008	2009	reported birth weight	5
level1	NG_1_009	2009	reported birth weight	13
level1	NG_1_010	2009	reported birth weight	34
level1	NG_1_011	2009	reported birth weight	17
level1	NG_1_012	2009	reported birth weight	47
level1	NG_1_013	2009	reported birth weight	41
level1	NG_1_014	2009	reported birth weight	47
level1	NG_1_015	2009	reported birth weight	43
level1	NG_1_016	2009	reported birth weight	4
level1	NG_1_017	2009	reported birth weight	55
level1	NG_1_018	2009	reported birth weight	1
level1	NG_1_019	2009	reported birth weight	22
level1	NG_1_020	2009	reported birth weight	3
level1	NG_1_021	2009	reported birth weight	1
level1	NG_1_022	2009	reported birth weight	1
level1	NG_1_023	2009	reported birth weight	30
level1	NG_1_024	2009	reported birth weight	26
level1	NG_1_025	2009	reported birth weight	54
level1	NG_1_026	2009	reported birth weight	5
level1	NG_1_027	2009	reported birth weight	7
level1	NG_1_028	2009	reported birth weight	34
level1	NG_1_029	2009	reported birth weight	12
level1	NG_1_030	2009	reported birth weight	75
level1	NG_1_031	2009	reported birth weight	30
level1	NG_1_032	2009	reported birth weight	9
level1	NG_1_033	2009	reported birth weight	32
level1	NG_1_034	2009	reported birth weight	2
level1	NG_1_035	2009	reported birth weight	10
level1	NG_1_036	2009	reported birth weight	1
level1	NG_1_037	2009	reported birth weight	0
country	NG	2009	reported birth weight	16
\.


--
-- Name: child_births_with_reported_birth_weights pk_child_births_with_reported_birth_weights; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.child_births_with_reported_birth_weights
    ADD CONSTRAINT pk_child_births_with_reported_birth_weights PRIMARY KEY (geo_level, geo_code, geo_version, reported_birth_weights);


--
-- PostgreSQL database dump complete
--

