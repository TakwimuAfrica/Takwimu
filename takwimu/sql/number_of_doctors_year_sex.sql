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

ALTER TABLE IF EXISTS ONLY public.number_of_doctors_year_sex DROP CONSTRAINT IF EXISTS pk_number_of_doctors_year_sex;
DROP TABLE IF EXISTS public.number_of_doctors_year_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: number_of_doctors_year_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.number_of_doctors_year_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    number_of_doctors_sex character varying(10) NOT NULL,
    number_of_doctors_year character varying(10) NOT NULL,
    total integer
);


--
-- Data for Name: number_of_doctors_year_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.number_of_doctors_year_sex (geo_level, geo_code, geo_version, number_of_doctors_sex, number_of_doctors_year, total) FROM stdin;
country	NG	2009	Female	2015	11943
country	NG	2009	Male	2015	23061
country	NG	2009	Female	2016	13450
country	NG	2009	Male	2016	25938
country	NG	2009	Female	2017	13791
country	NG	2009	Male	2017	26121
level1	NG_1_001	2009	Female	2015	104
level1	NG_1_001	2009	Male	2015	214
level1	NG_1_001	2009	Female	2016	226
level1	NG_1_001	2009	Male	2016	679
level1	NG_1_001	2009	Female	2017	229
level1	NG_1_001	2009	Male	2017	688
level1	NG_1_002	2009	Female	2015	34
level1	NG_1_002	2009	Male	2015	175
level1	NG_1_002	2009	Female	2016	25
level1	NG_1_002	2009	Male	2016	136
level1	NG_1_002	2009	Female	2017	24
level1	NG_1_002	2009	Male	2017	136
level1	NG_1_003	2009	Female	2015	158
level1	NG_1_003	2009	Male	2015	596
level1	NG_1_003	2009	Female	2016	346
level1	NG_1_003	2009	Male	2016	348
level1	NG_1_003	2009	Female	2017	359
level1	NG_1_003	2009	Male	2017	359
level1	NG_1_004	2009	Female	2015	106
level1	NG_1_004	2009	Male	2015	378
level1	NG_1_004	2009	Female	2016	340
level1	NG_1_004	2009	Male	2016	682
level1	NG_1_004	2009	Female	2017	352
level1	NG_1_004	2009	Male	2017	685
level1	NG_1_005	2009	Female	2015	62
level1	NG_1_005	2009	Male	2015	264
level1	NG_1_005	2009	Female	2016	15
level1	NG_1_005	2009	Male	2016	173
level1	NG_1_005	2009	Female	2017	16
level1	NG_1_005	2009	Male	2017	184
level1	NG_1_006	2009	Female	2015	79
level1	NG_1_006	2009	Male	2015	269
level1	NG_1_006	2009	Female	2016	248
level1	NG_1_006	2009	Male	2016	263
level1	NG_1_006	2009	Female	2017	254
level1	NG_1_006	2009	Male	2017	264
level1	NG_1_007	2009	Female	2015	72
level1	NG_1_007	2009	Male	2015	293
level1	NG_1_007	2009	Female	2016	212
level1	NG_1_007	2009	Male	2016	371
level1	NG_1_007	2009	Female	2017	221
level1	NG_1_007	2009	Male	2017	377
level1	NG_1_008	2009	Female	2015	111
level1	NG_1_008	2009	Male	2015	361
level1	NG_1_008	2009	Female	2016	149
level1	NG_1_008	2009	Male	2016	327
level1	NG_1_008	2009	Female	2017	153
level1	NG_1_008	2009	Male	2017	325
level1	NG_1_009	2009	Female	2015	132
level1	NG_1_009	2009	Male	2015	474
level1	NG_1_009	2009	Female	2016	235
level1	NG_1_009	2009	Male	2016	470
level1	NG_1_009	2009	Female	2017	224
level1	NG_1_009	2009	Male	2017	473
level1	NG_1_010	2009	Female	2015	214
level1	NG_1_010	2009	Male	2015	1106
level1	NG_1_010	2009	Female	2016	317
level1	NG_1_010	2009	Male	2016	888
level1	NG_1_010	2009	Female	2017	333
level1	NG_1_010	2009	Male	2017	903
level1	NG_1_011	2009	Female	2015	89
level1	NG_1_011	2009	Male	2015	250
level1	NG_1_011	2009	Female	2016	122
level1	NG_1_011	2009	Male	2016	356
level1	NG_1_011	2009	Female	2017	124
level1	NG_1_011	2009	Male	2017	354
level1	NG_1_012	2009	Female	2015	796
level1	NG_1_012	2009	Male	2015	1526
level1	NG_1_012	2009	Female	2016	894
level1	NG_1_012	2009	Male	2016	2052
level1	NG_1_012	2009	Female	2017	927
level1	NG_1_012	2009	Male	2017	2065
level1	NG_1_013	2009	Female	2015	89
level1	NG_1_013	2009	Male	2015	406
level1	NG_1_013	2009	Female	2016	105
level1	NG_1_013	2009	Male	2016	424
level1	NG_1_013	2009	Female	2017	103
level1	NG_1_013	2009	Male	2017	415
level1	NG_1_014	2009	Female	2015	232
level1	NG_1_014	2009	Male	2015	788
level1	NG_1_014	2009	Female	2016	1117
level1	NG_1_014	2009	Male	2016	1303
level1	NG_1_014	2009	Female	2017	1144
level1	NG_1_014	2009	Male	2017	1290
level1	NG_1_015	2009	Female	2015	60
level1	NG_1_015	2009	Male	2015	298
level1	NG_1_015	2009	Female	2016	1368
level1	NG_1_015	2009	Male	2016	1521
level1	NG_1_015	2009	Female	2017	1398
level1	NG_1_015	2009	Male	2017	1416
level1	NG_1_016	2009	Female	2015	704
level1	NG_1_016	2009	Male	2015	1368
level1	NG_1_016	2009	Female	2016	23
level1	NG_1_016	2009	Male	2016	200
level1	NG_1_016	2009	Female	2017	26
level1	NG_1_016	2009	Male	2017	212
level1	NG_1_017	2009	Female	2015	24
level1	NG_1_017	2009	Male	2015	27
level1	NG_1_017	2009	Female	2016	150
level1	NG_1_017	2009	Male	2016	311
level1	NG_1_017	2009	Female	2017	158
level1	NG_1_017	2009	Male	2017	320
level1	NG_1_018	2009	Female	2015	46
level1	NG_1_018	2009	Male	2015	212
level1	NG_1_018	2009	Female	2016	8
level1	NG_1_018	2009	Male	2016	186
level1	NG_1_018	2009	Female	2017	10
level1	NG_1_018	2009	Male	2017	192
level1	NG_1_019	2009	Female	2015	445
level1	NG_1_019	2009	Male	2015	903
level1	NG_1_019	2009	Female	2016	404
level1	NG_1_019	2009	Male	2016	1399
level1	NG_1_019	2009	Female	2017	422
level1	NG_1_019	2009	Male	2017	1413
level1	NG_1_020	2009	Female	2015	375
level1	NG_1_020	2009	Male	2015	812
level1	NG_1_020	2009	Female	2016	311
level1	NG_1_020	2009	Male	2016	625
level1	NG_1_020	2009	Female	2017	325
level1	NG_1_020	2009	Male	2017	632
level1	NG_1_021	2009	Female	2015	69
level1	NG_1_021	2009	Male	2015	136
level1	NG_1_021	2009	Female	2016	25
level1	NG_1_021	2009	Male	2016	124
level1	NG_1_021	2009	Female	2017	25
level1	NG_1_021	2009	Male	2017	122
level1	NG_1_022	2009	Female	2015	41
level1	NG_1_022	2009	Male	2015	139
level1	NG_1_022	2009	Female	2016	19
level1	NG_1_022	2009	Male	2016	136
level1	NG_1_022	2009	Female	2017	20
level1	NG_1_022	2009	Male	2017	135
level1	NG_1_023	2009	Female	2015	50
level1	NG_1_023	2009	Male	2015	137
level1	NG_1_023	2009	Female	2016	57
level1	NG_1_023	2009	Male	2016	302
level1	NG_1_023	2009	Female	2017	57
level1	NG_1_023	2009	Male	2017	301
level1	NG_1_024	2009	Female	2015	229
level1	NG_1_024	2009	Male	2015	372
level1	NG_1_024	2009	Female	2016	300
level1	NG_1_024	2009	Male	2016	766
level1	NG_1_024	2009	Female	2017	312
level1	NG_1_024	2009	Male	2017	765
level1	NG_1_025	2009	Female	2015	3744
level1	NG_1_025	2009	Male	2015	4120
level1	NG_1_025	2009	Female	2016	2711
level1	NG_1_025	2009	Male	2016	4517
level1	NG_1_025	2009	Female	2017	2790
level1	NG_1_025	2009	Male	2017	4553
level1	NG_1_026	2009	Female	2015	63
level1	NG_1_026	2009	Male	2015	152
level1	NG_1_026	2009	Female	2016	45
level1	NG_1_026	2009	Male	2016	170
level1	NG_1_026	2009	Female	2017	42
level1	NG_1_026	2009	Male	2017	158
level1	NG_1_027	2009	Female	2015	149
level1	NG_1_027	2009	Male	2015	224
level1	NG_1_027	2009	Female	2016	59
level1	NG_1_027	2009	Male	2016	331
level1	NG_1_027	2009	Female	2017	63
level1	NG_1_027	2009	Male	2017	335
level1	NG_1_028	2009	Female	2015	279
level1	NG_1_028	2009	Male	2015	1067
level1	NG_1_028	2009	Female	2016	280
level1	NG_1_028	2009	Male	2016	645
level1	NG_1_028	2009	Female	2017	284
level1	NG_1_028	2009	Male	2017	633
level1	NG_1_029	2009	Female	2015	308
level1	NG_1_029	2009	Male	2015	639
level1	NG_1_029	2009	Female	2016	132
level1	NG_1_029	2009	Male	2016	535
level1	NG_1_029	2009	Female	2017	135
level1	NG_1_029	2009	Male	2017	542
level1	NG_1_030	2009	Female	2015	855
level1	NG_1_030	2009	Male	2015	1093
level1	NG_1_030	2009	Female	2016	480
level1	NG_1_030	2009	Male	2016	639
level1	NG_1_030	2009	Female	2017	480
level1	NG_1_030	2009	Male	2017	637
level1	NG_1_031	2009	Female	2015	885
level1	NG_1_031	2009	Male	2015	1516
level1	NG_1_031	2009	Female	2016	1100
level1	NG_1_031	2009	Male	2016	1755
level1	NG_1_031	2009	Female	2017	1120
level1	NG_1_031	2009	Male	2017	1753
level1	NG_1_032	2009	Female	2015	199
level1	NG_1_032	2009	Male	2015	572
level1	NG_1_032	2009	Female	2016	339
level1	NG_1_032	2009	Male	2016	777
level1	NG_1_032	2009	Female	2017	346
level1	NG_1_032	2009	Male	2017	771
level1	NG_1_033	2009	Female	2015	796
level1	NG_1_033	2009	Male	2015	1017
level1	NG_1_033	2009	Female	2016	747
level1	NG_1_033	2009	Male	2016	1235
level1	NG_1_033	2009	Female	2017	758
level1	NG_1_033	2009	Male	2017	1237
level1	NG_1_034	2009	Female	2015	82
level1	NG_1_034	2009	Male	2015	235
level1	NG_1_034	2009	Female	2016	156
level1	NG_1_034	2009	Male	2016	450
level1	NG_1_034	2009	Female	2017	155
level1	NG_1_034	2009	Male	2017	443
level1	NG_1_035	2009	Female	2015	53
level1	NG_1_035	2009	Male	2015	356
level1	NG_1_035	2009	Female	2016	37
level1	NG_1_035	2009	Male	2016	153
level1	NG_1_035	2009	Female	2017	40
level1	NG_1_035	2009	Male	2017	160
level1	NG_1_036	2009	Female	2015	38
level1	NG_1_036	2009	Male	2015	39
level1	NG_1_036	2009	Female	2016	3
level1	NG_1_036	2009	Male	2016	63
level1	NG_1_036	2009	Female	2017	13
level1	NG_1_036	2009	Male	2017	265
level1	NG_1_037	2009	Female	2015	39
level1	NG_1_037	2009	Male	2015	127
level1	NG_1_037	2009	Female	2016	15
level1	NG_1_037	2009	Male	2016	119
level1	NG_1_037	2009	Female	2017	14
level1	NG_1_037	2009	Male	2017	105
\.


--
-- Name: number_of_doctors_year_sex pk_number_of_doctors_year_sex; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.number_of_doctors_year_sex
    ADD CONSTRAINT pk_number_of_doctors_year_sex PRIMARY KEY (geo_level, geo_code, geo_version, number_of_doctors_sex, number_of_doctors_year);


--
-- PostgreSQL database dump complete
--
