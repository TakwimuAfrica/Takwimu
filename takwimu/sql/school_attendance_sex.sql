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

ALTER TABLE IF EXISTS ONLY public.school_attendance_sex DROP CONSTRAINT IF EXISTS pk_school_attendance_sex;
DROP TABLE IF EXISTS public.school_attendance_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: school_attendance_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.school_attendance_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    school_attendance character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: school_attendance_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.school_attendance_sex (geo_level, geo_code, geo_version, school_attendance, sex, total) FROM stdin;
country	KE	2009	at school	male	14579976
country	KE	2009	left school	male	14149928
country	KE	2009	never attended	male	5317852
country	KE	2009	unspecified	male	774668
country	KE	2009	at school	female	13646608
country	KE	2009	left school	female	14315758
country	KE	2009	never attended	female	6798986
country	KE	2009	unspecified	female	587326
level1	KE_1_002	2009	at school	male	121867
level1	KE_1_002	2009	left school	male	94236
level1	KE_1_002	2009	never attended	male	59303
level1	KE_1_002	2009	unspecified	male	5619
level1	KE_1_002	2009	at school	female	112517
level1	KE_1_002	2009	left school	female	78655
level1	KE_1_002	2009	never attended	female	103738
level1	KE_1_002	2009	unspecified	female	4536
level1	KE_1_003	2009	at school	male	223846
level1	KE_1_003	2009	left school	male	166620
level1	KE_1_003	2009	never attended	male	75632
level1	KE_1_003	2009	unspecified	male	11678
level1	KE_1_003	2009	at school	female	207161
level1	KE_1_003	2009	left school	female	139580
level1	KE_1_003	2009	never attended	female	160240
level1	KE_1_003	2009	unspecified	female	10035
level1	KE_1_005	2009	at school	male	18413
level1	KE_1_005	2009	left school	male	20403
level1	KE_1_005	2009	never attended	male	8152
level1	KE_1_005	2009	unspecified	male	1411
level1	KE_1_005	2009	at school	female	16424
level1	KE_1_005	2009	left school	female	16398
level1	KE_1_005	2009	never attended	female	10275
level1	KE_1_005	2009	unspecified	female	910
level1	KE_1_007	2009	at school	male	84871
level1	KE_1_007	2009	left school	male	29944
level1	KE_1_007	2009	never attended	male	184831
level1	KE_1_007	2009	unspecified	male	9350
level1	KE_1_007	2009	at school	female	57967
level1	KE_1_007	2009	left school	female	18269
level1	KE_1_007	2009	never attended	female	181825
level1	KE_1_007	2009	unspecified	female	6721
level1	KE_1_009	2009	at school	male	191251
level1	KE_1_009	2009	left school	male	39629
level1	KE_1_009	2009	never attended	male	284712
level1	KE_1_009	2009	unspecified	male	7371
level1	KE_1_009	2009	at school	female	135154
level1	KE_1_009	2009	left school	female	23368
level1	KE_1_009	2009	never attended	female	265814
level1	KE_1_009	2009	unspecified	female	5085
level1	KE_1_010	2009	at school	male	40742
level1	KE_1_010	2009	left school	male	15698
level1	KE_1_010	2009	never attended	male	78596
level1	KE_1_010	2009	unspecified	male	2730
level1	KE_1_010	2009	at school	female	33918
level1	KE_1_010	2009	left school	female	9586
level1	KE_1_010	2009	never attended	female	82752
level1	KE_1_010	2009	unspecified	female	1384
level1	KE_1_011	2009	at school	male	23221
level1	KE_1_011	2009	left school	male	16982
level1	KE_1_011	2009	never attended	male	24643
level1	KE_1_011	2009	unspecified	male	1835
level1	KE_1_011	2009	at school	female	20948
level1	KE_1_011	2009	left school	female	12996
level1	KE_1_011	2009	never attended	female	28452
level1	KE_1_011	2009	unspecified	female	781
level1	KE_1_012	2009	at school	male	270391
level1	KE_1_012	2009	left school	male	346260
level1	KE_1_012	2009	never attended	male	86133
level1	KE_1_012	2009	unspecified	male	17947
level1	KE_1_012	2009	at school	female	270674
level1	KE_1_012	2009	left school	female	338970
level1	KE_1_012	2009	never attended	female	117716
level1	KE_1_012	2009	unspecified	female	13754
level1	KE_1_014	2009	at school	male	90118
level1	KE_1_014	2009	left school	male	120224
level1	KE_1_014	2009	never attended	male	19457
level1	KE_1_014	2009	unspecified	male	5114
level1	KE_1_014	2009	at school	female	89150
level1	KE_1_014	2009	left school	female	118331
level1	KE_1_014	2009	never attended	female	31447
level1	KE_1_014	2009	unspecified	female	3895
level1	KE_1_015	2009	at school	male	214922
level1	KE_1_015	2009	left school	male	148151
level1	KE_1_015	2009	never attended	male	61923
level1	KE_1_015	2009	unspecified	male	7734
level1	KE_1_015	2009	at school	female	207249
level1	KE_1_015	2009	left school	female	171827
level1	KE_1_015	2009	never attended	female	99252
level1	KE_1_015	2009	unspecified	female	5277
level1	KE_1_016	2009	at school	male	212080
level1	KE_1_016	2009	left school	male	243109
level1	KE_1_016	2009	never attended	male	35574
level1	KE_1_016	2009	unspecified	male	8508
level1	KE_1_016	2009	at school	female	199404
level1	KE_1_016	2009	left school	female	250784
level1	KE_1_016	2009	never attended	female	55578
level1	KE_1_016	2009	unspecified	female	6301
level1	KE_1_017	2009	at school	male	187877
level1	KE_1_017	2009	left school	male	161764
level1	KE_1_017	2009	never attended	male	37005
level1	KE_1_017	2009	unspecified	male	6320
level1	KE_1_017	2009	at school	female	177951
level1	KE_1_017	2009	left school	female	177543
level1	KE_1_017	2009	never attended	female	57343
level1	KE_1_017	2009	unspecified	female	4009
level1	KE_1_018	2009	at school	male	123517
level1	KE_1_018	2009	left school	male	125212
level1	KE_1_018	2009	never attended	male	15650
level1	KE_1_018	2009	unspecified	male	3653
level1	KE_1_018	2009	at school	female	118192
level1	KE_1_018	2009	left school	female	133197
level1	KE_1_018	2009	never attended	female	26387
level1	KE_1_018	2009	unspecified	female	3222
level1	KE_1_020	2009	at school	male	85265
level1	KE_1_020	2009	left school	male	140821
level1	KE_1_020	2009	never attended	male	13709
level1	KE_1_020	2009	unspecified	male	3608
level1	KE_1_020	2009	at school	female	82572
level1	KE_1_020	2009	left school	female	137731
level1	KE_1_020	2009	never attended	female	27844
level1	KE_1_020	2009	unspecified	female	2330
level1	KE_1_040	2009	at school	male	156476
level1	KE_1_040	2009	left school	male	116293
level1	KE_1_040	2009	never attended	male	35187
level1	KE_1_040	2009	unspecified	male	8596
level1	KE_1_040	2009	at school	female	148301
level1	KE_1_040	2009	left school	female	132907
level1	KE_1_040	2009	never attended	female	59575
level1	KE_1_040	2009	unspecified	female	7312
level1	KE_1_021	2009	at school	male	163644
level1	KE_1_021	2009	left school	male	206083
level1	KE_1_021	2009	never attended	male	25445
level1	KE_1_021	2009	unspecified	male	6179
level1	KE_1_021	2009	at school	female	155549
level1	KE_1_021	2009	left school	female	221178
level1	KE_1_021	2009	never attended	female	46992
level1	KE_1_021	2009	unspecified	female	5019
level1	KE_1_022	2009	at school	male	286280
level1	KE_1_022	2009	left school	male	436421
level1	KE_1_022	2009	never attended	male	31046
level1	KE_1_022	2009	unspecified	male	10298
level1	KE_1_022	2009	at school	female	283008
level1	KE_1_022	2009	left school	female	436749
level1	KE_1_022	2009	never attended	female	53833
level1	KE_1_022	2009	unspecified	female	9288
level1	KE_1_028	2009	at school	male	82359
level1	KE_1_028	2009	left school	male	63332
level1	KE_1_028	2009	never attended	male	16867
level1	KE_1_028	2009	unspecified	male	2774
level1	KE_1_028	2009	at school	female	79688
level1	KE_1_028	2009	left school	female	63509
level1	KE_1_028	2009	never attended	female	22608
level1	KE_1_028	2009	unspecified	female	2575
level1	KE_1_029	2009	at school	male	159912
level1	KE_1_029	2009	left school	male	147090
level1	KE_1_029	2009	never attended	male	25949
level1	KE_1_029	2009	unspecified	male	6296
level1	KE_1_029	2009	at school	female	152881
level1	KE_1_029	2009	left school	female	147118
level1	KE_1_029	2009	never attended	female	34849
level1	KE_1_029	2009	unspecified	female	5465
level1	KE_1_030	2009	at school	male	111827
level1	KE_1_030	2009	left school	male	71451
level1	KE_1_030	2009	never attended	male	64688
level1	KE_1_030	2009	unspecified	male	3808
level1	KE_1_030	2009	at school	female	105437
level1	KE_1_030	2009	left school	female	70993
level1	KE_1_030	2009	never attended	female	71016
level1	KE_1_030	2009	unspecified	female	2967
level1	KE_1_031	2009	at school	male	75202
level1	KE_1_031	2009	left school	male	78029
level1	KE_1_031	2009	never attended	male	23345
level1	KE_1_031	2009	unspecified	male	4817
level1	KE_1_031	2009	at school	female	70751
level1	KE_1_031	2009	left school	female	76011
level1	KE_1_031	2009	never attended	female	34000
level1	KE_1_031	2009	unspecified	female	2901
level1	KE_1_032	2009	at school	male	318392
level1	KE_1_032	2009	left school	male	345560
level1	KE_1_032	2009	never attended	male	51628
level1	KE_1_032	2009	unspecified	male	15948
level1	KE_1_032	2009	at school	female	300742
level1	KE_1_032	2009	left school	female	343244
level1	KE_1_032	2009	never attended	female	72949
level1	KE_1_032	2009	unspecified	female	10846
level1	KE_1_033	2009	at school	male	157552
level1	KE_1_033	2009	left school	male	114296
level1	KE_1_033	2009	never attended	male	94955
level1	KE_1_033	2009	unspecified	male	10761
level1	KE_1_033	2009	at school	female	138785
level1	KE_1_033	2009	left school	female	101282
level1	KE_1_033	2009	never attended	female	124728
level1	KE_1_033	2009	unspecified	female	7677
level1	KE_1_034	2009	at school	male	119125
level1	KE_1_034	2009	left school	male	127006
level1	KE_1_034	2009	never attended	male	57831
level1	KE_1_034	2009	unspecified	male	7413
level1	KE_1_034	2009	at school	female	110961
level1	KE_1_034	2009	left school	female	113589
level1	KE_1_034	2009	never attended	female	80594
level1	KE_1_034	2009	unspecified	female	4204
level1	KE_1_035	2009	at school	male	124769
level1	KE_1_035	2009	left school	male	120947
level1	KE_1_035	2009	never attended	male	18477
level1	KE_1_035	2009	unspecified	male	6290
level1	KE_1_035	2009	at school	female	116375
level1	KE_1_035	2009	left school	female	116015
level1	KE_1_035	2009	never attended	female	27234
level1	KE_1_035	2009	unspecified	female	4817
level1	KE_1_036	2009	at school	male	195328
level1	KE_1_036	2009	left school	male	164091
level1	KE_1_036	2009	never attended	male	29742
level1	KE_1_036	2009	unspecified	male	8706
level1	KE_1_036	2009	at school	female	183299
level1	KE_1_036	2009	left school	female	170290
level1	KE_1_036	2009	never attended	female	44822
level1	KE_1_036	2009	unspecified	female	8193
level1	KE_1_037	2009	at school	male	333524
level1	KE_1_037	2009	left school	male	284668
level1	KE_1_037	2009	never attended	male	77912
level1	KE_1_037	2009	unspecified	male	17310
level1	KE_1_037	2009	at school	female	325039
level1	KE_1_037	2009	left school	female	321980
level1	KE_1_037	2009	never attended	female	110074
level1	KE_1_037	2009	unspecified	female	14562
level1	KE_1_039	2009	at school	male	298735
level1	KE_1_039	2009	left school	male	230738
level1	KE_1_039	2009	never attended	male	55238
level1	KE_1_039	2009	unspecified	male	11858
level1	KE_1_039	2009	at school	female	284434
level1	KE_1_039	2009	left school	female	263111
level1	KE_1_039	2009	never attended	female	70870
level1	KE_1_039	2009	unspecified	female	10888
level1	KE_1_042	2009	at school	male	203863
level1	KE_1_042	2009	left school	male	185579
level1	KE_1_042	2009	never attended	male	22354
level1	KE_1_042	2009	unspecified	male	13580
level1	KE_1_042	2009	at school	female	192916
level1	KE_1_042	2009	left school	female	202528
level1	KE_1_042	2009	never attended	female	42216
level1	KE_1_042	2009	unspecified	female	7958
level1	KE_1_043	2009	at school	male	225500
level1	KE_1_043	2009	left school	male	150338
level1	KE_1_043	2009	never attended	male	24705
level1	KE_1_043	2009	unspecified	male	8574
level1	KE_1_043	2009	at school	female	202153
level1	KE_1_043	2009	left school	female	188355
level1	KE_1_043	2009	never attended	female	49350
level1	KE_1_043	2009	unspecified	female	8702
level1	KE_1_044	2009	at school	male	209890
level1	KE_1_044	2009	left school	male	142722
level1	KE_1_044	2009	never attended	male	28076
level1	KE_1_044	2009	unspecified	male	9238
level1	KE_1_044	2009	at school	female	190347
level1	KE_1_044	2009	left school	female	170717
level1	KE_1_044	2009	never attended	female	48939
level1	KE_1_044	2009	unspecified	female	8557
level1	KE_1_045	2009	at school	male	278075
level1	KE_1_045	2009	left school	male	213054
level1	KE_1_045	2009	never attended	male	35868
level1	KE_1_045	2009	unspecified	male	12197
level1	KE_1_045	2009	at school	female	261919
level1	KE_1_045	2009	left school	female	259422
level1	KE_1_045	2009	never attended	female	64583
level1	KE_1_045	2009	unspecified	female	11741
level1	KE_1_046	2009	at school	male	104631
level1	KE_1_046	2009	left school	male	89613
level1	KE_1_046	2009	never attended	male	13706
level1	KE_1_046	2009	unspecified	male	3152
level1	KE_1_046	2009	at school	female	99258
level1	KE_1_046	2009	left school	female	104435
level1	KE_1_046	2009	never attended	female	22252
level1	KE_1_046	2009	unspecified	female	3304
level1	KE_1_047	2009	at school	male	484427
level1	KE_1_047	2009	left school	male	898849
level1	KE_1_047	2009	never attended	male	58191
level1	KE_1_047	2009	unspecified	male	38858
level1	KE_1_047	2009	at school	female	487872
level1	KE_1_047	2009	left school	female	821743
level1	KE_1_047	2009	never attended	female	72550
level1	KE_1_047	2009	unspecified	female	27302
level1	KE_1_004	2009	at school	male	36950
level1	KE_1_004	2009	left school	male	24632
level1	KE_1_004	2009	never attended	male	41606
level1	KE_1_004	2009	unspecified	male	1874
level1	KE_1_004	2009	at school	female	30439
level1	KE_1_004	2009	left school	female	19622
level1	KE_1_004	2009	never attended	female	54593
level1	KE_1_004	2009	unspecified	female	1438
level1	KE_1_006	2009	at school	male	51013
level1	KE_1_006	2009	left school	male	64912
level1	KE_1_006	2009	never attended	male	11038
level1	KE_1_006	2009	unspecified	male	6933
level1	KE_1_006	2009	at school	female	48372
level1	KE_1_006	2009	left school	female	59282
level1	KE_1_006	2009	never attended	female	17187
level1	KE_1_006	2009	unspecified	female	3256
level1	KE_1_008	2009	at school	male	99266
level1	KE_1_008	2009	left school	male	29665
level1	KE_1_008	2009	never attended	male	203669
level1	KE_1_008	2009	unspecified	male	6481
level1	KE_1_008	2009	at school	female	66236
level1	KE_1_008	2009	left school	female	16005
level1	KE_1_008	2009	never attended	female	189056
level1	KE_1_008	2009	unspecified	female	3802
level1	KE_1_013	2009	at school	male	25395
level1	KE_1_013	2009	left school	male	22532
level1	KE_1_013	2009	never attended	male	7848
level1	KE_1_013	2009	unspecified	male	775
level1	KE_1_013	2009	at school	female	25098
level1	KE_1_013	2009	left school	female	23094
level1	KE_1_013	2009	never attended	female	12256
level1	KE_1_013	2009	unspecified	female	729
level1	KE_1_019	2009	at school	male	125874
level1	KE_1_019	2009	left school	male	172081
level1	KE_1_019	2009	never attended	male	13014
level1	KE_1_019	2009	unspecified	male	5916
level1	KE_1_019	2009	at school	female	120154
level1	KE_1_019	2009	left school	female	183327
level1	KE_1_019	2009	never attended	female	24983
level1	KE_1_019	2009	unspecified	female	3409
level1	KE_1_025	2009	at school	male	31103
level1	KE_1_025	2009	left school	male	13646
level1	KE_1_025	2009	never attended	male	52707
level1	KE_1_025	2009	unspecified	male	2116
level1	KE_1_025	2009	at school	female	25014
level1	KE_1_025	2009	left school	female	9974
level1	KE_1_025	2009	never attended	female	63516
level1	KE_1_025	2009	unspecified	female	1092
level1	KE_1_023	2009	at school	male	74742
level1	KE_1_023	2009	left school	male	23498
level1	KE_1_023	2009	never attended	male	305995
level1	KE_1_023	2009	unspecified	male	10031
level1	KE_1_023	2009	at school	female	58804
level1	KE_1_023	2009	left school	female	17211
level1	KE_1_023	2009	never attended	female	297540
level1	KE_1_023	2009	unspecified	female	7564
level1	KE_1_024	2009	at school	male	82804
level1	KE_1_024	2009	left school	male	39942
level1	KE_1_024	2009	never attended	male	98870
level1	KE_1_024	2009	unspecified	male	3995
level1	KE_1_024	2009	at school	female	75523
level1	KE_1_024	2009	left school	female	35690
level1	KE_1_024	2009	never attended	female	114560
level1	KE_1_024	2009	unspecified	female	3617
level1	KE_1_026	2009	at school	male	168612
level1	KE_1_026	2009	left school	male	148491
level1	KE_1_026	2009	never attended	male	39269
level1	KE_1_026	2009	unspecified	male	8003
level1	KE_1_026	2009	at school	female	161152
level1	KE_1_026	2009	left school	female	153592
level1	KE_1_026	2009	never attended	female	49323
level1	KE_1_026	2009	unspecified	female	5851
level1	KE_1_027	2009	at school	male	186421
level1	KE_1_027	2009	left school	male	180459
level1	KE_1_027	2009	never attended	male	27666
level1	KE_1_027	2009	unspecified	male	13308
level1	KE_1_027	2009	at school	female	181150
level1	KE_1_027	2009	left school	female	177522
level1	KE_1_027	2009	never attended	female	36404
level1	KE_1_027	2009	unspecified	female	9694
level1	KE_1_038	2009	at school	male	113537
level1	KE_1_038	2009	left school	male	97565
level1	KE_1_038	2009	never attended	male	21596
level1	KE_1_038	2009	unspecified	male	4129
level1	KE_1_038	2009	at school	female	112411
level1	KE_1_038	2009	left school	female	119387
level1	KE_1_038	2009	never attended	female	30446
level1	KE_1_038	2009	unspecified	female	4078
level1	KE_1_041	2009	at school	male	171257
level1	KE_1_041	2009	left school	male	145636
level1	KE_1_041	2009	never attended	male	30181
level1	KE_1_041	2009	unspecified	male	8267
level1	KE_1_041	2009	at school	female	159208
level1	KE_1_041	2009	left school	female	173592
level1	KE_1_041	2009	never attended	female	60846
level1	KE_1_041	2009	unspecified	female	7182
level1	KE_1_001	2009	at school	male	145122
level1	KE_1_001	2009	left school	male	256692
level1	KE_1_001	2009	never attended	male	28937
level1	KE_1_001	2009	unspecified	male	15975
level1	KE_1_001	2009	at school	female	140747
level1	KE_1_001	2009	left school	female	217170
level1	KE_1_001	2009	never attended	female	46086
level1	KE_1_001	2009	unspecified	female	9433
\.


--
-- Name: school_attendance_sex pk_school_attendance_sex; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.school_attendance_sex
    ADD CONSTRAINT pk_school_attendance_sex PRIMARY KEY (geo_level, geo_code, geo_version, school_attendance, sex);


--
-- PostgreSQL database dump complete
--

