--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: inpatient_diagnosis_under_five; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inpatient_diagnosis_under_five (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    inpatient_diagnosis_under_five character varying(128) NOT NULL,
    total integer
);

--
-- Data for Name: inpatient_diagnosis_under_five; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inpatient_diagnosis_under_five (geo_level, geo_code, geo_version, inpatient_diagnosis_under_five, total) FROM stdin;
level1	TZ_1_001	2009	diarrhoea	1771
level1	TZ_1_001	2009	burn	442
level1	TZ_1_001	2009	kwashiokor	76
level1	TZ_1_001	2009	low birth weight	1288
level1	TZ_1_001	2009	malaria	936
level1	TZ_1_001	2009	anaemia	621
level1	TZ_1_001	2009	moderate malnutrition	203
level1	TZ_1_001	2009	neonatal septicaemia	831
level1	TZ_1_001	2009	pneumonia	7822
level1	TZ_1_002	2009	diarrhoea	1926
level1	TZ_1_002	2009	burn	256
level1	TZ_1_002	2009	kwashiokor	97
level1	TZ_1_002	2009	low birth weight	616
level1	TZ_1_002	2009	malaria	4837
level1	TZ_1_002	2009	anaemia	1238
level1	TZ_1_002	2009	moderate malnutrition	143
level1	TZ_1_002	2009	neonatal septicaemia	864
level1	TZ_1_002	2009	pneumonia	3658
level1	TZ_1_003	2009	diarrhoea	1908
level1	TZ_1_003	2009	burn	473
level1	TZ_1_003	2009	kwashiokor	41
level1	TZ_1_003	2009	low birth weight	908
level1	TZ_1_003	2009	malaria	5257
level1	TZ_1_003	2009	anaemia	1654
level1	TZ_1_003	2009	moderate malnutrition	265
level1	TZ_1_003	2009	neonatal septicaemia	3340
level1	TZ_1_003	2009	pneumonia	4213
level1	TZ_1_004	2009	diarrhoea	1276
level1	TZ_1_004	2009	burn	126
level1	TZ_1_004	2009	kwashiokor	72
level1	TZ_1_004	2009	low birth weight	43
level1	TZ_1_004	2009	malaria	10533
level1	TZ_1_004	2009	anaemia	3520
level1	TZ_1_004	2009	moderate malnutrition	62
level1	TZ_1_004	2009	neonatal septicaemia	15
level1	TZ_1_004	2009	pneumonia	1785
level1	TZ_1_005	2009	diarrhoea	949
level1	TZ_1_005	2009	burn	154
level1	TZ_1_005	2009	kwashiokor	203
level1	TZ_1_005	2009	low birth weight	463
level1	TZ_1_005	2009	malaria	2492
level1	TZ_1_005	2009	anaemia	337
level1	TZ_1_005	2009	moderate malnutrition	75
level1	TZ_1_005	2009	neonatal septicaemia	211
level1	TZ_1_005	2009	pneumonia	2249
level1	TZ_1_006	2009	diarrhoea	4534
level1	TZ_1_006	2009	burn	171
level1	TZ_1_006	2009	kwashiokor	202
level1	TZ_1_006	2009	low birth weight	325
level1	TZ_1_006	2009	malaria	31668
level1	TZ_1_006	2009	anaemia	5865
level1	TZ_1_006	2009	moderate malnutrition	410
level1	TZ_1_006	2009	neonatal septicaemia	255
level1	TZ_1_006	2009	pneumonia	8724
level1	TZ_1_007	2009	diarrhoea	2252
level1	TZ_1_007	2009	burn	464
level1	TZ_1_007	2009	kwashiokor	121
level1	TZ_1_007	2009	low birth weight	560
level1	TZ_1_007	2009	malaria	11689
level1	TZ_1_007	2009	anaemia	2385
level1	TZ_1_007	2009	moderate malnutrition	170
level1	TZ_1_007	2009	neonatal septicaemia	796
level1	TZ_1_007	2009	pneumonia	7463
level1	TZ_1_009	2009	diarrhoea	2
level1	TZ_1_009	2009	burn	0
level1	TZ_1_009	2009	kwashiokor	0
level1	TZ_1_009	2009	low birth weight	3
level1	TZ_1_009	2009	malaria	6
level1	TZ_1_009	2009	anaemia	3
level1	TZ_1_009	2009	moderate malnutrition	0
level1	TZ_1_009	2009	neonatal septicaemia	2
level1	TZ_1_009	2009	pneumonia	6
level1	TZ_1_010	2009	diarrhoea	538
level1	TZ_1_010	2009	burn	46
level1	TZ_1_010	2009	kwashiokor	44
level1	TZ_1_010	2009	low birth weight	7
level1	TZ_1_010	2009	malaria	2561
level1	TZ_1_010	2009	anaemia	1015
level1	TZ_1_010	2009	moderate malnutrition	25
level1	TZ_1_010	2009	neonatal septicaemia	3
level1	TZ_1_010	2009	pneumonia	587
level1	TZ_1_011	2009	diarrhoea	2016
level1	TZ_1_011	2009	burn	139
level1	TZ_1_011	2009	kwashiokor	72
level1	TZ_1_011	2009	low birth weight	436
level1	TZ_1_011	2009	malaria	12335
level1	TZ_1_011	2009	anaemia	3211
level1	TZ_1_011	2009	moderate malnutrition	57
level1	TZ_1_011	2009	neonatal septicaemia	534
level1	TZ_1_011	2009	pneumonia	3160
level1	TZ_1_014	2009	diarrhoea	2583
level1	TZ_1_014	2009	burn	528
level1	TZ_1_014	2009	kwashiokor	543
level1	TZ_1_014	2009	low birth weight	37
level1	TZ_1_014	2009	malaria	2539
level1	TZ_1_014	2009	anaemia	1416
level1	TZ_1_014	2009	moderate malnutrition	1018
level1	TZ_1_014	2009	neonatal septicaemia	512
level1	TZ_1_014	2009	pneumonia	7863
level1	TZ_1_015	2009	diarrhoea	882
level1	TZ_1_015	2009	burn	58
level1	TZ_1_015	2009	kwashiokor	19
level1	TZ_1_015	2009	low birth weight	285
level1	TZ_1_015	2009	malaria	7713
level1	TZ_1_015	2009	anaemia	1408
level1	TZ_1_015	2009	moderate malnutrition	26
level1	TZ_1_015	2009	neonatal septicaemia	447
level1	TZ_1_015	2009	pneumonia	1452
level1	TZ_1_016	2009	diarrhoea	1906
level1	TZ_1_016	2009	burn	176
level1	TZ_1_016	2009	kwashiokor	143
level1	TZ_1_016	2009	low birth weight	74
level1	TZ_1_016	2009	malaria	3422
level1	TZ_1_016	2009	anaemia	416
level1	TZ_1_016	2009	moderate malnutrition	132
level1	TZ_1_016	2009	neonatal septicaemia	196
level1	TZ_1_016	2009	pneumonia	6594
level1	TZ_1_017	2009	diarrhoea	2525
level1	TZ_1_017	2009	burn	230
level1	TZ_1_017	2009	kwashiokor	120
level1	TZ_1_017	2009	low birth weight	160
level1	TZ_1_017	2009	malaria	19667
level1	TZ_1_017	2009	anaemia	6295
level1	TZ_1_017	2009	moderate malnutrition	175
level1	TZ_1_017	2009	neonatal septicaemia	102
level1	TZ_1_017	2009	pneumonia	3727
level1	TZ_1_018	2009	diarrhoea	3493
level1	TZ_1_018	2009	burn	369
level1	TZ_1_018	2009	kwashiokor	90
level1	TZ_1_018	2009	low birth weight	687
level1	TZ_1_018	2009	malaria	7067
level1	TZ_1_018	2009	anaemia	909
level1	TZ_1_018	2009	moderate malnutrition	161
level1	TZ_1_018	2009	neonatal septicaemia	403
level1	TZ_1_018	2009	pneumonia	8296
level1	TZ_1_019	2009	diarrhoea	2120
level1	TZ_1_019	2009	burn	349
level1	TZ_1_019	2009	kwashiokor	86
level1	TZ_1_019	2009	low birth weight	551
level1	TZ_1_019	2009	malaria	18784
level1	TZ_1_019	2009	anaemia	3190
level1	TZ_1_019	2009	moderate malnutrition	228
level1	TZ_1_019	2009	neonatal septicaemia	1013
level1	TZ_1_019	2009	pneumonia	5425
level1	TZ_1_020	2009	diarrhoea	728
level1	TZ_1_020	2009	burn	142
level1	TZ_1_020	2009	kwashiokor	18
level1	TZ_1_020	2009	low birth weight	251
level1	TZ_1_020	2009	malaria	10743
level1	TZ_1_020	2009	anaemia	1370
level1	TZ_1_020	2009	moderate malnutrition	33
level1	TZ_1_020	2009	neonatal septicaemia	354
level1	TZ_1_020	2009	pneumonia	1866
level1	TZ_1_021	2009	diarrhoea	2916
level1	TZ_1_021	2009	burn	326
level1	TZ_1_021	2009	kwashiokor	173
level1	TZ_1_021	2009	low birth weight	463
level1	TZ_1_021	2009	malaria	20998
level1	TZ_1_021	2009	anaemia	4395
level1	TZ_1_021	2009	moderate malnutrition	67
level1	TZ_1_021	2009	neonatal septicaemia	277
level1	TZ_1_021	2009	pneumonia	4719
level1	TZ_1_022	2009	diarrhoea	1437
level1	TZ_1_022	2009	burn	226
level1	TZ_1_022	2009	kwashiokor	56
level1	TZ_1_022	2009	low birth weight	75
level1	TZ_1_022	2009	malaria	2230
level1	TZ_1_022	2009	anaemia	307
level1	TZ_1_022	2009	moderate malnutrition	88
level1	TZ_1_022	2009	neonatal septicaemia	44
level1	TZ_1_022	2009	pneumonia	3520
level1	TZ_1_023	2009	diarrhoea	607
level1	TZ_1_023	2009	burn	202
level1	TZ_1_023	2009	kwashiokor	12
level1	TZ_1_023	2009	low birth weight	431
level1	TZ_1_023	2009	malaria	7660
level1	TZ_1_023	2009	anaemia	2053
level1	TZ_1_023	2009	moderate malnutrition	527
level1	TZ_1_023	2009	neonatal septicaemia	715
level1	TZ_1_023	2009	pneumonia	2085
level1	TZ_1_024	2009	diarrhoea	1302
level1	TZ_1_024	2009	burn	126
level1	TZ_1_024	2009	kwashiokor	48
level1	TZ_1_024	2009	low birth weight	46
level1	TZ_1_024	2009	malaria	4597
level1	TZ_1_024	2009	anaemia	1028
level1	TZ_1_024	2009	moderate malnutrition	58
level1	TZ_1_024	2009	neonatal septicaemia	9
level1	TZ_1_024	2009	pneumonia	973
level1	TZ_1_025	2009	diarrhoea	2386
level1	TZ_1_025	2009	burn	188
level1	TZ_1_025	2009	kwashiokor	44
level1	TZ_1_025	2009	low birth weight	538
level1	TZ_1_025	2009	malaria	20396
level1	TZ_1_025	2009	anaemia	2454
level1	TZ_1_025	2009	moderate malnutrition	95
level1	TZ_1_025	2009	neonatal septicaemia	156
level1	TZ_1_025	2009	pneumonia	4572
level1	TZ_1_026	2009	diarrhoea	1761
level1	TZ_1_026	2009	burn	130
level1	TZ_1_026	2009	kwashiokor	41
level1	TZ_1_026	2009	low birth weight	140
level1	TZ_1_026	2009	malaria	11955
level1	TZ_1_026	2009	anaemia	4793
level1	TZ_1_026	2009	moderate malnutrition	70
level1	TZ_1_026	2009	neonatal septicaemia	142
level1	TZ_1_026	2009	pneumonia	1745
level1	TZ_1_027	2009	diarrhoea	1279
level1	TZ_1_027	2009	burn	108
level1	TZ_1_027	2009	kwashiokor	127
level1	TZ_1_027	2009	low birth weight	46
level1	TZ_1_027	2009	malaria	6625
level1	TZ_1_027	2009	anaemia	2766
level1	TZ_1_027	2009	moderate malnutrition	87
level1	TZ_1_027	2009	neonatal septicaemia	29
level1	TZ_1_027	2009	pneumonia	1301
level1	TZ_1_028	2009	diarrhoea	3262
level1	TZ_1_028	2009	burn	206
level1	TZ_1_028	2009	kwashiokor	56
level1	TZ_1_028	2009	low birth weight	93
level1	TZ_1_028	2009	malaria	16336
level1	TZ_1_028	2009	anaemia	3017
level1	TZ_1_028	2009	moderate malnutrition	153
level1	TZ_1_028	2009	neonatal septicaemia	235
level1	TZ_1_028	2009	pneumonia	3187
level1	TZ_1_029	2009	diarrhoea	2234
level1	TZ_1_029	2009	burn	178
level1	TZ_1_029	2009	kwashiokor	97
level1	TZ_1_029	2009	low birth weight	151
level1	TZ_1_029	2009	malaria	5547
level1	TZ_1_029	2009	anaemia	1444
level1	TZ_1_029	2009	moderate malnutrition	113
level1	TZ_1_029	2009	neonatal septicaemia	141
level1	TZ_1_029	2009	pneumonia	2944
country	TZ	2009	diarrhoea	48593
country	TZ	2009	burn	5813
country	TZ	2009	kwashiokor	2601
country	TZ	2009	low birth weight	8677
country	TZ	2009	malaria	248593
country	TZ	2009	anaemia	57110
country	TZ	2009	moderate malnutrition	4441
country	TZ	2009	neonatal septicaemia	11626
country	TZ	2009	pneumonia	99936
\.


--
-- Name: inpatient_diagnosis_under_five pk_inpatient_diagnosis_under_five; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inpatient_diagnosis_under_five
    ADD CONSTRAINT pk_inpatient_diagnosis_under_five PRIMARY KEY (geo_level, geo_code, geo_version, inpatient_diagnosis_under_five);

--
-- PostgreSQL database dump complete
--

