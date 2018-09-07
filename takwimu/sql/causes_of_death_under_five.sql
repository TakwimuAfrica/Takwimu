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

ALTER TABLE IF EXISTS ONLY public.causes_of_death_under_five DROP CONSTRAINT IF EXISTS pk_causes_of_death_under_five;
DROP TABLE IF EXISTS public.causes_of_death_under_five;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: causes_of_death_under_five; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.causes_of_death_under_five (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    causes_of_death_under_five character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: causes_of_death_under_five; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.causes_of_death_under_five (geo_level, geo_code, geo_version, causes_of_death_under_five, total) FROM stdin;
level1	TZ_1_001	2009	acute respiratory infections	1
level1	TZ_1_001	2009	diarrhoeal diseases	43
level1	TZ_1_001	2009	malaria	39
level1	TZ_1_001	2009	nutritional disorders	21
level1	TZ_1_001	2009	anaemia	19
level1	TZ_1_001	2009	pneumonia	237
level1	TZ_1_001	2009	pre-natal conditions	17
level1	TZ_1_001	2009	HIV/AIDS	21
level1	TZ_1_001	2009	others	84
level1	TZ_1_003	2009	acute respiratory infections	52
level1	TZ_1_003	2009	diarrhoeal diseases	34
level1	TZ_1_003	2009	malaria	56
level1	TZ_1_003	2009	nutritional disorders	22
level1	TZ_1_003	2009	anaemia	27
level1	TZ_1_003	2009	pneumonia	105
level1	TZ_1_003	2009	pre-natal conditions	64
level1	TZ_1_003	2009	HIV/AIDS	27
level1	TZ_1_003	2009	others	118
level1	TZ_1_002	2009	acute respiratory infections	0
level1	TZ_1_002	2009	diarrhoeal diseases	31
level1	TZ_1_002	2009	malaria	234
level1	TZ_1_002	2009	nutritional disorders	6
level1	TZ_1_002	2009	anaemia	180
level1	TZ_1_002	2009	pneumonia	223
level1	TZ_1_002	2009	pre-natal conditions	517
level1	TZ_1_002	2009	HIV/AIDS	10
level1	TZ_1_002	2009	others	106
level1	TZ_1_004	2009	acute respiratory infections	18
level1	TZ_1_004	2009	diarrhoeal diseases	42
level1	TZ_1_004	2009	malaria	260
level1	TZ_1_004	2009	nutritional disorders	4
level1	TZ_1_004	2009	anaemia	157
level1	TZ_1_004	2009	pneumonia	45
level1	TZ_1_004	2009	pre-natal conditions	15
level1	TZ_1_004	2009	HIV/AIDS	16
level1	TZ_1_004	2009	others	21
level1	TZ_1_005	2009	acute respiratory infections	4
level1	TZ_1_005	2009	diarrhoeal diseases	15
level1	TZ_1_005	2009	malaria	34
level1	TZ_1_005	2009	nutritional disorders	7
level1	TZ_1_005	2009	anaemia	9
level1	TZ_1_005	2009	pneumonia	80
level1	TZ_1_005	2009	pre-natal conditions	3
level1	TZ_1_005	2009	HIV/AIDS	5
level1	TZ_1_005	2009	others	21
level1	TZ_1_006	2009	acute respiratory infections	6
level1	TZ_1_006	2009	diarrhoeal diseases	26
level1	TZ_1_006	2009	malaria	438
level1	TZ_1_006	2009	nutritional disorders	58
level1	TZ_1_006	2009	anaemia	176
level1	TZ_1_006	2009	pneumonia	169
level1	TZ_1_006	2009	pre-natal conditions	23
level1	TZ_1_006	2009	HIV/AIDS	7
level1	TZ_1_006	2009	others	43
level1	TZ_1_009	2009	acute respiratory infections	9
level1	TZ_1_009	2009	diarrhoeal diseases	52
level1	TZ_1_009	2009	malaria	161
level1	TZ_1_009	2009	nutritional disorders	11
level1	TZ_1_009	2009	anaemia	110
level1	TZ_1_009	2009	pneumonia	55
level1	TZ_1_009	2009	pre-natal conditions	18
level1	TZ_1_009	2009	HIV/AIDS	4
level1	TZ_1_009	2009	others	76
level1	TZ_1_010	2009	acute respiratory infections	23
level1	TZ_1_010	2009	diarrhoeal diseases	8
level1	TZ_1_010	2009	malaria	338
level1	TZ_1_010	2009	nutritional disorders	17
level1	TZ_1_010	2009	anaemia	128
level1	TZ_1_010	2009	pneumonia	136
level1	TZ_1_010	2009	pre-natal conditions	60
level1	TZ_1_010	2009	HIV/AIDS	2
level1	TZ_1_010	2009	others	163
level1	TZ_1_011	2009	acute respiratory infections	31
level1	TZ_1_011	2009	diarrhoeal diseases	14
level1	TZ_1_011	2009	malaria	66
level1	TZ_1_011	2009	nutritional disorders	14
level1	TZ_1_011	2009	anaemia	8
level1	TZ_1_011	2009	pneumonia	50
level1	TZ_1_011	2009	pre-natal conditions	3
level1	TZ_1_011	2009	HIV/AIDS	13
level1	TZ_1_011	2009	others	50
level1	TZ_1_014	2009	acute respiratory infections	1
level1	TZ_1_014	2009	diarrhoeal diseases	27
level1	TZ_1_014	2009	malaria	143
level1	TZ_1_014	2009	nutritional disorders	0
level1	TZ_1_014	2009	anaemia	14
level1	TZ_1_014	2009	pneumonia	20
level1	TZ_1_014	2009	pre-natal conditions	0
level1	TZ_1_014	2009	HIV/AIDS	1
level1	TZ_1_014	2009	others	5
level1	TZ_1_015	2009	acute respiratory infections	1
level1	TZ_1_015	2009	diarrhoeal diseases	11
level1	TZ_1_015	2009	malaria	62
level1	TZ_1_015	2009	nutritional disorders	16
level1	TZ_1_015	2009	anaemia	24
level1	TZ_1_015	2009	pneumonia	58
level1	TZ_1_015	2009	pre-natal conditions	4
level1	TZ_1_015	2009	HIV/AIDS	5
level1	TZ_1_015	2009	others	153
level1	TZ_1_016	2009	acute respiratory infections	69
level1	TZ_1_016	2009	diarrhoeal diseases	66
level1	TZ_1_016	2009	malaria	551
level1	TZ_1_016	2009	nutritional disorders	20
level1	TZ_1_016	2009	anaemia	287
level1	TZ_1_016	2009	pneumonia	100
level1	TZ_1_016	2009	pre-natal conditions	0
level1	TZ_1_016	2009	HIV/AIDS	0
level1	TZ_1_016	2009	others	78
level1	TZ_1_017	2009	acute respiratory infections	14
level1	TZ_1_017	2009	diarrhoeal diseases	104
level1	TZ_1_017	2009	malaria	76
level1	TZ_1_017	2009	nutritional disorders	46
level1	TZ_1_017	2009	anaemia	36
level1	TZ_1_017	2009	pneumonia	170
level1	TZ_1_017	2009	pre-natal conditions	33
level1	TZ_1_017	2009	HIV/AIDS	5
level1	TZ_1_017	2009	others	340
level1	TZ_1_018	2009	acute respiratory infections	11
level1	TZ_1_018	2009	diarrhoeal diseases	21
level1	TZ_1_018	2009	malaria	288
level1	TZ_1_018	2009	nutritional disorders	12
level1	TZ_1_018	2009	anaemia	79
level1	TZ_1_018	2009	pneumonia	142
level1	TZ_1_018	2009	pre-natal conditions	47
level1	TZ_1_018	2009	HIV/AIDS	82
level1	TZ_1_018	2009	others	329
level1	TZ_1_019	2009	acute respiratory infections	13
level1	TZ_1_019	2009	diarrhoeal diseases	14
level1	TZ_1_019	2009	malaria	172
level1	TZ_1_019	2009	nutritional disorders	0
level1	TZ_1_019	2009	anaemia	64
level1	TZ_1_019	2009	pneumonia	46
level1	TZ_1_019	2009	pre-natal conditions	79
level1	TZ_1_019	2009	HIV/AIDS	1
level1	TZ_1_019	2009	others	40
level1	TZ_1_020	2009	acute respiratory infections	2
level1	TZ_1_020	2009	diarrhoeal diseases	19
level1	TZ_1_020	2009	malaria	349
level1	TZ_1_020	2009	nutritional disorders	18
level1	TZ_1_020	2009	anaemia	135
level1	TZ_1_020	2009	pneumonia	74
level1	TZ_1_020	2009	pre-natal conditions	4
level1	TZ_1_020	2009	HIV/AIDS	21
level1	TZ_1_020	2009	others	18
level1	TZ_1_021	2009	acute respiratory infections	13
level1	TZ_1_021	2009	diarrhoeal diseases	9
level1	TZ_1_021	2009	malaria	43
level1	TZ_1_021	2009	nutritional disorders	12
level1	TZ_1_021	2009	anaemia	15
level1	TZ_1_021	2009	pneumonia	30
level1	TZ_1_021	2009	pre-natal conditions	0
level1	TZ_1_021	2009	HIV/AIDS	8
level1	TZ_1_021	2009	others	25
level1	TZ_1_022	2009	acute respiratory infections	0
level1	TZ_1_022	2009	diarrhoeal diseases	25
level1	TZ_1_022	2009	malaria	72
level1	TZ_1_022	2009	nutritional disorders	2
level1	TZ_1_022	2009	anaemia	25
level1	TZ_1_022	2009	pneumonia	45
level1	TZ_1_022	2009	pre-natal conditions	27
level1	TZ_1_022	2009	HIV/AIDS	10
level1	TZ_1_022	2009	others	23
level1	TZ_1_023	2009	acute respiratory infections	11
level1	TZ_1_023	2009	diarrhoeal diseases	34
level1	TZ_1_023	2009	malaria	128
level1	TZ_1_023	2009	nutritional disorders	28
level1	TZ_1_023	2009	anaemia	52
level1	TZ_1_023	2009	pneumonia	53
level1	TZ_1_023	2009	pre-natal conditions	2
level1	TZ_1_023	2009	HIV/AIDS	0
level1	TZ_1_023	2009	others	24
level1	TZ_1_024	2009	acute respiratory infections	1
level1	TZ_1_024	2009	diarrhoeal diseases	21
level1	TZ_1_024	2009	malaria	271
level1	TZ_1_024	2009	nutritional disorders	19
level1	TZ_1_024	2009	anaemia	70
level1	TZ_1_024	2009	pneumonia	74
level1	TZ_1_024	2009	pre-natal conditions	12
level1	TZ_1_024	2009	HIV/AIDS	10
level1	TZ_1_024	2009	others	42
level1	TZ_1_025	2009	acute respiratory infections	0
level1	TZ_1_025	2009	diarrhoeal diseases	10
level1	TZ_1_025	2009	malaria	370
level1	TZ_1_025	2009	nutritional disorders	3
level1	TZ_1_025	2009	anaemia	100
level1	TZ_1_025	2009	pneumonia	45
level1	TZ_1_025	2009	pre-natal conditions	0
level1	TZ_1_025	2009	HIV/AIDS	0
level1	TZ_1_025	2009	others	33
level1	TZ_1_026	2009	acute respiratory infections	2
level1	TZ_1_026	2009	diarrhoeal diseases	12
level1	TZ_1_026	2009	malaria	205
level1	TZ_1_026	2009	nutritional disorders	20
level1	TZ_1_026	2009	anaemia	241
level1	TZ_1_026	2009	pneumonia	49
level1	TZ_1_026	2009	pre-natal conditions	12
level1	TZ_1_026	2009	HIV/AIDS	10
level1	TZ_1_026	2009	others	126
level1	TZ_1_027	2009	acute respiratory infections	38
level1	TZ_1_027	2009	diarrhoeal diseases	76
level1	TZ_1_027	2009	malaria	146
level1	TZ_1_027	2009	nutritional disorders	23
level1	TZ_1_027	2009	anaemia	45
level1	TZ_1_027	2009	pneumonia	92
level1	TZ_1_027	2009	pre-natal conditions	25
level1	TZ_1_027	2009	HIV/AIDS	7
level1	TZ_1_027	2009	others	75
level1	TZ_1_029	2009	acute respiratory infections	2
level1	TZ_1_029	2009	diarrhoeal diseases	60
level1	TZ_1_029	2009	malaria	380
level1	TZ_1_029	2009	nutritional disorders	16
level1	TZ_1_029	2009	anaemia	172
level1	TZ_1_029	2009	pneumonia	93
level1	TZ_1_029	2009	pre-natal conditions	0
level1	TZ_1_029	2009	HIV/AIDS	44
level1	TZ_1_029	2009	others	123
level1	TZ_1_028	2009	acute respiratory infections	34
level1	TZ_1_028	2009	diarrhoeal diseases	26
level1	TZ_1_028	2009	malaria	149
level1	TZ_1_028	2009	nutritional disorders	1
level1	TZ_1_028	2009	anaemia	68
level1	TZ_1_028	2009	pneumonia	124
level1	TZ_1_028	2009	pre-natal conditions	2
level1	TZ_1_028	2009	HIV/AIDS	40
level1	TZ_1_028	2009	others	22
level1	TZ_1_007	2009	acute respiratory infections	0
level1	TZ_1_007	2009	diarrhoeal diseases	0
level1	TZ_1_007	2009	malaria	0
level1	TZ_1_007	2009	nutritional disorders	0
level1	TZ_1_007	2009	anaemia	0
level1	TZ_1_007	2009	pneumonia	0
level1	TZ_1_007	2009	pre-natal conditions	0
level1	TZ_1_007	2009	HIV/AIDS	0
level1	TZ_1_007	2009	others	0
level1	TZ_1_008	2009	acute respiratory infections	0
level1	TZ_1_008	2009	diarrhoeal diseases	0
level1	TZ_1_008	2009	malaria	0
level1	TZ_1_008	2009	nutritional disorders	0
level1	TZ_1_008	2009	anaemia	0
level1	TZ_1_008	2009	pneumonia	0
level1	TZ_1_008	2009	pre-natal conditions	0
level1	TZ_1_008	2009	HIV/AIDS	0
level1	TZ_1_008	2009	others	0
level1	TZ_1_012	2009	acute respiratory infections	0
level1	TZ_1_012	2009	diarrhoeal diseases	0
level1	TZ_1_012	2009	malaria	0
level1	TZ_1_012	2009	nutritional disorders	0
level1	TZ_1_012	2009	anaemia	0
level1	TZ_1_012	2009	pneumonia	0
level1	TZ_1_012	2009	pre-natal conditions	0
level1	TZ_1_012	2009	HIV/AIDS	0
level1	TZ_1_012	2009	others	0
level1	TZ_1_013	2009	acute respiratory infections	0
level1	TZ_1_013	2009	diarrhoeal diseases	0
level1	TZ_1_013	2009	malaria	0
level1	TZ_1_013	2009	nutritional disorders	0
level1	TZ_1_013	2009	anaemia	0
level1	TZ_1_013	2009	pneumonia	0
level1	TZ_1_013	2009	pre-natal conditions	0
level1	TZ_1_013	2009	HIV/AIDS	0
level1	TZ_1_013	2009	others	0
level1	TZ_1_030	2009	acute respiratory infections	0
level1	TZ_1_030	2009	diarrhoeal diseases	0
level1	TZ_1_030	2009	malaria	0
level1	TZ_1_030	2009	nutritional disorders	0
level1	TZ_1_030	2009	anaemia	0
level1	TZ_1_030	2009	pneumonia	0
level1	TZ_1_030	2009	pre-natal conditions	0
level1	TZ_1_030	2009	HIV/AIDS	0
level1	TZ_1_030	2009	others	0
country	TZ	2009	acute respiratory infections	356
country	TZ	2009	diarrhoeal diseases	800
country	TZ	2009	malaria	5031
country	TZ	2009	nutritional disorders	396
country	TZ	2009	anaemia	2241
country	TZ	2009	pneumonia	2315
country	TZ	2009	pre-natal conditions	967
country	TZ	2009	HIV/AIDS	349
country	TZ	2009	others	2138
\.


--
-- Name: causes_of_death_under_five pk_causes_of_death_under_five; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.causes_of_death_under_five
    ADD CONSTRAINT pk_causes_of_death_under_five PRIMARY KEY (geo_level, geo_code, geo_version, causes_of_death_under_five);


--
-- PostgreSQL database dump complete
--

