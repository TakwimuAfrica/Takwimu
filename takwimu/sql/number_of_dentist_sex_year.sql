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

ALTER TABLE IF EXISTS ONLY public.number_of_dentist_year_sex DROP CONSTRAINT IF EXISTS pk_number_of_dentist_year_sex;
DROP TABLE IF EXISTS public.number_of_dentist_year_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: number_of_dentist_year_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.number_of_dentist_year_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    number_of_dentist_sex character varying(10) NOT NULL,
    number_of_dentist_year character varying(10) NOT NULL,
    total integer
);


--
-- Data for Name: number_of_dentist_year_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.number_of_dentist_year_sex (geo_level, geo_code, geo_version, number_of_dentist_sex, number_of_dentist_year, total) FROM stdin;
country	NG	2009	Female	2015	704
country	NG	2009	Male	2015	1686
country	NG	2009	Female	2016	1261
country	NG	2009	Male	2016	1602
country	NG	2009	Female	2017	1287
country	NG	2009	Male	2017	1614
level1	NG_1_001	2009	Female	2015	21
level1	NG_1_001	2009	Male	2015	0
level1	NG_1_001	2009	Female	2016	9
level1	NG_1_001	2009	Male	2016	19
level1	NG_1_001	2009	Female	2017	10
level1	NG_1_001	2009	Male	2017	19
level1	NG_1_002	2009	Female	2015	0
level1	NG_1_002	2009	Male	2015	19
level1	NG_1_002	2009	Female	2016	0
level1	NG_1_002	2009	Male	2016	3
level1	NG_1_002	2009	Female	2017	1
level1	NG_1_002	2009	Male	2017	3
level1	NG_1_003	2009	Female	2015	4
level1	NG_1_003	2009	Male	2015	22
level1	NG_1_003	2009	Female	2016	6
level1	NG_1_003	2009	Male	2016	12
level1	NG_1_003	2009	Female	2017	6
level1	NG_1_003	2009	Male	2017	12
level1	NG_1_004	2009	Female	2015	7
level1	NG_1_004	2009	Male	2015	15
level1	NG_1_004	2009	Female	2016	5
level1	NG_1_004	2009	Male	2016	8
level1	NG_1_004	2009	Female	2017	5
level1	NG_1_004	2009	Male	2017	8
level1	NG_1_005	2009	Female	2015	0
level1	NG_1_005	2009	Male	2015	45
level1	NG_1_005	2009	Female	2016	2
level1	NG_1_005	2009	Male	2016	6
level1	NG_1_005	2009	Female	2017	2
level1	NG_1_005	2009	Male	2017	6
level1	NG_1_006	2009	Female	2015	0
level1	NG_1_006	2009	Male	2015	10
level1	NG_1_006	2009	Female	2016	2
level1	NG_1_006	2009	Male	2016	9
level1	NG_1_006	2009	Female	2017	2
level1	NG_1_006	2009	Male	2017	9
level1	NG_1_007	2009	Female	2015	0
level1	NG_1_007	2009	Male	2015	21
level1	NG_1_007	2009	Female	2016	5
level1	NG_1_007	2009	Male	2016	17
level1	NG_1_007	2009	Female	2017	5
level1	NG_1_007	2009	Male	2017	17
level1	NG_1_008	2009	Female	2015	0
level1	NG_1_008	2009	Male	2015	29
level1	NG_1_008	2009	Female	2016	14
level1	NG_1_008	2009	Male	2016	46
level1	NG_1_008	2009	Female	2017	15
level1	NG_1_008	2009	Male	2017	46
level1	NG_1_009	2009	Female	2015	4
level1	NG_1_009	2009	Male	2015	10
level1	NG_1_009	2009	Female	2016	3
level1	NG_1_009	2009	Male	2016	8
level1	NG_1_009	2009	Female	2017	3
level1	NG_1_009	2009	Male	2017	8
level1	NG_1_010	2009	Female	2015	48
level1	NG_1_010	2009	Male	2015	60
level1	NG_1_010	2009	Female	2016	19
level1	NG_1_010	2009	Male	2016	45
level1	NG_1_010	2009	Female	2017	20
level1	NG_1_010	2009	Male	2017	45
level1	NG_1_011	2009	Female	2015	0
level1	NG_1_011	2009	Male	2015	21
level1	NG_1_011	2009	Female	2016	0
level1	NG_1_011	2009	Male	2016	9
level1	NG_1_011	2009	Female	2017	0
level1	NG_1_011	2009	Male	2017	9
level1	NG_1_012	2009	Female	2015	86
level1	NG_1_012	2009	Male	2015	134
level1	NG_1_012	2009	Female	2016	70
level1	NG_1_012	2009	Male	2016	204
level1	NG_1_012	2009	Female	2017	74
level1	NG_1_012	2009	Male	2017	204
level1	NG_1_013	2009	Female	2015	9
level1	NG_1_013	2009	Male	2015	36
level1	NG_1_013	2009	Female	2016	28
level1	NG_1_013	2009	Male	2016	105
level1	NG_1_013	2009	Female	2017	30
level1	NG_1_013	2009	Male	2017	105
level1	NG_1_014	2009	Female	2015	29
level1	NG_1_014	2009	Male	2015	7
level1	NG_1_014	2009	Female	2016	9
level1	NG_1_014	2009	Male	2016	36
level1	NG_1_014	2009	Female	2017	9
level1	NG_1_014	2009	Male	2017	37
level1	NG_1_015	2009	Female	2015	3
level1	NG_1_015	2009	Male	2015	19
level1	NG_1_015	2009	Female	2016	65
level1	NG_1_015	2009	Male	2016	116
level1	NG_1_015	2009	Female	2017	67
level1	NG_1_015	2009	Male	2017	117
level1	NG_1_016	2009	Female	2015	38
level1	NG_1_016	2009	Male	2015	60
level1	NG_1_016	2009	Female	2016	0
level1	NG_1_016	2009	Male	2016	6
level1	NG_1_016	2009	Female	2017	0
level1	NG_1_016	2009	Male	2017	6
level1	NG_1_017	2009	Female	2015	4
level1	NG_1_017	2009	Male	2015	9
level1	NG_1_017	2009	Female	2016	3
level1	NG_1_017	2009	Male	2016	8
level1	NG_1_017	2009	Female	2017	3
level1	NG_1_017	2009	Male	2017	8
level1	NG_1_018	2009	Female	2015	1
level1	NG_1_018	2009	Male	2015	15
level1	NG_1_018	2009	Female	2016	0
level1	NG_1_018	2009	Male	2016	11
level1	NG_1_018	2009	Female	2017	0
level1	NG_1_018	2009	Male	2017	11
level1	NG_1_019	2009	Female	2015	0
level1	NG_1_019	2009	Male	2015	51
level1	NG_1_019	2009	Female	2016	175
level1	NG_1_019	2009	Male	2016	46
level1	NG_1_019	2009	Female	2017	176
level1	NG_1_019	2009	Male	2017	48
level1	NG_1_020	2009	Female	2015	0
level1	NG_1_020	2009	Male	2015	48
level1	NG_1_020	2009	Female	2016	2
level1	NG_1_020	2009	Male	2016	28
level1	NG_1_020	2009	Female	2017	4
level1	NG_1_020	2009	Male	2017	28
level1	NG_1_021	2009	Female	2015	4
level1	NG_1_021	2009	Male	2015	19
level1	NG_1_021	2009	Female	2016	2
level1	NG_1_021	2009	Male	2016	8
level1	NG_1_021	2009	Female	2017	2
level1	NG_1_021	2009	Male	2017	8
level1	NG_1_022	2009	Female	2015	0
level1	NG_1_022	2009	Male	2015	10
level1	NG_1_022	2009	Female	2016	0
level1	NG_1_022	2009	Male	2016	3
level1	NG_1_022	2009	Female	2017	0
level1	NG_1_022	2009	Male	2017	3
level1	NG_1_023	2009	Female	2015	0
level1	NG_1_023	2009	Male	2015	15
level1	NG_1_023	2009	Female	2016	3
level1	NG_1_023	2009	Male	2016	15
level1	NG_1_023	2009	Female	2017	3
level1	NG_1_023	2009	Male	2017	15
level1	NG_1_024	2009	Female	2015	0
level1	NG_1_024	2009	Male	2015	22
level1	NG_1_024	2009	Female	2016	2
level1	NG_1_024	2009	Male	2016	11
level1	NG_1_024	2009	Female	2017	2
level1	NG_1_024	2009	Male	2017	11
level1	NG_1_025	2009	Female	2015	229
level1	NG_1_025	2009	Male	2015	452
level1	NG_1_025	2009	Female	2016	412
level1	NG_1_025	2009	Male	2016	340
level1	NG_1_025	2009	Female	2017	417
level1	NG_1_025	2009	Male	2017	345
level1	NG_1_026	2009	Female	2015	4
level1	NG_1_026	2009	Male	2015	15
level1	NG_1_026	2009	Female	2016	2
level1	NG_1_026	2009	Male	2016	8
level1	NG_1_026	2009	Female	2017	2
level1	NG_1_026	2009	Male	2017	8
level1	NG_1_027	2009	Female	2015	0
level1	NG_1_027	2009	Male	2015	22
level1	NG_1_027	2009	Female	2016	2
level1	NG_1_027	2009	Male	2016	25
level1	NG_1_027	2009	Female	2017	2
level1	NG_1_027	2009	Male	2017	25
level1	NG_1_028	2009	Female	2015	15
level1	NG_1_028	2009	Male	2015	38
level1	NG_1_028	2009	Female	2016	15
level1	NG_1_028	2009	Male	2016	17
level1	NG_1_028	2009	Female	2017	16
level1	NG_1_028	2009	Male	2017	17
level1	NG_1_029	2009	Female	2015	15
level1	NG_1_029	2009	Male	2015	38
level1	NG_1_029	2009	Female	2016	6
level1	NG_1_029	2009	Male	2016	31
level1	NG_1_029	2009	Female	2017	6
level1	NG_1_029	2009	Male	2017	31
level1	NG_1_030	2009	Female	2015	24
level1	NG_1_030	2009	Male	2015	51
level1	NG_1_030	2009	Female	2016	45
level1	NG_1_030	2009	Male	2016	99
level1	NG_1_030	2009	Female	2017	46
level1	NG_1_030	2009	Male	2017	100
level1	NG_1_031	2009	Female	2015	43
level1	NG_1_031	2009	Male	2015	132
level1	NG_1_031	2009	Female	2016	302
level1	NG_1_031	2009	Male	2016	152
level1	NG_1_031	2009	Female	2017	305
level1	NG_1_031	2009	Male	2017	155
level1	NG_1_032	2009	Female	2015	84
level1	NG_1_032	2009	Male	2015	122
level1	NG_1_032	2009	Female	2016	6
level1	NG_1_032	2009	Male	2016	19
level1	NG_1_032	2009	Female	2017	6
level1	NG_1_032	2009	Male	2017	19
level1	NG_1_033	2009	Female	2015	17
level1	NG_1_033	2009	Male	2015	19
level1	NG_1_033	2009	Female	2016	40
level1	NG_1_033	2009	Male	2016	101
level1	NG_1_033	2009	Female	2017	41
level1	NG_1_033	2009	Male	2017	101
level1	NG_1_034	2009	Female	2015	3
level1	NG_1_034	2009	Male	2015	69
level1	NG_1_034	2009	Female	2016	0
level1	NG_1_034	2009	Male	2016	11
level1	NG_1_034	2009	Female	2017	0
level1	NG_1_034	2009	Male	2017	11
level1	NG_1_035	2009	Female	2015	2
level1	NG_1_035	2009	Male	2015	14
level1	NG_1_035	2009	Female	2016	0
level1	NG_1_035	2009	Male	2016	3
level1	NG_1_035	2009	Female	2017	0
level1	NG_1_035	2009	Male	2017	3
level1	NG_1_036	2009	Female	2015	3
level1	NG_1_036	2009	Male	2015	5
level1	NG_1_036	2009	Female	2016	0
level1	NG_1_036	2009	Male	2016	5
level1	NG_1_036	2009	Female	2017	0
level1	NG_1_036	2009	Male	2017	5
level1	NG_1_037	2009	Female	2015	1
level1	NG_1_037	2009	Male	2015	2
level1	NG_1_037	2009	Female	2016	2
level1	NG_1_037	2009	Male	2016	5
level1	NG_1_037	2009	Female	2017	2
level1	NG_1_037	2009	Male	2017	4
\.


--
-- Name: number_of_dentist_year_sex pk_number_of_dentist_year_sex; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.number_of_dentist_year_sex
    ADD CONSTRAINT pk_number_of_dentist_year_sex PRIMARY KEY (geo_level, geo_code, geo_version, number_of_dentist_sex, number_of_dentist_year);


--
-- PostgreSQL database dump complete
--
