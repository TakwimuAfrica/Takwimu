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

ALTER TABLE IF EXISTS ONLY public.highest_education_level_reached DROP CONSTRAINT IF EXISTS pk_highest_education_level_reached;
DROP TABLE IF EXISTS public.highest_education_level_reached;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: highest_education_level_reached; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.highest_education_level_reached (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    highest_education_level_reached character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: highest_education_level_reached; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.highest_education_level_reached (geo_level, geo_code, geo_version, highest_education_level_reached, total) FROM stdin;
level1	KE_1_016	2009	madrassa	317
level1	KE_1_016	2009	basic literacy	4649
level1	KE_1_016	2009	none	99498
level1	KE_1_016	2009	pre-primary	51475
level1	KE_1_016	2009	primary	578689
level1	KE_1_016	2009	secondary	203414
level1	KE_1_016	2009	tertiary	37277
level1	KE_1_016	2009	university	12437
level1	KE_1_016	2009	youth polytechnic	18698
level1	KE_1_022	2009	basic literacy	4525
level1	KE_1_022	2009	madrassa	344
level1	KE_1_022	2009	none	97649
level1	KE_1_022	2009	pre-primary	95423
level1	KE_1_022	2009	primary	740539
level1	KE_1_022	2009	secondary	437294
level1	KE_1_022	2009	tertiary	112740
level1	KE_1_022	2009	university	45680
level1	KE_1_022	2009	youth polytechnic	8262
level1	KE_1_028	2009	basic literacy	419
level1	KE_1_028	2009	madrassa	17
level1	KE_1_028	2009	none	43642
level1	KE_1_028	2009	pre-primary	26192
level1	KE_1_028	2009	primary	201577
level1	KE_1_028	2009	secondary	49082
level1	KE_1_028	2009	tertiary	8409
level1	KE_1_028	2009	university	2197
level1	KE_1_028	2009	youth polytechnic	1505
level1	KE_1_030	2009	basic literacy	551
level1	KE_1_030	2009	madrassa	52
level1	KE_1_030	2009	none	140043
level1	KE_1_030	2009	pre-primary	38957
level1	KE_1_030	2009	primary	237325
level1	KE_1_030	2009	secondary	63547
level1	KE_1_030	2009	tertiary	14654
level1	KE_1_030	2009	university	3896
level1	KE_1_030	2009	youth polytechnic	1233
level1	KE_1_034	2009	basic literacy	1205
level1	KE_1_034	2009	madrassa	504
level1	KE_1_034	2009	none	144098
level1	KE_1_034	2009	pre-primary	45718
level1	KE_1_034	2009	primary	253654
level1	KE_1_034	2009	secondary	116920
level1	KE_1_034	2009	tertiary	31561
level1	KE_1_034	2009	university	19186
level1	KE_1_034	2009	youth polytechnic	2772
level1	KE_1_035	2009	basic literacy	647
level1	KE_1_035	2009	madrassa	80
level1	KE_1_035	2009	none	52661
level1	KE_1_035	2009	pre-primary	38252
level1	KE_1_035	2009	primary	322587
level1	KE_1_035	2009	secondary	92317
level1	KE_1_035	2009	tertiary	17826
level1	KE_1_035	2009	university	5298
level1	KE_1_035	2009	youth polytechnic	2104
level1	KE_1_036	2009	basic literacy	1015
level1	KE_1_036	2009	madrassa	79
level1	KE_1_036	2009	none	87597
level1	KE_1_036	2009	pre-primary	54658
level1	KE_1_036	2009	primary	503574
level1	KE_1_036	2009	secondary	126073
level1	KE_1_036	2009	tertiary	20942
level1	KE_1_036	2009	university	5388
level1	KE_1_036	2009	youth polytechnic	2921
level1	KE_1_037	2009	basic literacy	1599
level1	KE_1_037	2009	madrassa	230
level1	KE_1_037	2009	none	211448
level1	KE_1_037	2009	pre-primary	108891
level1	KE_1_037	2009	primary	883557
level1	KE_1_037	2009	secondary	224519
level1	KE_1_037	2009	tertiary	32942
level1	KE_1_037	2009	university	13329
level1	KE_1_037	2009	youth polytechnic	3156
level1	KE_1_007	2009	basic literacy	423
level1	KE_1_007	2009	madrassa	39662
level1	KE_1_007	2009	none	379051
level1	KE_1_007	2009	pre-primary	8775
level1	KE_1_007	2009	primary	112347
level1	KE_1_007	2009	secondary	24421
level1	KE_1_007	2009	tertiary	3095
level1	KE_1_007	2009	university	2461
level1	KE_1_007	2009	youth polytechnic	238
level1	KE_1_011	2009	basic literacy	125
level1	KE_1_011	2009	madrassa	1076
level1	KE_1_011	2009	none	54105
level1	KE_1_011	2009	pre-primary	9751
level1	KE_1_011	2009	primary	45724
level1	KE_1_011	2009	secondary	13589
level1	KE_1_011	2009	tertiary	2672
level1	KE_1_011	2009	university	931
level1	KE_1_011	2009	youth polytechnic	346
level1	KE_1_014	2009	basic literacy	1542
level1	KE_1_014	2009	madrassa	49
level1	KE_1_014	2009	none	56517
level1	KE_1_014	2009	pre-primary	18718
level1	KE_1_014	2009	primary	281293
level1	KE_1_014	2009	secondary	90932
level1	KE_1_014	2009	tertiary	17140
level1	KE_1_014	2009	university	5031
level1	KE_1_014	2009	youth polytechnic	3784
level1	KE_1_015	2009	basic literacy	2185
level1	KE_1_015	2009	madrassa	234
level1	KE_1_015	2009	none	168726
level1	KE_1_015	2009	pre-primary	57502
level1	KE_1_015	2009	primary	555091
level1	KE_1_015	2009	secondary	94245
level1	KE_1_015	2009	tertiary	17251
level1	KE_1_015	2009	university	4469
level1	KE_1_015	2009	youth polytechnic	12216
level1	KE_1_020	2009	basic literacy	1627
level1	KE_1_020	2009	madrassa	118
level1	KE_1_020	2009	none	45033
level1	KE_1_020	2009	pre-primary	21983
level1	KE_1_020	2009	primary	288571
level1	KE_1_020	2009	secondary	112656
level1	KE_1_020	2009	tertiary	15505
level1	KE_1_020	2009	university	4706
level1	KE_1_020	2009	youth polytechnic	1691
level1	KE_1_040	2009	basic literacy	640
level1	KE_1_040	2009	madrassa	120
level1	KE_1_040	2009	none	105650
level1	KE_1_040	2009	pre-primary	51408
level1	KE_1_040	2009	primary	400807
level1	KE_1_040	2009	secondary	85031
level1	KE_1_040	2009	tertiary	11784
level1	KE_1_040	2009	university	3753
level1	KE_1_040	2009	youth polytechnic	1661
level1	KE_1_039	2009	basic literacy	1333
level1	KE_1_039	2009	madrassa	114
level1	KE_1_039	2009	none	143688
level1	KE_1_039	2009	pre-primary	86555
level1	KE_1_039	2009	primary	731968
level1	KE_1_039	2009	secondary	217310
level1	KE_1_039	2009	tertiary	30024
level1	KE_1_039	2009	university	9351
level1	KE_1_039	2009	youth polytechnic	2641
level1	KE_1_042	2009	basic literacy	1491
level1	KE_1_042	2009	madrassa	164
level1	KE_1_042	2009	none	75700
level1	KE_1_042	2009	pre-primary	83062
level1	KE_1_042	2009	primary	481966
level1	KE_1_042	2009	secondary	167723
level1	KE_1_042	2009	tertiary	32808
level1	KE_1_042	2009	university	16264
level1	KE_1_042	2009	youth polytechnic	3004
level1	KE_1_043	2009	basic literacy	774
level1	KE_1_043	2009	madrassa	42
level1	KE_1_043	2009	none	87603
level1	KE_1_043	2009	pre-primary	91107
level1	KE_1_043	2009	primary	527361
level1	KE_1_043	2009	secondary	125211
level1	KE_1_043	2009	tertiary	16259
level1	KE_1_043	2009	university	5845
level1	KE_1_043	2009	youth polytechnic	1704
level1	KE_1_045	2009	basic literacy	1179
level1	KE_1_045	2009	madrassa	65
level1	KE_1_045	2009	none	118497
level1	KE_1_045	2009	pre-primary	86681
level1	KE_1_045	2009	primary	610717
level1	KE_1_045	2009	secondary	270662
level1	KE_1_045	2009	tertiary	30346
level1	KE_1_045	2009	university	10923
level1	KE_1_045	2009	youth polytechnic	4269
level1	KE_1_021	2009	basic literacy	3154
level1	KE_1_021	2009	madrassa	82
level1	KE_1_021	2009	none	80762
level1	KE_1_021	2009	pre-primary	33452
level1	KE_1_021	2009	primary	504390
level1	KE_1_021	2009	secondary	172117
level1	KE_1_021	2009	tertiary	24308
level1	KE_1_021	2009	university	6684
level1	KE_1_021	2009	youth polytechnic	3557
level1	KE_1_029	2009	basic literacy	814
level1	KE_1_029	2009	madrassa	93
level1	KE_1_029	2009	none	70364
level1	KE_1_029	2009	pre-primary	61589
level1	KE_1_029	2009	primary	419103
level1	KE_1_029	2009	secondary	100002
level1	KE_1_029	2009	tertiary	18298
level1	KE_1_029	2009	university	6194
level1	KE_1_029	2009	youth polytechnic	2010
level1	KE_1_031	2009	basic literacy	861
level1	KE_1_031	2009	madrassa	66
level1	KE_1_031	2009	none	61541
level1	KE_1_031	2009	pre-primary	27328
level1	KE_1_031	2009	primary	186821
level1	KE_1_031	2009	secondary	69127
level1	KE_1_031	2009	tertiary	11054
level1	KE_1_031	2009	university	3948
level1	KE_1_031	2009	youth polytechnic	1283
level1	KE_1_032	2009	basic literacy	2828
level1	KE_1_032	2009	madrassa	256
level1	KE_1_032	2009	none	139539
level1	KE_1_032	2009	pre-primary	116217
level1	KE_1_032	2009	primary	780918
level1	KE_1_032	2009	secondary	320381
level1	KE_1_032	2009	tertiary	61662
level1	KE_1_032	2009	university	23976
level1	KE_1_032	2009	youth polytechnic	3844
level1	KE_1_033	2009	basic literacy	572
level1	KE_1_033	2009	madrassa	84
level1	KE_1_033	2009	none	231573
level1	KE_1_033	2009	pre-primary	55205
level1	KE_1_033	2009	primary	376147
level1	KE_1_033	2009	secondary	66146
level1	KE_1_033	2009	tertiary	10601
level1	KE_1_033	2009	university	3052
level1	KE_1_033	2009	youth polytechnic	1070
level1	KE_1_044	2009	basic literacy	708
level1	KE_1_044	2009	madrassa	247
level1	KE_1_044	2009	none	90415
level1	KE_1_044	2009	pre-primary	81616
level1	KE_1_044	2009	primary	508578
level1	KE_1_044	2009	secondary	102617
level1	KE_1_044	2009	tertiary	14584
level1	KE_1_044	2009	university	5458
level1	KE_1_044	2009	youth polytechnic	1524
level1	KE_1_046	2009	basic literacy	455
level1	KE_1_046	2009	madrassa	13
level1	KE_1_046	2009	none	41178
level1	KE_1_046	2009	pre-primary	33258
level1	KE_1_046	2009	primary	233911
level1	KE_1_046	2009	secondary	113806
level1	KE_1_046	2009	tertiary	12102
level1	KE_1_046	2009	university	3656
level1	KE_1_046	2009	youth polytechnic	1483
level1	KE_1_047	2009	basic literacy	8300
level1	KE_1_047	2009	madrassa	9065
level1	KE_1_047	2009	none	162504
level1	KE_1_047	2009	pre-primary	162520
level1	KE_1_047	2009	primary	1074033
level1	KE_1_047	2009	secondary	944148
level1	KE_1_047	2009	tertiary	287649
level1	KE_1_047	2009	university	192337
level1	KE_1_047	2009	youth polytechnic	21803
level1	KE_1_002	2009	basic literacy	844
level1	KE_1_002	2009	madrassa	2446
level1	KE_1_002	2009	none	168879
level1	KE_1_002	2009	pre-primary	53274
level1	KE_1_002	2009	primary	290116
level1	KE_1_002	2009	secondary	49182
level1	KE_1_002	2009	tertiary	8370
level1	KE_1_002	2009	university	1992
level1	KE_1_002	2009	youth polytechnic	1503
level1	KE_1_005	2009	basic literacy	152
level1	KE_1_005	2009	madrassa	3004
level1	KE_1_005	2009	none	19460
level1	KE_1_005	2009	pre-primary	7812
level1	KE_1_005	2009	primary	48223
level1	KE_1_005	2009	secondary	10587
level1	KE_1_005	2009	tertiary	1480
level1	KE_1_005	2009	university	415
level1	KE_1_005	2009	youth polytechnic	131
level1	KE_1_009	2009	basic literacy	480
level1	KE_1_009	2009	madrassa	98975
level1	KE_1_009	2009	none	560334
level1	KE_1_009	2009	pre-primary	10411
level1	KE_1_009	2009	primary	235580
level1	KE_1_009	2009	secondary	40413
level1	KE_1_009	2009	tertiary	2519
level1	KE_1_009	2009	university	1424
level1	KE_1_009	2009	youth polytechnic	202
level1	KE_1_010	2009	basic literacy	468
level1	KE_1_010	2009	madrassa	3119
level1	KE_1_010	2009	none	163550
level1	KE_1_010	2009	pre-primary	12989
level1	KE_1_010	2009	primary	67450
level1	KE_1_010	2009	secondary	12665
level1	KE_1_010	2009	tertiary	2135
level1	KE_1_010	2009	university	956
level1	KE_1_010	2009	youth polytechnic	308
level1	KE_1_012	2009	basic literacy	4144
level1	KE_1_012	2009	madrassa	225
level1	KE_1_012	2009	none	226905
level1	KE_1_012	2009	pre-primary	71376
level1	KE_1_012	2009	primary	881763
level1	KE_1_012	2009	secondary	209839
level1	KE_1_012	2009	tertiary	39147
level1	KE_1_012	2009	university	11930
level1	KE_1_012	2009	youth polytechnic	10256
level1	KE_1_017	2009	basic literacy	2637
level1	KE_1_017	2009	madrassa	187
level1	KE_1_017	2009	none	99661
level1	KE_1_017	2009	pre-primary	39584
level1	KE_1_017	2009	primary	496042
level1	KE_1_017	2009	secondary	131811
level1	KE_1_017	2009	tertiary	19235
level1	KE_1_017	2009	university	4683
level1	KE_1_017	2009	youth polytechnic	11600
level1	KE_1_018	2009	basic literacy	1658
level1	KE_1_018	2009	madrassa	50
level1	KE_1_018	2009	none	47332
level1	KE_1_018	2009	pre-primary	40067
level1	KE_1_018	2009	primary	336716
level1	KE_1_018	2009	secondary	104653
level1	KE_1_018	2009	tertiary	12800
level1	KE_1_018	2009	university	3610
level1	KE_1_018	2009	youth polytechnic	1360
level1	KE_1_019	2009	basic literacy	2531
level1	KE_1_019	2009	madrassa	118
level1	KE_1_019	2009	none	42333
level1	KE_1_019	2009	pre-primary	36274
level1	KE_1_019	2009	primary	345189
level1	KE_1_019	2009	secondary	175626
level1	KE_1_019	2009	tertiary	28956
level1	KE_1_019	2009	university	9881
level1	KE_1_019	2009	youth polytechnic	3896
level1	KE_1_023	2009	basic literacy	840
level1	KE_1_023	2009	madrassa	424
level1	KE_1_023	2009	none	614643
level1	KE_1_023	2009	pre-primary	24486
level1	KE_1_023	2009	primary	121093
level1	KE_1_023	2009	secondary	22393
level1	KE_1_023	2009	tertiary	3776
level1	KE_1_023	2009	university	1489
level1	KE_1_023	2009	youth polytechnic	351
level1	KE_1_024	2009	basic literacy	153
level1	KE_1_024	2009	madrassa	23
level1	KE_1_024	2009	none	219742
level1	KE_1_024	2009	pre-primary	33514
level1	KE_1_024	2009	primary	172096
level1	KE_1_024	2009	secondary	22097
level1	KE_1_024	2009	tertiary	4564
level1	KE_1_024	2009	university	1407
level1	KE_1_024	2009	youth polytechnic	582
level1	KE_1_026	2009	basic literacy	774
level1	KE_1_026	2009	madrassa	110
level1	KE_1_026	2009	none	98644
level1	KE_1_026	2009	pre-primary	55557
level1	KE_1_026	2009	primary	425993
level1	KE_1_026	2009	secondary	126449
level1	KE_1_026	2009	tertiary	16326
level1	KE_1_026	2009	university	6412
level1	KE_1_026	2009	youth polytechnic	1173
level1	KE_1_027	2009	basic literacy	1428
level1	KE_1_027	2009	madrassa	182
level1	KE_1_027	2009	none	78641
level1	KE_1_027	2009	pre-primary	63490
level1	KE_1_027	2009	primary	422770
level1	KE_1_027	2009	secondary	174412
level1	KE_1_027	2009	tertiary	36479
level1	KE_1_027	2009	university	26454
level1	KE_1_027	2009	youth polytechnic	2778
level1	KE_1_038	2009	basic literacy	1328
level1	KE_1_038	2009	madrassa	60
level1	KE_1_038	2009	none	58485
level1	KE_1_038	2009	pre-primary	32971
level1	KE_1_038	2009	primary	309369
level1	KE_1_038	2009	secondary	82617
level1	KE_1_038	2009	tertiary	11985
level1	KE_1_038	2009	university	3907
level1	KE_1_038	2009	youth polytechnic	1481
level1	KE_1_041	2009	basic literacy	948
level1	KE_1_041	2009	madrassa	90
level1	KE_1_041	2009	none	102506
level1	KE_1_041	2009	pre-primary	59001
level1	KE_1_041	2009	primary	471530
level1	KE_1_041	2009	secondary	100596
level1	KE_1_041	2009	tertiary	12358
level1	KE_1_041	2009	university	4967
level1	KE_1_041	2009	youth polytechnic	1367
level1	KE_1_001	2009	basic literacy	2705
level1	KE_1_001	2009	madrassa	4431
level1	KE_1_001	2009	none	84459
level1	KE_1_001	2009	pre-primary	59153
level1	KE_1_001	2009	primary	384904
level1	KE_1_001	2009	secondary	226497
level1	KE_1_001	2009	tertiary	56992
level1	KE_1_001	2009	university	20239
level1	KE_1_001	2009	youth polytechnic	6844
level1	KE_1_003	2009	basic literacy	1638
level1	KE_1_003	2009	madrassa	1606
level1	KE_1_003	2009	none	249459
level1	KE_1_003	2009	pre-primary	106855
level1	KE_1_003	2009	primary	505502
level1	KE_1_003	2009	secondary	96901
level1	KE_1_003	2009	tertiary	17830
level1	KE_1_003	2009	university	5475
level1	KE_1_003	2009	youth polytechnic	2978
level1	KE_1_004	2009	basic literacy	316
level1	KE_1_004	2009	madrassa	4046
level1	KE_1_004	2009	none	98600
level1	KE_1_004	2009	pre-primary	16129
level1	KE_1_004	2009	primary	77008
level1	KE_1_004	2009	secondary	11941
level1	KE_1_004	2009	tertiary	1773
level1	KE_1_004	2009	university	336
level1	KE_1_004	2009	youth polytechnic	261
level1	KE_1_006	2009	basic literacy	1004
level1	KE_1_006	2009	madrassa	293
level1	KE_1_006	2009	none	30876
level1	KE_1_006	2009	pre-primary	16611
level1	KE_1_006	2009	primary	151123
level1	KE_1_006	2009	secondary	40858
level1	KE_1_006	2009	tertiary	8478
level1	KE_1_006	2009	university	1776
level1	KE_1_006	2009	youth polytechnic	3917
level1	KE_1_008	2009	basic literacy	213
level1	KE_1_008	2009	madrassa	62342
level1	KE_1_008	2009	none	399405
level1	KE_1_008	2009	pre-primary	6177
level1	KE_1_008	2009	primary	118167
level1	KE_1_008	2009	secondary	20917
level1	KE_1_008	2009	tertiary	2174
level1	KE_1_008	2009	university	1311
level1	KE_1_008	2009	youth polytechnic	164
level1	KE_1_013	2009	basic literacy	145
level1	KE_1_013	2009	madrassa	7
level1	KE_1_013	2009	none	21263
level1	KE_1_013	2009	pre-primary	6519
level1	KE_1_013	2009	primary	74126
level1	KE_1_013	2009	secondary	11148
level1	KE_1_013	2009	tertiary	2290
level1	KE_1_013	2009	university	522
level1	KE_1_013	2009	youth polytechnic	1482
level1	KE_1_025	2009	basic literacy	303
level1	KE_1_025	2009	madrassa	10
level1	KE_1_025	2009	none	117716
level1	KE_1_025	2009	pre-primary	16489
level1	KE_1_025	2009	primary	50422
level1	KE_1_025	2009	secondary	9428
level1	KE_1_025	2009	tertiary	2270
level1	KE_1_025	2009	university	666
level1	KE_1_025	2009	youth polytechnic	291
country	KE	2009	basic literacy	136660
country	KE	2009	madrassa	469842
country	KE	2009	none	12983950
country	KE	2009	pre-primary	4630064
country	KE	2009	primary	35652860
country	KE	2009	secondary	12168640
country	KE	2009	tertiary	2370860
country	KE	2009	university	1052604
country	KE	2009	youth polytechnic	323408
\.


--
-- Name: highest_education_level_reached pk_highest_education_level_reached; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.highest_education_level_reached
    ADD CONSTRAINT pk_highest_education_level_reached PRIMARY KEY (geo_level, geo_code, geo_version, highest_education_level_reached);


--
-- PostgreSQL database dump complete
--

