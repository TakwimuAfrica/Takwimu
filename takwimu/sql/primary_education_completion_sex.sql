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

ALTER TABLE IF EXISTS ONLY public.primary_education_completion_sex DROP CONSTRAINT IF EXISTS pk_primary_education_completion_sex;
DROP TABLE IF EXISTS public.primary_education_completion_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: primary_education_completion_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.primary_education_completion_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    primary_education_completion_sex character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: primary_education_completion_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.primary_education_completion_sex (geo_level, geo_code, geo_version, primary_education_completion_sex, total) FROM stdin;
country	NG	2009	Female	65.91
country	NG	2009	Male	67.55
level1	NG_1_001	2009	Female	29.21
level1	NG_1_001	2009	Male	28.75
level1	NG_1_002	2009	Female	63.61
level1	NG_1_002	2009	Male	67.33
level1	NG_1_003	2009	Female	95.74
level1	NG_1_003	2009	Male	89.28
level1	NG_1_004	2009	Female	110.14
level1	NG_1_004	2009	Male	100.76
level1	NG_1_005	2009	Female	63.94
level1	NG_1_005	2009	Male	75.1
level1	NG_1_006	2009	Female	22.48
level1	NG_1_006	2009	Male	23.29
level1	NG_1_007	2009	Female	31.13
level1	NG_1_007	2009	Male	38.32
level1	NG_1_008	2009	Female	47.38
level1	NG_1_008	2009	Male	54.15
level1	NG_1_009	2009	Female	23.11
level1	NG_1_009	2009	Male	24.63
level1	NG_1_010	2009	Female	39.48
level1	NG_1_010	2009	Male	43.13
level1	NG_1_011	2009	Female	70.93
level1	NG_1_011	2009	Male	72.13
level1	NG_1_012	2009	Female	45.01
level1	NG_1_012	2009	Male	45.58
level1	NG_1_013	2009	Female	21.55
level1	NG_1_013	2009	Male	28.52
level1	NG_1_014	2009	Female	40.89
level1	NG_1_014	2009	Male	44.56
level1	NG_1_015	2009	Female	91.84
level1	NG_1_015	2009	Male	89.22
level1	NG_1_016	2009	Female	64.67
level1	NG_1_016	2009	Male	70.2
level1	NG_1_017	2009	Female	116.3
level1	NG_1_017	2009	Male	124.36
level1	NG_1_018	2009	Female	55.2
level1	NG_1_018	2009	Male	71.11
level1	NG_1_019	2009	Female	58.11
level1	NG_1_019	2009	Male	67.07
level1	NG_1_020	2009	Female	98.58
level1	NG_1_020	2009	Male	90.28
level1	NG_1_021	2009	Female	92.15
level1	NG_1_021	2009	Male	116.67
level1	NG_1_022	2009	Female	39.87
level1	NG_1_022	2009	Male	65.22
level1	NG_1_023	2009	Female	61.66
level1	NG_1_023	2009	Male	63.02
level1	NG_1_024	2009	Female	36.24
level1	NG_1_024	2009	Male	40.38
level1	NG_1_025	2009	Female	54.87
level1	NG_1_025	2009	Male	50.14
level1	NG_1_026	2009	Female	141.88
level1	NG_1_026	2009	Male	173.07
level1	NG_1_027	2009	Female	50.11
level1	NG_1_027	2009	Male	62.76
level1	NG_1_028	2009	Female	123.16
level1	NG_1_028	2009	Male	131.51
level1	NG_1_029	2009	Female	102.04
level1	NG_1_029	2009	Male	105.15
level1	NG_1_030	2009	Female	36.58
level1	NG_1_030	2009	Male	35.82
level1	NG_1_031	2009	Female	137.6
level1	NG_1_031	2009	Male	128.39
level1	NG_1_032	2009	Female	57
level1	NG_1_032	2009	Male	61.14
level1	NG_1_033	2009	Female	17.41
level1	NG_1_033	2009	Male	17.95
level1	NG_1_034	2009	Female	34.75
level1	NG_1_034	2009	Male	55.79
level1	NG_1_035	2009	Female	70.62
level1	NG_1_035	2009	Male	84.48
level1	NG_1_036	2009	Female	96.27
level1	NG_1_036	2009	Male	125.36
level1	NG_1_037	2009	Female	33.77
level1	NG_1_037	2009	Male	58.92
\.


--
-- Name: primary_education_completion_sex pk_primary_education_completion_sex; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.primary_education_completion_sex
    ADD CONSTRAINT pk_primary_education_completion_sex PRIMARY KEY (geo_level, geo_code, geo_version, primary_education_completion_sex);


--
-- PostgreSQL database dump complete
--
