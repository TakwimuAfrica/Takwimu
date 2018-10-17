--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.causes_of_death_over_five DROP CONSTRAINT IF EXISTS pk_causes_of_death_over_five;
DROP TABLE IF EXISTS public.causes_of_death_over_five;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: causes_of_death_over_five; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.causes_of_death_over_five (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    causes_of_death_over_five character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: causes_of_death_over_five; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.causes_of_death_over_five (geo_level, geo_code, geo_version, causes_of_death_over_five, total) FROM stdin;
level1	TZ_1_001	2009	diarrhoeal diseases	8
level1	TZ_1_001	2009	malaria	77
level1	TZ_1_001	2009	TB	97
level1	TZ_1_001	2009	anaemia	96
level1	TZ_1_001	2009	cardiac failure	123
level1	TZ_1_001	2009	hypertension	61
level1	TZ_1_001	2009	pneumonia	139
level1	TZ_1_001	2009	HIV/AIDS	345
level1	TZ_1_001	2009	Diabetes Mellitus	64
level1	TZ_1_001	2009	others	534
level1	TZ_1_003	2009	diarrhoeal diseases	21
level1	TZ_1_003	2009	malaria	138
level1	TZ_1_003	2009	TB	41
level1	TZ_1_003	2009	anaemia	50
level1	TZ_1_003	2009	cardiac failure	14
level1	TZ_1_003	2009	hypertension	32
level1	TZ_1_003	2009	pneumonia	51
level1	TZ_1_003	2009	HIV/AIDS	164
level1	TZ_1_003	2009	Diabetes Mellitus	5
level1	TZ_1_003	2009	others	80
level1	TZ_1_002	2009	diarrhoeal diseases	30
level1	TZ_1_002	2009	malaria	300
level1	TZ_1_002	2009	TB	271
level1	TZ_1_002	2009	anaemia	297
level1	TZ_1_002	2009	cardiac failure	178
level1	TZ_1_002	2009	hypertension	259
level1	TZ_1_002	2009	pneumonia	205
level1	TZ_1_002	2009	HIV/AIDS	437
level1	TZ_1_002	2009	Diabetes Mellitus	112
level1	TZ_1_002	2009	others	696
level1	TZ_1_004	2009	diarrhoeal diseases	5
level1	TZ_1_004	2009	malaria	205
level1	TZ_1_004	2009	TB	22
level1	TZ_1_004	2009	anaemia	63
level1	TZ_1_004	2009	cardiac failure	7
level1	TZ_1_004	2009	hypertension	10
level1	TZ_1_004	2009	pneumonia	5
level1	TZ_1_004	2009	HIV/AIDS	90
level1	TZ_1_004	2009	Diabetes Mellitus	3
level1	TZ_1_004	2009	others	47
level1	TZ_1_005	2009	diarrhoeal diseases	45
level1	TZ_1_005	2009	malaria	87
level1	TZ_1_005	2009	TB	13
level1	TZ_1_005	2009	anaemia	34
level1	TZ_1_005	2009	cardiac failure	95
level1	TZ_1_005	2009	hypertension	88
level1	TZ_1_005	2009	pneumonia	51
level1	TZ_1_005	2009	HIV/AIDS	38
level1	TZ_1_005	2009	Diabetes Mellitus	19
level1	TZ_1_005	2009	others	91
level1	TZ_1_006	2009	diarrhoeal diseases	24
level1	TZ_1_006	2009	malaria	184
level1	TZ_1_006	2009	TB	48
level1	TZ_1_006	2009	anaemia	53
level1	TZ_1_006	2009	cardiac failure	42
level1	TZ_1_006	2009	hypertension	56
level1	TZ_1_006	2009	pneumonia	54
level1	TZ_1_006	2009	HIV/AIDS	124
level1	TZ_1_006	2009	Diabetes Mellitus	21
level1	TZ_1_006	2009	others	264
level1	TZ_1_009	2009	diarrhoeal diseases	9
level1	TZ_1_009	2009	malaria	217
level1	TZ_1_009	2009	TB	29
level1	TZ_1_009	2009	anaemia	92
level1	TZ_1_009	2009	cardiac failure	47
level1	TZ_1_009	2009	hypertension	12
level1	TZ_1_009	2009	pneumonia	44
level1	TZ_1_009	2009	HIV/AIDS	61
level1	TZ_1_009	2009	Diabetes Mellitus	36
level1	TZ_1_009	2009	others	271
level1	TZ_1_010	2009	diarrhoeal diseases	23
level1	TZ_1_010	2009	malaria	54
level1	TZ_1_010	2009	TB	3
level1	TZ_1_010	2009	anaemia	33
level1	TZ_1_010	2009	cardiac failure	5
level1	TZ_1_010	2009	hypertension	10
level1	TZ_1_010	2009	pneumonia	21
level1	TZ_1_010	2009	HIV/AIDS	49
level1	TZ_1_010	2009	Diabetes Mellitus	2
level1	TZ_1_010	2009	others	94
level1	TZ_1_011	2009	diarrhoeal diseases	15
level1	TZ_1_011	2009	malaria	92
level1	TZ_1_011	2009	TB	39
level1	TZ_1_011	2009	anaemia	42
level1	TZ_1_011	2009	cardiac failure	85
level1	TZ_1_011	2009	hypertension	99
level1	TZ_1_011	2009	pneumonia	100
level1	TZ_1_011	2009	HIV/AIDS	63
level1	TZ_1_011	2009	Diabetes Mellitus	38
level1	TZ_1_011	2009	others	227
level1	TZ_1_014	2009	diarrhoeal diseases	10
level1	TZ_1_014	2009	malaria	169
level1	TZ_1_014	2009	TB	16
level1	TZ_1_014	2009	anaemia	19
level1	TZ_1_014	2009	cardiac failure	5
level1	TZ_1_014	2009	hypertension	38
level1	TZ_1_014	2009	pneumonia	22
level1	TZ_1_014	2009	HIV/AIDS	32
level1	TZ_1_014	2009	Diabetes Mellitus	6
level1	TZ_1_014	2009	others	41
level1	TZ_1_015	2009	diarrhoeal diseases	16
level1	TZ_1_015	2009	malaria	112
level1	TZ_1_015	2009	TB	92
level1	TZ_1_015	2009	anaemia	28
level1	TZ_1_015	2009	cardiac failure	63
level1	TZ_1_015	2009	hypertension	13
level1	TZ_1_015	2009	pneumonia	104
level1	TZ_1_015	2009	HIV/AIDS	60
level1	TZ_1_015	2009	Diabetes Mellitus	10
level1	TZ_1_015	2009	others	295
level1	TZ_1_016	2009	diarrhoeal diseases	36
level1	TZ_1_016	2009	malaria	648
level1	TZ_1_016	2009	TB	36
level1	TZ_1_016	2009	anaemia	86
level1	TZ_1_016	2009	cardiac failure	11
level1	TZ_1_016	2009	hypertension	5
level1	TZ_1_016	2009	pneumonia	17
level1	TZ_1_016	2009	HIV/AIDS	306
level1	TZ_1_016	2009	Diabetes Mellitus	16
level1	TZ_1_016	2009	others	584
level1	TZ_1_017	2009	diarrhoeal diseases	74
level1	TZ_1_017	2009	malaria	243
level1	TZ_1_017	2009	TB	100
level1	TZ_1_017	2009	anaemia	151
level1	TZ_1_017	2009	cardiac failure	61
level1	TZ_1_017	2009	hypertension	19
level1	TZ_1_017	2009	pneumonia	159
level1	TZ_1_017	2009	HIV/AIDS	212
level1	TZ_1_017	2009	Diabetes Mellitus	31
level1	TZ_1_017	2009	others	357
level1	TZ_1_018	2009	diarrhoeal diseases	24
level1	TZ_1_018	2009	malaria	283
level1	TZ_1_018	2009	TB	74
level1	TZ_1_018	2009	anaemia	66
level1	TZ_1_018	2009	cardiac failure	12
level1	TZ_1_018	2009	hypertension	20
level1	TZ_1_018	2009	pneumonia	49
level1	TZ_1_018	2009	HIV/AIDS	187
level1	TZ_1_018	2009	Diabetes Mellitus	19
level1	TZ_1_018	2009	others	150
level1	TZ_1_019	2009	diarrhoeal diseases	26
level1	TZ_1_019	2009	malaria	270
level1	TZ_1_019	2009	TB	33
level1	TZ_1_019	2009	anaemia	82
level1	TZ_1_019	2009	cardiac failure	40
level1	TZ_1_019	2009	hypertension	79
level1	TZ_1_019	2009	pneumonia	33
level1	TZ_1_019	2009	HIV/AIDS	61
level1	TZ_1_019	2009	Diabetes Mellitus	20
level1	TZ_1_019	2009	others	260
level1	TZ_1_020	2009	diarrhoeal diseases	19
level1	TZ_1_020	2009	malaria	105
level1	TZ_1_020	2009	TB	23
level1	TZ_1_020	2009	anaemia	36
level1	TZ_1_020	2009	cardiac failure	1
level1	TZ_1_020	2009	hypertension	14
level1	TZ_1_020	2009	pneumonia	17
level1	TZ_1_020	2009	HIV/AIDS	118
level1	TZ_1_020	2009	Diabetes Mellitus	7
level1	TZ_1_020	2009	others	143
level1	TZ_1_021	2009	diarrhoeal diseases	19
level1	TZ_1_021	2009	malaria	82
level1	TZ_1_021	2009	TB	11
level1	TZ_1_021	2009	anaemia	36
level1	TZ_1_021	2009	cardiac failure	15
level1	TZ_1_021	2009	hypertension	16
level1	TZ_1_021	2009	pneumonia	39
level1	TZ_1_021	2009	HIV/AIDS	1717
level1	TZ_1_021	2009	Diabetes Mellitus	3
level1	TZ_1_021	2009	others	147
level1	TZ_1_022	2009	diarrhoeal diseases	14
level1	TZ_1_022	2009	malaria	59
level1	TZ_1_022	2009	TB	36
level1	TZ_1_022	2009	anaemia	22
level1	TZ_1_022	2009	cardiac failure	19
level1	TZ_1_022	2009	hypertension	27
level1	TZ_1_022	2009	pneumonia	24
level1	TZ_1_022	2009	HIV/AIDS	42
level1	TZ_1_022	2009	Diabetes Mellitus	7
level1	TZ_1_022	2009	others	121
level1	TZ_1_023	2009	diarrhoeal diseases	13
level1	TZ_1_023	2009	malaria	169
level1	TZ_1_023	2009	TB	11
level1	TZ_1_023	2009	anaemia	57
level1	TZ_1_023	2009	cardiac failure	3
level1	TZ_1_023	2009	hypertension	8
level1	TZ_1_023	2009	pneumonia	37
level1	TZ_1_023	2009	HIV/AIDS	5
level1	TZ_1_023	2009	Diabetes Mellitus	1
level1	TZ_1_023	2009	others	104
level1	TZ_1_024	2009	diarrhoeal diseases	14
level1	TZ_1_024	2009	malaria	148
level1	TZ_1_024	2009	TB	18
level1	TZ_1_024	2009	anaemia	25
level1	TZ_1_024	2009	cardiac failure	47
level1	TZ_1_024	2009	hypertension	33
level1	TZ_1_024	2009	pneumonia	65
level1	TZ_1_024	2009	HIV/AIDS	76
level1	TZ_1_024	2009	Diabetes Mellitus	2
level1	TZ_1_024	2009	others	150
level1	TZ_1_025	2009	diarrhoeal diseases	11
level1	TZ_1_025	2009	malaria	302
level1	TZ_1_025	2009	TB	11
level1	TZ_1_025	2009	anaemia	114
level1	TZ_1_025	2009	cardiac failure	5
level1	TZ_1_025	2009	hypertension	12
level1	TZ_1_025	2009	pneumonia	14
level1	TZ_1_025	2009	HIV/AIDS	53
level1	TZ_1_025	2009	Diabetes Mellitus	4
level1	TZ_1_025	2009	others	97
level1	TZ_1_026	2009	diarrhoeal diseases	13
level1	TZ_1_026	2009	malaria	79
level1	TZ_1_026	2009	TB	64
level1	TZ_1_026	2009	anaemia	89
level1	TZ_1_026	2009	cardiac failure	31
level1	TZ_1_026	2009	hypertension	23
level1	TZ_1_026	2009	pneumonia	7
level1	TZ_1_026	2009	HIV/AIDS	75
level1	TZ_1_026	2009	Diabetes Mellitus	9
level1	TZ_1_026	2009	others	79
level1	TZ_1_027	2009	diarrhoeal diseases	46
level1	TZ_1_027	2009	malaria	468
level1	TZ_1_027	2009	TB	31
level1	TZ_1_027	2009	anaemia	56
level1	TZ_1_027	2009	cardiac failure	34
level1	TZ_1_027	2009	hypertension	23
level1	TZ_1_027	2009	pneumonia	38
level1	TZ_1_027	2009	HIV/AIDS	46
level1	TZ_1_027	2009	Diabetes Mellitus	10
level1	TZ_1_027	2009	others	501
level1	TZ_1_029	2009	diarrhoeal diseases	80
level1	TZ_1_029	2009	malaria	348
level1	TZ_1_029	2009	TB	37
level1	TZ_1_029	2009	anaemia	79
level1	TZ_1_029	2009	cardiac failure	29
level1	TZ_1_029	2009	hypertension	49
level1	TZ_1_029	2009	pneumonia	73
level1	TZ_1_029	2009	HIV/AIDS	236
level1	TZ_1_029	2009	Diabetes Mellitus	25
level1	TZ_1_029	2009	others	208
level1	TZ_1_028	2009	diarrhoeal diseases	29
level1	TZ_1_028	2009	malaria	163
level1	TZ_1_028	2009	TB	46
level1	TZ_1_028	2009	anaemia	75
level1	TZ_1_028	2009	cardiac failure	47
level1	TZ_1_028	2009	hypertension	61
level1	TZ_1_028	2009	pneumonia	55
level1	TZ_1_028	2009	HIV/AIDS	185
level1	TZ_1_028	2009	Diabetes Mellitus	65
level1	TZ_1_028	2009	others	287
level1	TZ_1_007	2009	diarrhoeal diseases	0
level1	TZ_1_007	2009	malaria	0
level1	TZ_1_007	2009	TB	0
level1	TZ_1_007	2009	anaemia	0
level1	TZ_1_007	2009	cardiac failure	0
level1	TZ_1_007	2009	hypertension	0
level1	TZ_1_007	2009	pneumonia	0
level1	TZ_1_007	2009	HIV/AIDS	0
level1	TZ_1_007	2009	Diabetes Mellitus	0
level1	TZ_1_007	2009	others	0
level1	TZ_1_008	2009	diarrhoeal diseases	0
level1	TZ_1_008	2009	malaria	0
level1	TZ_1_008	2009	TB	0
level1	TZ_1_008	2009	anaemia	0
level1	TZ_1_008	2009	cardiac failure	0
level1	TZ_1_008	2009	hypertension	0
level1	TZ_1_008	2009	pneumonia	0
level1	TZ_1_008	2009	HIV/AIDS	0
level1	TZ_1_008	2009	Diabetes Mellitus	0
level1	TZ_1_008	2009	others	0
level1	TZ_1_012	2009	diarrhoeal diseases	0
level1	TZ_1_012	2009	malaria	0
level1	TZ_1_012	2009	TB	0
level1	TZ_1_012	2009	anaemia	0
level1	TZ_1_012	2009	cardiac failure	0
level1	TZ_1_012	2009	hypertension	0
level1	TZ_1_012	2009	pneumonia	0
level1	TZ_1_012	2009	HIV/AIDS	0
level1	TZ_1_012	2009	Diabetes Mellitus	0
level1	TZ_1_012	2009	others	0
level1	TZ_1_013	2009	diarrhoeal diseases	0
level1	TZ_1_013	2009	malaria	0
level1	TZ_1_013	2009	TB	0
level1	TZ_1_013	2009	anaemia	0
level1	TZ_1_013	2009	cardiac failure	0
level1	TZ_1_013	2009	hypertension	0
level1	TZ_1_013	2009	pneumonia	0
level1	TZ_1_013	2009	HIV/AIDS	0
level1	TZ_1_013	2009	Diabetes Mellitus	0
level1	TZ_1_013	2009	others	0
level1	TZ_1_030	2009	diarrhoeal diseases	0
level1	TZ_1_030	2009	malaria	0
level1	TZ_1_030	2009	TB	0
level1	TZ_1_030	2009	anaemia	0
level1	TZ_1_030	2009	cardiac failure	0
level1	TZ_1_030	2009	hypertension	0
level1	TZ_1_030	2009	pneumonia	0
level1	TZ_1_030	2009	HIV/AIDS	0
level1	TZ_1_030	2009	Diabetes Mellitus	0
level1	TZ_1_030	2009	others	0
country	TZ	2009	diarrhoeal diseases	624
country	TZ	2009	malaria	5002
country	TZ	2009	TB	1202
country	TZ	2009	anaemia	1781
country	TZ	2009	cardiac failure	1019
country	TZ	2009	hypertension	1067
country	TZ	2009	pneumonia	1423
country	TZ	2009	HIV/AIDS	4782
country	TZ	2009	Diabetes Mellitus	535
country	TZ	2009	others	5828
\.


--
-- Name: causes_of_death_over_five pk_causes_of_death_over_five; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.causes_of_death_over_five
    ADD CONSTRAINT pk_causes_of_death_over_five PRIMARY KEY (geo_level, geo_code, geo_version, causes_of_death_over_five);


--
-- PostgreSQL database dump complete
--

