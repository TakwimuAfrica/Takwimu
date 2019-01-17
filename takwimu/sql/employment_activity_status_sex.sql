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

ALTER TABLE IF EXISTS ONLY public.employment_activity_status_sex DROP CONSTRAINT IF EXISTS pk_employment_activity_status_sex;
DROP TABLE IF EXISTS public.employment_activity_status_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: employment_activity_status_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employment_activity_status_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    employment_activity_status character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: employment_activity_status_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.employment_activity_status_sex (geo_level, geo_code, geo_version, employment_activity_status, sex, total) FROM stdin;
level1	KE_1_045	2009	employed	female	306267
level1	KE_1_045	2009	economically inactive	female	209595
level1	KE_1_045	2009	economically inactive	male	205434
level1	KE_1_045	2009	employed	male	251369
level1	KE_1_045	2009	employment unclassified	female	25394
level1	KE_1_045	2009	employment unclassified	male	24462
level1	KE_1_045	2009	seeking work / no work available	female	12455
level1	KE_1_045	2009	seeking work / no work available	male	12387
level1	KE_1_007	2009	economically inactive	female	91650
level1	KE_1_007	2009	economically inactive	male	60952
level1	KE_1_007	2009	employed	female	45518
level1	KE_1_007	2009	employed	male	87187
level1	KE_1_007	2009	employment unclassified	female	31600
level1	KE_1_007	2009	employment unclassified	male	35682
level1	KE_1_007	2009	seeking work / no work available	female	75506
level1	KE_1_007	2009	seeking work / no work available	male	100900
level1	KE_1_011	2009	economically inactive	female	29580
level1	KE_1_011	2009	economically inactive	male	19773
level1	KE_1_011	2009	employed	female	21966
level1	KE_1_011	2009	employed	male	32430
level1	KE_1_011	2009	employment unclassified	female	2469
level1	KE_1_011	2009	employment unclassified	male	2995
level1	KE_1_011	2009	seeking work / no work available	female	4011
level1	KE_1_011	2009	seeking work / no work available	male	5232
level1	KE_1_014	2009	economically inactive	female	75339
level1	KE_1_014	2009	economically inactive	male	60169
level1	KE_1_014	2009	employed	female	135987
level1	KE_1_014	2009	employed	male	141061
level1	KE_1_014	2009	employment unclassified	female	7865
level1	KE_1_014	2009	employment unclassified	male	7962
level1	KE_1_014	2009	seeking work / no work available	female	9240
level1	KE_1_014	2009	seeking work / no work available	male	10148
level1	KE_1_020	2009	economically inactive	female	77475
level1	KE_1_020	2009	economically inactive	male	70180
level1	KE_1_020	2009	employed	female	149981
level1	KE_1_020	2009	employed	male	148860
level1	KE_1_020	2009	employment unclassified	female	5775
level1	KE_1_020	2009	employment unclassified	male	5414
level1	KE_1_020	2009	seeking work / no work available	female	5059
level1	KE_1_020	2009	seeking work / no work available	male	5318
level1	KE_1_040	2009	economically inactive	female	107984
level1	KE_1_040	2009	economically inactive	male	95308
level1	KE_1_040	2009	employed	female	181388
level1	KE_1_040	2009	employed	male	162143
level1	KE_1_040	2009	employment unclassified	female	18700
level1	KE_1_040	2009	employment unclassified	male	18340
level1	KE_1_040	2009	seeking work / no work available	female	12672
level1	KE_1_040	2009	seeking work / no work available	male	11805
level1	KE_1_022	2009	economically inactive	female	346243
level1	KE_1_022	2009	economically inactive	male	249589
level1	KE_1_022	2009	employed	female	334977
level1	KE_1_022	2009	employed	male	409108
level1	KE_1_022	2009	employment unclassified	female	19188
level1	KE_1_022	2009	employment unclassified	male	17438
level1	KE_1_022	2009	seeking work / no work available	female	38958
level1	KE_1_022	2009	seeking work / no work available	male	42702
level1	KE_1_028	2009	economically inactive	female	79831
level1	KE_1_028	2009	economically inactive	male	61120
level1	KE_1_028	2009	employed	female	62897
level1	KE_1_028	2009	employed	male	75895
level1	KE_1_028	2009	employment unclassified	female	7927
level1	KE_1_028	2009	employment unclassified	male	8073
level1	KE_1_028	2009	seeking work / no work available	female	5095
level1	KE_1_028	2009	seeking work / no work available	male	7481
level1	KE_1_030	2009	economically inactive	female	121166
level1	KE_1_030	2009	economically inactive	male	89656
level1	KE_1_030	2009	employed	female	84223
level1	KE_1_030	2009	employed	male	106126
level1	KE_1_030	2009	employment unclassified	female	12437
level1	KE_1_030	2009	employment unclassified	male	18154
level1	KE_1_030	2009	seeking work / no work available	female	13576
level1	KE_1_030	2009	seeking work / no work available	male	16772
level1	KE_1_034	2009	economically inactive	female	156840
level1	KE_1_034	2009	economically inactive	male	105132
level1	KE_1_034	2009	employed	female	100033
level1	KE_1_034	2009	employed	male	148926
level1	KE_1_034	2009	employment unclassified	female	10263
level1	KE_1_034	2009	employment unclassified	male	9936
level1	KE_1_034	2009	seeking work / no work available	female	19257
level1	KE_1_034	2009	seeking work / no work available	male	21042
level1	KE_1_035	2009	economically inactive	female	100699
level1	KE_1_035	2009	economically inactive	male	91281
level1	KE_1_035	2009	employed	female	127056
level1	KE_1_035	2009	employed	male	139723
level1	KE_1_035	2009	employment unclassified	female	9770
level1	KE_1_035	2009	employment unclassified	male	9790
level1	KE_1_035	2009	seeking work / no work available	female	7534
level1	KE_1_035	2009	seeking work / no work available	male	8223
level1	KE_1_036	2009	economically inactive	female	151105
level1	KE_1_036	2009	economically inactive	male	144033
level1	KE_1_036	2009	employed	female	202342
level1	KE_1_036	2009	employed	male	197820
level1	KE_1_036	2009	employment unclassified	female	16505
level1	KE_1_036	2009	employment unclassified	male	16581
level1	KE_1_036	2009	seeking work / no work available	female	6207
level1	KE_1_036	2009	seeking work / no work available	male	7605
level1	KE_1_037	2009	economically inactive	female	281467
level1	KE_1_037	2009	economically inactive	male	242050
level1	KE_1_037	2009	employed	female	359333
level1	KE_1_037	2009	employed	male	338187
level1	KE_1_037	2009	employment unclassified	female	35149
level1	KE_1_037	2009	employment unclassified	male	34657
level1	KE_1_037	2009	seeking work / no work available	female	36492
level1	KE_1_037	2009	seeking work / no work available	male	37125
level1	KE_1_039	2009	economically inactive	female	209865
level1	KE_1_039	2009	economically inactive	male	191291
level1	KE_1_039	2009	employed	female	323073
level1	KE_1_039	2009	employed	male	308149
level1	KE_1_039	2009	employment unclassified	female	27697
level1	KE_1_039	2009	employment unclassified	male	27236
level1	KE_1_039	2009	seeking work / no work available	female	18116
level1	KE_1_039	2009	seeking work / no work available	male	17991
level1	KE_1_043	2009	economically inactive	female	161767
level1	KE_1_043	2009	economically inactive	male	147037
level1	KE_1_043	2009	employed	female	207466
level1	KE_1_043	2009	employed	male	185908
level1	KE_1_043	2009	employment unclassified	female	20433
level1	KE_1_043	2009	employment unclassified	male	19889
level1	KE_1_043	2009	seeking work / no work available	female	23429
level1	KE_1_043	2009	seeking work / no work available	male	20313
level1	KE_1_002	2009	economically inactive	female	156110
level1	KE_1_002	2009	economically inactive	male	111685
level1	KE_1_002	2009	employed	female	93362
level1	KE_1_002	2009	employed	male	113403
level1	KE_1_002	2009	employment unclassified	female	7525
level1	KE_1_002	2009	employment unclassified	male	7314
level1	KE_1_002	2009	seeking work / no work available	female	17473
level1	KE_1_002	2009	seeking work / no work available	male	22630
level1	KE_1_005	2009	economically inactive	female	18395
level1	KE_1_005	2009	economically inactive	male	10593
level1	KE_1_005	2009	employed	female	17711
level1	KE_1_005	2009	employed	male	28331
level1	KE_1_005	2009	employment unclassified	female	2887
level1	KE_1_005	2009	employment unclassified	male	3212
level1	KE_1_005	2009	seeking work / no work available	female	1476
level1	KE_1_005	2009	seeking work / no work available	male	2096
level1	KE_1_009	2009	economically inactive	female	178676
level1	KE_1_009	2009	economically inactive	male	154258
level1	KE_1_009	2009	employed	female	112641
level1	KE_1_009	2009	employed	male	194734
level1	KE_1_009	2009	employment unclassified	female	30135
level1	KE_1_009	2009	employment unclassified	male	35942
level1	KE_1_009	2009	seeking work / no work available	female	72459
level1	KE_1_009	2009	seeking work / no work available	male	99972
level1	KE_1_010	2009	economically inactive	female	56360
level1	KE_1_010	2009	economically inactive	male	30986
level1	KE_1_010	2009	employed	female	42275
level1	KE_1_010	2009	employed	male	71951
level1	KE_1_010	2009	employment unclassified	female	10221
level1	KE_1_010	2009	employment unclassified	male	11437
level1	KE_1_010	2009	seeking work / no work available	female	8610
level1	KE_1_010	2009	seeking work / no work available	male	11929
level1	KE_1_012	2009	economically inactive	female	272712
level1	KE_1_012	2009	economically inactive	male	219699
level1	KE_1_012	2009	employed	female	372542
level1	KE_1_012	2009	employed	male	397306
level1	KE_1_012	2009	employment unclassified	female	26531
level1	KE_1_012	2009	employment unclassified	male	26720
level1	KE_1_012	2009	seeking work / no work available	female	22672
level1	KE_1_012	2009	seeking work / no work available	male	26730
level1	KE_1_015	2009	economically inactive	female	225825
level1	KE_1_015	2009	economically inactive	male	174380
level1	KE_1_015	2009	employed	female	177456
level1	KE_1_015	2009	employed	male	174406
level1	KE_1_015	2009	employment unclassified	female	20681
level1	KE_1_015	2009	employment unclassified	male	19888
level1	KE_1_015	2009	seeking work / no work available	female	26241
level1	KE_1_015	2009	seeking work / no work available	male	27913
level1	KE_1_016	2009	economically inactive	female	259330
level1	KE_1_016	2009	economically inactive	male	187415
level1	KE_1_016	2009	employed	female	182069
level1	KE_1_016	2009	employed	male	230980
level1	KE_1_016	2009	employment unclassified	female	21186
level1	KE_1_016	2009	employment unclassified	male	21008
level1	KE_1_016	2009	seeking work / no work available	female	19147
level1	KE_1_016	2009	seeking work / no work available	male	26349
level1	KE_1_017	2009	economically inactive	female	243658
level1	KE_1_017	2009	economically inactive	male	186066
level1	KE_1_017	2009	employed	female	124015
level1	KE_1_017	2009	employed	male	148453
level1	KE_1_017	2009	employment unclassified	female	10524
level1	KE_1_017	2009	employment unclassified	male	10316
level1	KE_1_017	2009	seeking work / no work available	female	12096
level1	KE_1_017	2009	seeking work / no work available	male	18700
level1	KE_1_021	2009	economically inactive	female	168660
level1	KE_1_021	2009	economically inactive	male	143205
level1	KE_1_021	2009	employed	female	221099
level1	KE_1_021	2009	employed	male	213306
level1	KE_1_021	2009	employment unclassified	female	7661
level1	KE_1_021	2009	employment unclassified	male	7893
level1	KE_1_021	2009	seeking work / no work available	female	9009
level1	KE_1_021	2009	seeking work / no work available	male	12905
level1	KE_1_031	2009	economically inactive	female	78306
level1	KE_1_031	2009	economically inactive	male	59632
level1	KE_1_031	2009	employed	female	73805
level1	KE_1_031	2009	employed	male	85723
level1	KE_1_031	2009	employment unclassified	female	8081
level1	KE_1_031	2009	employment unclassified	male	8277
level1	KE_1_031	2009	seeking work / no work available	female	10838
level1	KE_1_031	2009	seeking work / no work available	male	12970
level1	KE_1_032	2009	economically inactive	female	298773
level1	KE_1_032	2009	economically inactive	male	240432
level1	KE_1_032	2009	employed	female	310256
level1	KE_1_032	2009	employed	male	365594
level1	KE_1_032	2009	employment unclassified	female	26367
level1	KE_1_032	2009	employment unclassified	male	25615
level1	KE_1_032	2009	seeking work / no work available	female	41244
level1	KE_1_032	2009	seeking work / no work available	male	42395
level1	KE_1_042	2009	economically inactive	female	205790
level1	KE_1_042	2009	economically inactive	male	167986
level1	KE_1_042	2009	employed	female	165899
level1	KE_1_042	2009	employed	male	181313
level1	KE_1_042	2009	employment unclassified	female	16431
level1	KE_1_042	2009	employment unclassified	male	15601
level1	KE_1_042	2009	seeking work / no work available	female	24337
level1	KE_1_042	2009	seeking work / no work available	male	22109
level1	KE_1_044	2009	economically inactive	female	143345
level1	KE_1_044	2009	economically inactive	male	135462
level1	KE_1_044	2009	employed	female	208282
level1	KE_1_044	2009	employed	male	189157
level1	KE_1_044	2009	employment unclassified	female	16780
level1	KE_1_044	2009	employment unclassified	male	16268
level1	KE_1_044	2009	seeking work / no work available	female	14664
level1	KE_1_044	2009	seeking work / no work available	male	12405
level1	KE_1_047	2009	economically inactive	female	552949
level1	KE_1_047	2009	economically inactive	male	357700
level1	KE_1_047	2009	employed	female	562550
level1	KE_1_047	2009	employed	male	848679
level1	KE_1_047	2009	employment unclassified	female	80281
level1	KE_1_047	2009	employment unclassified	male	68295
level1	KE_1_047	2009	seeking work / no work available	female	131955
level1	KE_1_047	2009	seeking work / no work available	male	111317
level1	KE_1_006	2009	economically inactive	female	58149
level1	KE_1_006	2009	economically inactive	male	41810
level1	KE_1_006	2009	employed	female	51973
level1	KE_1_006	2009	employed	male	67920
level1	KE_1_006	2009	employment unclassified	female	3931
level1	KE_1_006	2009	employment unclassified	male	4228
level1	KE_1_006	2009	seeking work / no work available	female	4905
level1	KE_1_006	2009	seeking work / no work available	male	6927
level1	KE_1_008	2009	economically inactive	female	92518
level1	KE_1_008	2009	economically inactive	male	74270
level1	KE_1_008	2009	employed	female	73429
level1	KE_1_008	2009	employed	male	122893
level1	KE_1_008	2009	employment unclassified	female	27004
level1	KE_1_008	2009	employment unclassified	male	32387
level1	KE_1_008	2009	seeking work / no work available	female	59853
level1	KE_1_008	2009	seeking work / no work available	male	83840
level1	KE_1_013	2009	economically inactive	female	17968
level1	KE_1_013	2009	economically inactive	male	15543
level1	KE_1_013	2009	employed	female	35735
level1	KE_1_013	2009	employed	male	33639
level1	KE_1_013	2009	employment unclassified	female	1657
level1	KE_1_013	2009	employment unclassified	male	1600
level1	KE_1_013	2009	seeking work / no work available	female	1578
level1	KE_1_013	2009	seeking work / no work available	male	1475
level1	KE_1_018	2009	economically inactive	female	109293
level1	KE_1_018	2009	economically inactive	male	100673
level1	KE_1_018	2009	employed	female	141447
level1	KE_1_018	2009	employed	male	134559
level1	KE_1_018	2009	employment unclassified	female	6878
level1	KE_1_018	2009	employment unclassified	male	6975
level1	KE_1_018	2009	seeking work / no work available	female	5230
level1	KE_1_018	2009	seeking work / no work available	male	6827
level1	KE_1_019	2009	economically inactive	female	133645
level1	KE_1_019	2009	economically inactive	male	108726
level1	KE_1_019	2009	employed	female	167919
level1	KE_1_019	2009	employed	male	173014
level1	KE_1_019	2009	employment unclassified	female	5903
level1	KE_1_019	2009	employment unclassified	male	5824
level1	KE_1_019	2009	seeking work / no work available	female	8319
level1	KE_1_019	2009	seeking work / no work available	male	9914
level1	KE_1_025	2009	economically inactive	female	30840
level1	KE_1_025	2009	economically inactive	male	20012
level1	KE_1_025	2009	employed	female	38202
level1	KE_1_025	2009	employed	male	46446
level1	KE_1_025	2009	employment unclassified	female	12747
level1	KE_1_025	2009	employment unclassified	male	13693
level1	KE_1_025	2009	seeking work / no work available	female	8660
level1	KE_1_025	2009	seeking work / no work available	male	9465
level1	KE_1_023	2009	economically inactive	female	88634
level1	KE_1_023	2009	economically inactive	male	55721
level1	KE_1_023	2009	employed	female	161343
level1	KE_1_023	2009	employed	male	203342
level1	KE_1_023	2009	employment unclassified	female	60866
level1	KE_1_023	2009	employment unclassified	male	72985
level1	KE_1_023	2009	seeking work / no work available	female	43415
level1	KE_1_023	2009	seeking work / no work available	male	51665
level1	KE_1_024	2009	economically inactive	female	87619
level1	KE_1_024	2009	economically inactive	male	66029
level1	KE_1_024	2009	employed	female	95502
level1	KE_1_024	2009	employed	male	108653
level1	KE_1_024	2009	employment unclassified	female	12896
level1	KE_1_024	2009	employment unclassified	male	14171
level1	KE_1_024	2009	seeking work / no work available	female	13453
level1	KE_1_024	2009	seeking work / no work available	male	16001
level1	KE_1_026	2009	economically inactive	female	171479
level1	KE_1_026	2009	economically inactive	male	139081
level1	KE_1_026	2009	employed	female	139432
level1	KE_1_026	2009	employed	male	163549
level1	KE_1_026	2009	employment unclassified	female	10524
level1	KE_1_026	2009	employment unclassified	male	10213
level1	KE_1_026	2009	seeking work / no work available	female	19892
level1	KE_1_026	2009	seeking work / no work available	male	20468
level1	KE_1_027	2009	economically inactive	female	198922
level1	KE_1_027	2009	economically inactive	male	144024
level1	KE_1_027	2009	employed	female	121173
level1	KE_1_027	2009	employed	male	173910
level1	KE_1_027	2009	employment unclassified	female	31220
level1	KE_1_027	2009	employment unclassified	male	29314
level1	KE_1_027	2009	seeking work / no work available	female	24978
level1	KE_1_027	2009	seeking work / no work available	male	28399
level1	KE_1_029	2009	economically inactive	female	157441
level1	KE_1_029	2009	economically inactive	male	124631
level1	KE_1_029	2009	employed	female	133650
level1	KE_1_029	2009	employed	male	162599
level1	KE_1_029	2009	employment unclassified	female	15095
level1	KE_1_029	2009	employment unclassified	male	15403
level1	KE_1_029	2009	seeking work / no work available	female	8771
level1	KE_1_029	2009	seeking work / no work available	male	10505
level1	KE_1_033	2009	economically inactive	female	137235
level1	KE_1_033	2009	economically inactive	male	104109
level1	KE_1_033	2009	employed	female	162664
level1	KE_1_033	2009	employed	male	194267
level1	KE_1_033	2009	employment unclassified	female	24818
level1	KE_1_033	2009	employment unclassified	male	27378
level1	KE_1_033	2009	seeking work / no work available	female	13179
level1	KE_1_033	2009	seeking work / no work available	male	14017
level1	KE_1_038	2009	economically inactive	female	114550
level1	KE_1_038	2009	economically inactive	male	94385
level1	KE_1_038	2009	employed	female	106219
level1	KE_1_038	2009	employed	male	95604
level1	KE_1_038	2009	employment unclassified	female	10870
level1	KE_1_038	2009	employment unclassified	male	10658
level1	KE_1_038	2009	seeking work / no work available	female	17025
level1	KE_1_038	2009	seeking work / no work available	male	17996
level1	KE_1_041	2009	economically inactive	female	141486
level1	KE_1_041	2009	economically inactive	male	123269
level1	KE_1_041	2009	employed	female	198561
level1	KE_1_041	2009	employed	male	172400
level1	KE_1_041	2009	employment unclassified	female	16947
level1	KE_1_041	2009	employment unclassified	male	16195
level1	KE_1_041	2009	seeking work / no work available	female	15002
level1	KE_1_041	2009	seeking work / no work available	male	13483
level1	KE_1_046	2009	economically inactive	female	86652
level1	KE_1_046	2009	economically inactive	male	85942
level1	KE_1_046	2009	employed	female	116913
level1	KE_1_046	2009	employed	male	98750
level1	KE_1_046	2009	employment unclassified	female	6047
level1	KE_1_046	2009	employment unclassified	male	5902
level1	KE_1_046	2009	seeking work / no work available	female	3675
level1	KE_1_046	2009	seeking work / no work available	male	3852
level1	KE_1_001	2009	economically inactive	female	207767
level1	KE_1_001	2009	economically inactive	male	122080
level1	KE_1_001	2009	employed	female	121216
level1	KE_1_001	2009	employed	male	231152
level1	KE_1_001	2009	employment unclassified	female	17087
level1	KE_1_001	2009	employment unclassified	male	14812
level1	KE_1_001	2009	seeking work / no work available	female	39565
level1	KE_1_001	2009	seeking work / no work available	male	44482
level1	KE_1_003	2009	economically inactive	female	249565
level1	KE_1_003	2009	economically inactive	male	180864
level1	KE_1_003	2009	employed	female	172688
level1	KE_1_003	2009	employed	male	196490
level1	KE_1_003	2009	employment unclassified	female	24889
level1	KE_1_003	2009	employment unclassified	male	23518
level1	KE_1_003	2009	seeking work / no work available	female	28974
level1	KE_1_003	2009	seeking work / no work available	male	33962
level1	KE_1_004	2009	economically inactive	female	44495
level1	KE_1_004	2009	economically inactive	male	23198
level1	KE_1_004	2009	employed	female	34930
level1	KE_1_004	2009	employed	male	51451
level1	KE_1_004	2009	employment unclassified	female	7382
level1	KE_1_004	2009	employment unclassified	male	7858
level1	KE_1_004	2009	seeking work / no work available	female	9621
level1	KE_1_004	2009	seeking work / no work available	male	12217
country	KE	2009	economically inactive	female	7187753
country	KE	2009	economically inactive	male	5636871
country	KE	2009	employed	female	7379465
country	KE	2009	employed	male	8406866
country	KE	2009	employment unclassified	female	833224
country	KE	2009	employment unclassified	male	847509
country	KE	2009	seeking work / no work available	female	1025923
country	KE	2009	seeking work / no work available	male	1160959
\.


--
-- Name: employment_activity_status_sex pk_employment_activity_status_sex; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employment_activity_status_sex
    ADD CONSTRAINT pk_employment_activity_status_sex PRIMARY KEY (geo_level, geo_code, geo_version, employment_activity_status, sex);


--
-- PostgreSQL database dump complete
--

