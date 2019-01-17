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

ALTER TABLE IF EXISTS ONLY public.inpatient_diagnosis_over_five DROP CONSTRAINT IF EXISTS pk_inpatient_diagnosis_over_five;
DROP TABLE IF EXISTS public.inpatient_diagnosis_over_five;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: inpatient_diagnosis_over_five; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inpatient_diagnosis_over_five (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    inpatient_diagnosis_over_five character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: inpatient_diagnosis_over_five; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inpatient_diagnosis_over_five (geo_level, geo_code, geo_version, inpatient_diagnosis_over_five, total) FROM stdin;
level1	TZ_1_001	2009	diarrhoea	1250
level1	TZ_1_001	2009	cardiac failure	912
level1	TZ_1_001	2009	diabete mellitus	1330
level1	TZ_1_001	2009	fracture	2343
level1	TZ_1_001	2009	hypertension	1621
level1	TZ_1_001	2009	malaria	2377
level1	TZ_1_001	2009	anaemia	1451
level1	TZ_1_001	2009	pneumonia	3881
level1	TZ_1_001	2009	road accident injury	1252
level1	TZ_1_001	2009	STI	102
level1	TZ_1_001	2009	HIV	1977
level1	TZ_1_001	2009	TB	1016
level1	TZ_1_001	2009	Typhoid	1094
level1	TZ_1_001	2009	UTI	1148
level1	TZ_1_003	2009	diarrhoea	2567
level1	TZ_1_003	2009	cardiac failure	913
level1	TZ_1_003	2009	diabete mellitus	4906
level1	TZ_1_003	2009	fracture	1019
level1	TZ_1_003	2009	hypertension	6187
level1	TZ_1_003	2009	malaria	12152
level1	TZ_1_003	2009	anaemia	3083
level1	TZ_1_003	2009	pneumonia	2114
level1	TZ_1_003	2009	road accident injury	668
level1	TZ_1_003	2009	STI	321
level1	TZ_1_003	2009	HIV	2658
level1	TZ_1_003	2009	TB	1074
level1	TZ_1_003	2009	Typhoid	993
level1	TZ_1_003	2009	UTI	1827
level1	TZ_1_002	2009	diarrhoea	1375
level1	TZ_1_002	2009	cardiac failure	411
level1	TZ_1_002	2009	diabete mellitus	360
level1	TZ_1_002	2009	fracture	2232
level1	TZ_1_002	2009	hypertension	1009
level1	TZ_1_002	2009	malaria	8228
level1	TZ_1_002	2009	anaemia	2260
level1	TZ_1_002	2009	pneumonia	1903
level1	TZ_1_002	2009	road accident injury	2312
level1	TZ_1_002	2009	STI	133
level1	TZ_1_002	2009	HIV	936
level1	TZ_1_002	2009	TB	475
level1	TZ_1_002	2009	Typhoid	921
level1	TZ_1_002	2009	UTI	933
level1	TZ_1_004	2009	diarrhoea	1012
level1	TZ_1_004	2009	cardiac failure	97
level1	TZ_1_004	2009	diabete mellitus	186
level1	TZ_1_004	2009	fracture	245
level1	TZ_1_004	2009	hypertension	286
level1	TZ_1_004	2009	malaria	7709
level1	TZ_1_004	2009	anaemia	1445
level1	TZ_1_004	2009	pneumonia	759
level1	TZ_1_004	2009	road accident injury	1068
level1	TZ_1_004	2009	STI	102
level1	TZ_1_004	2009	HIV	574
level1	TZ_1_004	2009	TB	264
level1	TZ_1_004	2009	Typhoid	378
level1	TZ_1_004	2009	UTI	924
level1	TZ_1_005	2009	diarrhoea	2134
level1	TZ_1_005	2009	cardiac failure	434
level1	TZ_1_005	2009	diabete mellitus	668
level1	TZ_1_005	2009	fracture	1111
level1	TZ_1_005	2009	hypertension	1078
level1	TZ_1_005	2009	malaria	12017
level1	TZ_1_005	2009	anaemia	2227
level1	TZ_1_005	2009	pneumonia	2390
level1	TZ_1_005	2009	road accident injury	2107
level1	TZ_1_005	2009	STI	315
level1	TZ_1_005	2009	HIV	1314
level1	TZ_1_005	2009	TB	678
level1	TZ_1_005	2009	Typhoid	725
level1	TZ_1_005	2009	UTI	1723
level1	TZ_1_006	2009	diarrhoea	2835
level1	TZ_1_006	2009	cardiac failure	491
level1	TZ_1_006	2009	diabete mellitus	1462
level1	TZ_1_006	2009	fracture	936
level1	TZ_1_006	2009	hypertension	2550
level1	TZ_1_006	2009	malaria	26243
level1	TZ_1_006	2009	anaemia	3004
level1	TZ_1_006	2009	pneumonia	4388
level1	TZ_1_006	2009	road accident injury	1503
level1	TZ_1_006	2009	STI	561
level1	TZ_1_006	2009	HIV	1018
level1	TZ_1_006	2009	TB	744
level1	TZ_1_006	2009	Typhoid	1108
level1	TZ_1_006	2009	UTI	6680
level1	TZ_1_009	2009	diarrhoea	568
level1	TZ_1_009	2009	cardiac failure	70
level1	TZ_1_009	2009	diabete mellitus	44
level1	TZ_1_009	2009	fracture	191
level1	TZ_1_009	2009	hypertension	139
level1	TZ_1_009	2009	malaria	2898
level1	TZ_1_009	2009	anaemia	661
level1	TZ_1_009	2009	pneumonia	387
level1	TZ_1_009	2009	road accident injury	368
level1	TZ_1_009	2009	STI	17
level1	TZ_1_009	2009	HIV	199
level1	TZ_1_009	2009	TB	46
level1	TZ_1_009	2009	Typhoid	137
level1	TZ_1_009	2009	UTI	293
level1	TZ_1_010	2009	diarrhoea	1105
level1	TZ_1_010	2009	cardiac failure	381
level1	TZ_1_010	2009	diabete mellitus	547
level1	TZ_1_010	2009	fracture	692
level1	TZ_1_010	2009	hypertension	834
level1	TZ_1_010	2009	malaria	13149
level1	TZ_1_010	2009	anaemia	2658
level1	TZ_1_010	2009	pneumonia	1276
level1	TZ_1_010	2009	road accident injury	724
level1	TZ_1_010	2009	STI	121
level1	TZ_1_010	2009	HIV	361
level1	TZ_1_010	2009	TB	224
level1	TZ_1_010	2009	Typhoid	265
level1	TZ_1_010	2009	UTI	2157
level1	TZ_1_011	2009	diarrhoea	2401
level1	TZ_1_011	2009	cardiac failure	1427
level1	TZ_1_011	2009	diabete mellitus	2198
level1	TZ_1_011	2009	fracture	2087
level1	TZ_1_011	2009	hypertension	3309
level1	TZ_1_011	2009	malaria	4359
level1	TZ_1_011	2009	anaemia	1902
level1	TZ_1_011	2009	pneumonia	5584
level1	TZ_1_011	2009	road accident injury	1136
level1	TZ_1_011	2009	STI	835
level1	TZ_1_011	2009	HIV	1548
level1	TZ_1_011	2009	TB	746
level1	TZ_1_011	2009	Typhoid	89
level1	TZ_1_011	2009	UTI	2580
level1	TZ_1_014	2009	diarrhoea	1392
level1	TZ_1_014	2009	cardiac failure	374
level1	TZ_1_014	2009	diabete mellitus	157
level1	TZ_1_014	2009	fracture	692
level1	TZ_1_014	2009	hypertension	777
level1	TZ_1_014	2009	malaria	11218
level1	TZ_1_014	2009	anaemia	1716
level1	TZ_1_014	2009	pneumonia	1016
level1	TZ_1_014	2009	road accident injury	401
level1	TZ_1_014	2009	STI	46
level1	TZ_1_014	2009	HIV	444
level1	TZ_1_014	2009	TB	204
level1	TZ_1_014	2009	Typhoid	203
level1	TZ_1_014	2009	UTI	551
level1	TZ_1_015	2009	diarrhoea	1362
level1	TZ_1_015	2009	cardiac failure	395
level1	TZ_1_015	2009	diabete mellitus	515
level1	TZ_1_015	2009	fracture	593
level1	TZ_1_015	2009	hypertension	425
level1	TZ_1_015	2009	malaria	6081
level1	TZ_1_015	2009	anaemia	882
level1	TZ_1_015	2009	pneumonia	3752
level1	TZ_1_015	2009	road accident injury	994
level1	TZ_1_015	2009	STI	253
level1	TZ_1_015	2009	HIV	502
level1	TZ_1_015	2009	TB	665
level1	TZ_1_015	2009	Typhoid	1032
level1	TZ_1_015	2009	UTI	662
level1	TZ_1_016	2009	diarrhoea	1644
level1	TZ_1_016	2009	cardiac failure	182
level1	TZ_1_016	2009	diabete mellitus	261
level1	TZ_1_016	2009	fracture	307
level1	TZ_1_016	2009	hypertension	549
level1	TZ_1_016	2009	malaria	19100
level1	TZ_1_016	2009	anaemia	3218
level1	TZ_1_016	2009	pneumonia	1847
level1	TZ_1_016	2009	road accident injury	1199
level1	TZ_1_016	2009	STI	231
level1	TZ_1_016	2009	HIV	1006
level1	TZ_1_016	2009	TB	492
level1	TZ_1_016	2009	Typhoid	1408
level1	TZ_1_016	2009	UTI	3375
level1	TZ_1_017	2009	diarrhoea	3902
level1	TZ_1_017	2009	cardiac failure	942
level1	TZ_1_017	2009	diabete mellitus	840
level1	TZ_1_017	2009	fracture	1570
level1	TZ_1_017	2009	hypertension	1983
level1	TZ_1_017	2009	malaria	14837
level1	TZ_1_017	2009	anaemia	2237
level1	TZ_1_017	2009	pneumonia	4922
level1	TZ_1_017	2009	road accident injury	2443
level1	TZ_1_017	2009	STI	212
level1	TZ_1_017	2009	HIV	2363
level1	TZ_1_017	2009	TB	982
level1	TZ_1_017	2009	Typhoid	2677
level1	TZ_1_017	2009	UTI	2373
level1	TZ_1_018	2009	diarrhoea	1847
level1	TZ_1_018	2009	cardiac failure	408
level1	TZ_1_018	2009	diabete mellitus	447
level1	TZ_1_018	2009	fracture	916
level1	TZ_1_018	2009	hypertension	1452
level1	TZ_1_018	2009	malaria	25892
level1	TZ_1_018	2009	anaemia	2698
level1	TZ_1_018	2009	pneumonia	3109
level1	TZ_1_018	2009	road accident injury	1036
level1	TZ_1_018	2009	STI	216
level1	TZ_1_018	2009	HIV	796
level1	TZ_1_018	2009	TB	305
level1	TZ_1_018	2009	Typhoid	1294
level1	TZ_1_018	2009	UTI	3282
level1	TZ_1_019	2009	diarrhoea	1286
level1	TZ_1_019	2009	cardiac failure	487
level1	TZ_1_019	2009	diabete mellitus	241
level1	TZ_1_019	2009	fracture	776
level1	TZ_1_019	2009	hypertension	1311
level1	TZ_1_019	2009	malaria	14537
level1	TZ_1_019	2009	anaemia	1483
level1	TZ_1_019	2009	pneumonia	1013
level1	TZ_1_019	2009	road accident injury	630
level1	TZ_1_019	2009	STI	110
level1	TZ_1_019	2009	HIV	621
level1	TZ_1_019	2009	TB	271
level1	TZ_1_019	2009	Typhoid	176
level1	TZ_1_019	2009	UTI	689
level1	TZ_1_020	2009	diarrhoea	2228
level1	TZ_1_020	2009	cardiac failure	401
level1	TZ_1_020	2009	diabete mellitus	613
level1	TZ_1_020	2009	fracture	460
level1	TZ_1_020	2009	hypertension	1225
level1	TZ_1_020	2009	malaria	19847
level1	TZ_1_020	2009	anaemia	3201
level1	TZ_1_020	2009	pneumonia	2316
level1	TZ_1_020	2009	road accident injury	843
level1	TZ_1_020	2009	STI	311
level1	TZ_1_020	2009	HIV	1545
level1	TZ_1_020	2009	TB	854
level1	TZ_1_020	2009	Typhoid	1380
level1	TZ_1_020	2009	UTI	3589
level1	TZ_1_021	2009	diarrhoea	2347
level1	TZ_1_021	2009	cardiac failure	365
level1	TZ_1_021	2009	diabete mellitus	216
level1	TZ_1_021	2009	fracture	1016
level1	TZ_1_021	2009	hypertension	887
level1	TZ_1_021	2009	malaria	4071
level1	TZ_1_021	2009	anaemia	902
level1	TZ_1_021	2009	pneumonia	2827
level1	TZ_1_021	2009	road accident injury	800
level1	TZ_1_021	2009	STI	118
level1	TZ_1_021	2009	HIV	962
level1	TZ_1_021	2009	TB	436
level1	TZ_1_021	2009	Typhoid	1596
level1	TZ_1_021	2009	UTI	866
level1	TZ_1_022	2009	diarrhoea	787
level1	TZ_1_022	2009	cardiac failure	307
level1	TZ_1_022	2009	diabete mellitus	340
level1	TZ_1_022	2009	fracture	1168
level1	TZ_1_022	2009	hypertension	1279
level1	TZ_1_022	2009	malaria	9633
level1	TZ_1_022	2009	anaemia	2000
level1	TZ_1_022	2009	pneumonia	1475
level1	TZ_1_022	2009	road accident injury	1452
level1	TZ_1_022	2009	STI	70
level1	TZ_1_022	2009	HIV	827
level1	TZ_1_022	2009	TB	351
level1	TZ_1_022	2009	Typhoid	78
level1	TZ_1_022	2009	UTI	1100
level1	TZ_1_023	2009	diarrhoea	759
level1	TZ_1_023	2009	cardiac failure	173
level1	TZ_1_023	2009	diabete mellitus	162
level1	TZ_1_023	2009	fracture	528
level1	TZ_1_023	2009	hypertension	332
level1	TZ_1_023	2009	malaria	5727
level1	TZ_1_023	2009	anaemia	778
level1	TZ_1_023	2009	pneumonia	516
level1	TZ_1_023	2009	road accident injury	501
level1	TZ_1_023	2009	STI	205
level1	TZ_1_023	2009	HIV	486
level1	TZ_1_023	2009	TB	214
level1	TZ_1_023	2009	Typhoid	372
level1	TZ_1_023	2009	UTI	358
level1	TZ_1_024	2009	diarrhoea	1796
level1	TZ_1_024	2009	cardiac failure	580
level1	TZ_1_024	2009	diabete mellitus	411
level1	TZ_1_024	2009	fracture	1499
level1	TZ_1_024	2009	hypertension	1278
level1	TZ_1_024	2009	malaria	24372
level1	TZ_1_024	2009	anaemia	1908
level1	TZ_1_024	2009	pneumonia	2945
level1	TZ_1_024	2009	road accident injury	1403
level1	TZ_1_024	2009	STI	389
level1	TZ_1_024	2009	HIV	865
level1	TZ_1_024	2009	TB	479
level1	TZ_1_024	2009	Typhoid	509
level1	TZ_1_024	2009	UTI	750
level1	TZ_1_025	2009	diarrhoea	1081
level1	TZ_1_025	2009	cardiac failure	383
level1	TZ_1_025	2009	diabete mellitus	279
level1	TZ_1_025	2009	fracture	749
level1	TZ_1_025	2009	hypertension	615
level1	TZ_1_025	2009	malaria	11638
level1	TZ_1_025	2009	anaemia	3245
level1	TZ_1_025	2009	pneumonia	1111
level1	TZ_1_025	2009	road accident injury	941
level1	TZ_1_025	2009	STI	224
level1	TZ_1_025	2009	HIV	962
level1	TZ_1_025	2009	TB	478
level1	TZ_1_025	2009	Typhoid	324
level1	TZ_1_025	2009	UTI	1723
level1	TZ_1_026	2009	diarrhoea	856
level1	TZ_1_026	2009	cardiac failure	127
level1	TZ_1_026	2009	diabete mellitus	95
level1	TZ_1_026	2009	fracture	135
level1	TZ_1_026	2009	hypertension	171
level1	TZ_1_026	2009	malaria	5885
level1	TZ_1_026	2009	anaemia	2458
level1	TZ_1_026	2009	pneumonia	514
level1	TZ_1_026	2009	road accident injury	232
level1	TZ_1_026	2009	STI	182
level1	TZ_1_026	2009	HIV	294
level1	TZ_1_026	2009	TB	298
level1	TZ_1_026	2009	Typhoid	94
level1	TZ_1_026	2009	UTI	713
level1	TZ_1_027	2009	diarrhoea	1638
level1	TZ_1_027	2009	cardiac failure	552
level1	TZ_1_027	2009	diabete mellitus	329
level1	TZ_1_027	2009	fracture	1334
level1	TZ_1_027	2009	hypertension	591
level1	TZ_1_027	2009	malaria	7737
level1	TZ_1_027	2009	anaemia	1785
level1	TZ_1_027	2009	pneumonia	1952
level1	TZ_1_027	2009	road accident injury	1111
level1	TZ_1_027	2009	STI	263
level1	TZ_1_027	2009	HIV	939
level1	TZ_1_027	2009	TB	731
level1	TZ_1_027	2009	Typhoid	1637
level1	TZ_1_027	2009	UTI	1081
level1	TZ_1_029	2009	diarrhoea	1604
level1	TZ_1_029	2009	cardiac failure	390
level1	TZ_1_029	2009	diabete mellitus	417
level1	TZ_1_029	2009	fracture	579
level1	TZ_1_029	2009	hypertension	698
level1	TZ_1_029	2009	malaria	14510
level1	TZ_1_029	2009	anaemia	1924
level1	TZ_1_029	2009	pneumonia	1302
level1	TZ_1_029	2009	road accident injury	867
level1	TZ_1_029	2009	STI	122
level1	TZ_1_029	2009	HIV	837
level1	TZ_1_029	2009	TB	337
level1	TZ_1_029	2009	Typhoid	179
level1	TZ_1_029	2009	UTI	1123
level1	TZ_1_028	2009	diarrhoea	1980
level1	TZ_1_028	2009	cardiac failure	671
level1	TZ_1_028	2009	diabete mellitus	1148
level1	TZ_1_028	2009	fracture	1676
level1	TZ_1_028	2009	hypertension	2246
level1	TZ_1_028	2009	malaria	18202
level1	TZ_1_028	2009	anaemia	3383
level1	TZ_1_028	2009	pneumonia	5042
level1	TZ_1_028	2009	road accident injury	1505
level1	TZ_1_028	2009	STI	269
level1	TZ_1_028	2009	HIV	1452
level1	TZ_1_028	2009	TB	934
level1	TZ_1_028	2009	Typhoid	896
level1	TZ_1_028	2009	UTI	2353
country	TZ	2009	diarrhoea	41756
country	TZ	2009	cardiac failure	11873
country	TZ	2009	diabete mellitus	18172
country	TZ	2009	fracture	24854
country	TZ	2009	hypertension	32832
country	TZ	2009	malaria	302419
country	TZ	2009	anaemia	52509
country	TZ	2009	pneumonia	58341
country	TZ	2009	road accident injury	27496
country	TZ	2009	STI	5728
country	TZ	2009	HIV	25486
country	TZ	2009	TB	13298
country	TZ	2009	Typhoid	19565
country	TZ	2009	UTI	42853
\.


--
-- Name: inpatient_diagnosis_over_five pk_inpatient_diagnosis_over_five; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inpatient_diagnosis_over_five
    ADD CONSTRAINT pk_inpatient_diagnosis_over_five PRIMARY KEY (geo_level, geo_code, geo_version, inpatient_diagnosis_over_five);


--
-- PostgreSQL database dump complete
--

