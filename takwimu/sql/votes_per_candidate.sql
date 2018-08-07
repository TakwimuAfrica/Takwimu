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

ALTER TABLE IF EXISTS ONLY public.votes_per_candidate DROP CONSTRAINT IF EXISTS pk_votes_per_candidate;
DROP TABLE IF EXISTS public.votes_per_candidate;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: votes_per_candidate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.votes_per_candidate (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    candidate character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: votes_per_candidate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.votes_per_candidate (geo_level, geo_code, geo_version, candidate, total) FROM stdin;
level1	NG_1_001	2009	AA	315
level1	NG_1_002	2009	AA	495
level1	NG_1_003	2009	AA	1600
level1	NG_1_004	2009	AA	547
level1	NG_1_005	2009	AA	131
level1	NG_1_006	2009	AA	45
level1	NG_1_007	2009	AA	315
level1	NG_1_008	2009	AA	145
level1	NG_1_009	2009	AA	279
level1	NG_1_010	2009	AA	1473
level1	NG_1_011	2009	AA	426
level1	NG_1_012	2009	AA	159
level1	NG_1_013	2009	AA	94
level1	NG_1_014	2009	AA	441
level1	NG_1_016	2009	AA	104
level1	NG_1_017	2009	AA	533
level1	NG_1_018	2009	AA	394
level1	NG_1_019	2009	AA	218
level1	NG_1_020	2009	AA	426
level1	NG_1_021	2009	AA	183
level1	NG_1_022	2009	AA	214
level1	NG_1_023	2009	AA	700
level1	NG_1_024	2009	AA	248
level1	NG_1_025	2009	AA	1795
level1	NG_1_026	2009	AA	40
level1	NG_1_027	2009	AA	307
level1	NG_1_028	2009	AA	584
level1	NG_1_029	2009	AA	386
level1	NG_1_030	2009	AA	377
level1	NG_1_031	2009	AA	6331
level1	NG_1_032	2009	AA	178
level1	NG_1_033	2009	AA	1066
level1	NG_1_034	2009	AA	249
level1	NG_1_035	2009	AA	962
level1	NG_1_036	2009	AA	101
level1	NG_1_037	2009	AA	125
level1	NG_1_015	2009	AA	139
level1	NG_1_001	2009	ACPN	2194
level1	NG_1_002	2009	ACPN	1166
level1	NG_1_003	2009	ACPN	443
level1	NG_1_004	2009	ACPN	1259
level1	NG_1_005	2009	ACPN	232
level1	NG_1_006	2009	ACPN	38
level1	NG_1_007	2009	ACPN	1464
level1	NG_1_008	2009	ACPN	243
level1	NG_1_009	2009	ACPN	514
level1	NG_1_010	2009	ACPN	916
level1	NG_1_011	2009	ACPN	1214
level1	NG_1_012	2009	ACPN	1284
level1	NG_1_013	2009	ACPN	538
level1	NG_1_014	2009	ACPN	479
level1	NG_1_016	2009	ACPN	192
level1	NG_1_017	2009	ACPN	956
level1	NG_1_018	2009	ACPN	540
level1	NG_1_019	2009	ACPN	424
level1	NG_1_020	2009	ACPN	778
level1	NG_1_021	2009	ACPN	402
level1	NG_1_022	2009	ACPN	361
level1	NG_1_023	2009	ACPN	1089
level1	NG_1_024	2009	ACPN	817
level1	NG_1_025	2009	ACPN	3038
level1	NG_1_026	2009	ACPN	95
level1	NG_1_027	2009	ACPN	441
level1	NG_1_028	2009	ACPN	3072
level1	NG_1_029	2009	ACPN	2406
level1	NG_1_030	2009	ACPN	1731
level1	NG_1_031	2009	ACPN	8979
level1	NG_1_032	2009	ACPN	391
level1	NG_1_033	2009	ACPN	525
level1	NG_1_034	2009	ACPN	535
level1	NG_1_035	2009	ACPN	811
level1	NG_1_036	2009	ACPN	164
level1	NG_1_037	2009	ACPN	238
level1	NG_1_015	2009	ACPN	342
level1	NG_1_001	2009	AD	448
level1	NG_1_002	2009	AD	595
level1	NG_1_003	2009	AD	474
level1	NG_1_004	2009	AD	475
level1	NG_1_005	2009	AD	173
level1	NG_1_006	2009	AD	69
level1	NG_1_007	2009	AD	254
level1	NG_1_008	2009	AD	392
level1	NG_1_009	2009	AD	709
level1	NG_1_010	2009	AD	735
level1	NG_1_011	2009	AD	1133
level1	NG_1_012	2009	AD	450
level1	NG_1_013	2009	AD	854
level1	NG_1_014	2009	AD	269
level1	NG_1_016	2009	AD	169
level1	NG_1_017	2009	AD	757
level1	NG_1_018	2009	AD	587
level1	NG_1_019	2009	AD	273
level1	NG_1_020	2009	AD	708
level1	NG_1_021	2009	AD	283
level1	NG_1_022	2009	AD	450
level1	NG_1_023	2009	AD	427
level1	NG_1_024	2009	AD	520
level1	NG_1_025	2009	AD	4453
level1	NG_1_026	2009	AD	74
level1	NG_1_027	2009	AD	403
level1	NG_1_028	2009	AD	1927
level1	NG_1_029	2009	AD	1237
level1	NG_1_030	2009	AD	1667
level1	NG_1_031	2009	AD	6282
level1	NG_1_032	2009	AD	279
level1	NG_1_033	2009	AD	1104
level1	NG_1_034	2009	AD	714
level1	NG_1_035	2009	AD	586
level1	NG_1_036	2009	AD	213
level1	NG_1_037	2009	AD	290
level1	NG_1_015	2009	AD	240
level1	NG_1_001	2009	ADC	569
level1	NG_1_002	2009	ADC	1012
level1	NG_1_003	2009	ADC	608
level1	NG_1_004	2009	ADC	534
level1	NG_1_005	2009	ADC	189
level1	NG_1_006	2009	ADC	116
level1	NG_1_007	2009	ADC	539
level1	NG_1_008	2009	ADC	201
level1	NG_1_009	2009	ADC	749
level1	NG_1_010	2009	ADC	888
level1	NG_1_011	2009	ADC	2704
level1	NG_1_012	2009	ADC	512
level1	NG_1_013	2009	ADC	424
level1	NG_1_014	2009	ADC	478
level1	NG_1_016	2009	ADC	247
level1	NG_1_017	2009	ADC	1617
level1	NG_1_018	2009	ADC	375
level1	NG_1_019	2009	ADC	546
level1	NG_1_020	2009	ADC	657
level1	NG_1_021	2009	ADC	498
level1	NG_1_022	2009	ADC	472
level1	NG_1_023	2009	ADC	761
level1	NG_1_024	2009	ADC	438
level1	NG_1_025	2009	ADC	2072
level1	NG_1_026	2009	ADC	105
level1	NG_1_027	2009	ADC	614
level1	NG_1_028	2009	ADC	1364
level1	NG_1_029	2009	ADC	1227
level1	NG_1_030	2009	ADC	937
level1	NG_1_031	2009	ADC	5000
level1	NG_1_032	2009	ADC	406
level1	NG_1_033	2009	ADC	1031
level1	NG_1_034	2009	ADC	762
level1	NG_1_035	2009	ADC	320
level1	NG_1_036	2009	ADC	112
level1	NG_1_037	2009	ADC	294
level1	NG_1_015	2009	ADC	288
level1	NG_1_001	2009	APA	2766
level1	NG_1_002	2009	APA	1549
level1	NG_1_003	2009	APA	384
level1	NG_1_004	2009	APA	2303
level1	NG_1_005	2009	APA	964
level1	NG_1_006	2009	APA	70
level1	NG_1_007	2009	APA	945
level1	NG_1_008	2009	APA	878
level1	NG_1_009	2009	APA	532
level1	NG_1_010	2009	APA	478
level1	NG_1_011	2009	APA	2452
level1	NG_1_012	2009	APA	709
level1	NG_1_013	2009	APA	482
level1	NG_1_014	2009	APA	715
level1	NG_1_016	2009	APA	773
level1	NG_1_017	2009	APA	2236
level1	NG_1_018	2009	APA	2527
level1	NG_1_019	2009	APA	1611
level1	NG_1_020	2009	APA	2770
level1	NG_1_021	2009	APA	1671
level1	NG_1_022	2009	APA	2685
level1	NG_1_023	2009	APA	1001
level1	NG_1_024	2009	APA	1165
level1	NG_1_025	2009	APA	2177
level1	NG_1_026	2009	APA	310
level1	NG_1_027	2009	APA	2006
level1	NG_1_028	2009	APA	1930
level1	NG_1_029	2009	APA	1139
level1	NG_1_030	2009	APA	1306
level1	NG_1_031	2009	APA	4468
level1	NG_1_032	2009	APA	618
level1	NG_1_033	2009	APA	513
level1	NG_1_034	2009	APA	3482
level1	NG_1_035	2009	APA	1306
level1	NG_1_036	2009	APA	632
level1	NG_1_037	2009	APA	1310
level1	NG_1_015	2009	APA	674
level1	NG_1_001	2009	APC	13394
level1	NG_1_002	2009	APC	374701
level1	NG_1_003	2009	APC	58411
level1	NG_1_004	2009	APC	17926
level1	NG_1_005	2009	APC	931598
level1	NG_1_006	2009	APC	5194
level1	NG_1_007	2009	APC	373961
level1	NG_1_008	2009	APC	473543
level1	NG_1_009	2009	APC	28368
level1	NG_1_010	2009	APC	48910
level1	NG_1_011	2009	APC	19518
level1	NG_1_012	2009	APC	208469
level1	NG_1_013	2009	APC	120331
level1	NG_1_014	2009	APC	14157
level1	NG_1_016	2009	APC	361245
level1	NG_1_017	2009	APC	133253
level1	NG_1_018	2009	APC	885988
level1	NG_1_019	2009	APC	1127760
level1	NG_1_020	2009	APC	1903999
level1	NG_1_021	2009	APC	1345441
level1	NG_1_022	2009	APC	567883
level1	NG_1_023	2009	APC	264851
level1	NG_1_024	2009	APC	302146
level1	NG_1_025	2009	APC	792460
level1	NG_1_026	2009	APC	236838
level1	NG_1_027	2009	APC	657678
level1	NG_1_028	2009	APC	308290
level1	NG_1_029	2009	APC	299889
level1	NG_1_030	2009	APC	383603
level1	NG_1_031	2009	APC	528620
level1	NG_1_032	2009	APC	429140
level1	NG_1_033	2009	APC	69238
level1	NG_1_034	2009	APC	671926
level1	NG_1_035	2009	APC	261326
level1	NG_1_036	2009	APC	446265
level1	NG_1_037	2009	APC	612202
level1	NG_1_015	2009	APC	146399
level1	NG_1_001	2009	CPP	1046
level1	NG_1_002	2009	CPP	819
level1	NG_1_003	2009	CPP	412
level1	NG_1_004	2009	CPP	1279
level1	NG_1_005	2009	CPP	391
level1	NG_1_006	2009	CPP	44
level1	NG_1_007	2009	CPP	567
level1	NG_1_008	2009	CPP	310
level1	NG_1_009	2009	CPP	381
level1	NG_1_010	2009	CPP	813
level1	NG_1_011	2009	CPP	2345
level1	NG_1_012	2009	CPP	325
level1	NG_1_013	2009	CPP	330
level1	NG_1_014	2009	CPP	237
level1	NG_1_016	2009	CPP	407
level1	NG_1_017	2009	CPP	733
level1	NG_1_018	2009	CPP	1553
level1	NG_1_019	2009	CPP	824
level1	NG_1_020	2009	CPP	1552
level1	NG_1_021	2009	CPP	976
level1	NG_1_022	2009	CPP	1794
level1	NG_1_023	2009	CPP	967
level1	NG_1_024	2009	CPP	910
level1	NG_1_025	2009	CPP	1125
level1	NG_1_026	2009	CPP	131
level1	NG_1_027	2009	CPP	1264
level1	NG_1_028	2009	CPP	978
level1	NG_1_029	2009	CPP	1012
level1	NG_1_030	2009	CPP	1029
level1	NG_1_031	2009	CPP	6674
level1	NG_1_032	2009	CPP	237
level1	NG_1_033	2009	CPP	577
level1	NG_1_034	2009	CPP	1894
level1	NG_1_035	2009	CPP	1033
level1	NG_1_036	2009	CPP	329
level1	NG_1_037	2009	CPP	655
level1	NG_1_015	2009	CPP	347
level1	NG_1_001	2009	HOPE	125
level1	NG_1_002	2009	HOPE	267
level1	NG_1_003	2009	HOPE	192
level1	NG_1_004	2009	HOPE	357
level1	NG_1_005	2009	HOPE	46
level1	NG_1_006	2009	HOPE	18
level1	NG_1_007	2009	HOPE	115
level1	NG_1_008	2009	HOPE	88
level1	NG_1_009	2009	HOPE	237
level1	NG_1_010	2009	HOPE	166
level1	NG_1_011	2009	HOPE	989
level1	NG_1_012	2009	HOPE	22
level1	NG_1_013	2009	HOPE	94
level1	NG_1_014	2009	HOPE	110
level1	NG_1_016	2009	HOPE	46
level1	NG_1_017	2009	HOPE	157
level1	NG_1_018	2009	HOPE	337
level1	NG_1_019	2009	HOPE	105
level1	NG_1_020	2009	HOPE	292
level1	NG_1_021	2009	HOPE	47
level1	NG_1_022	2009	HOPE	213
level1	NG_1_023	2009	HOPE	144
level1	NG_1_024	2009	HOPE	118
level1	NG_1_025	2009	HOPE	255
level1	NG_1_026	2009	HOPE	4
level1	NG_1_027	2009	HOPE	198
level1	NG_1_028	2009	HOPE	332
level1	NG_1_029	2009	HOPE	184
level1	NG_1_030	2009	HOPE	132
level1	NG_1_031	2009	HOPE	839
level1	NG_1_032	2009	HOPE	56
level1	NG_1_033	2009	HOPE	542
level1	NG_1_034	2009	HOPE	283
level1	NG_1_035	2009	HOPE	161
level1	NG_1_036	2009	HOPE	67
level1	NG_1_037	2009	HOPE	14
level1	NG_1_015	2009	HOPE	83
level1	NG_1_001	2009	KOWA	173
level1	NG_1_002	2009	KOWA	752
level1	NG_1_003	2009	KOWA	160
level1	NG_1_004	2009	KOWA	311
level1	NG_1_005	2009	KOWA	128
level1	NG_1_006	2009	KOWA	52
level1	NG_1_007	2009	KOWA	105
level1	NG_1_008	2009	KOWA	158
level1	NG_1_009	2009	KOWA	312
level1	NG_1_010	2009	KOWA	311
level1	NG_1_011	2009	KOWA	913
level1	NG_1_012	2009	KOWA	175
level1	NG_1_013	2009	KOWA	108
level1	NG_1_014	2009	KOWA	203
level1	NG_1_016	2009	KOWA	97
level1	NG_1_017	2009	KOWA	158
level1	NG_1_018	2009	KOWA	423
level1	NG_1_019	2009	KOWA	176
level1	NG_1_020	2009	KOWA	288
level1	NG_1_021	2009	KOWA	215
level1	NG_1_022	2009	KOWA	448
level1	NG_1_023	2009	KOWA	190
level1	NG_1_024	2009	KOWA	214
level1	NG_1_025	2009	KOWA	1000
level1	NG_1_026	2009	KOWA	48
level1	NG_1_027	2009	KOWA	305
level1	NG_1_028	2009	KOWA	432
level1	NG_1_029	2009	KOWA	223
level1	NG_1_030	2009	KOWA	255
level1	NG_1_031	2009	KOWA	1312
level1	NG_1_032	2009	KOWA	138
level1	NG_1_033	2009	KOWA	2274
level1	NG_1_034	2009	KOWA	475
level1	NG_1_035	2009	KOWA	153
level1	NG_1_036	2009	KOWA	104
level1	NG_1_037	2009	KOWA	122
level1	NG_1_015	2009	KOWA	165
level1	NG_1_001	2009	NCP	745
level1	NG_1_002	2009	NCP	1212
level1	NG_1_003	2009	NCP	381
level1	NG_1_004	2009	NCP	887
level1	NG_1_005	2009	NCP	207
level1	NG_1_006	2009	NCP	95
level1	NG_1_007	2009	NCP	683
level1	NG_1_008	2009	NCP	107
level1	NG_1_009	2009	NCP	930
level1	NG_1_010	2009	NCP	670
level1	NG_1_011	2009	NCP	1890
level1	NG_1_012	2009	NCP	516
level1	NG_1_013	2009	NCP	377
level1	NG_1_014	2009	NCP	761
level1	NG_1_016	2009	NCP	227
level1	NG_1_017	2009	NCP	784
level1	NG_1_018	2009	NCP	548
level1	NG_1_019	2009	NCP	754
level1	NG_1_020	2009	NCP	697
level1	NG_1_021	2009	NCP	330
level1	NG_1_022	2009	NCP	519
level1	NG_1_023	2009	NCP	399
level1	NG_1_024	2009	NCP	394
level1	NG_1_025	2009	NCP	1430
level1	NG_1_026	2009	NCP	222
level1	NG_1_027	2009	NCP	550
level1	NG_1_028	2009	NCP	815
level1	NG_1_029	2009	NCP	846
level1	NG_1_030	2009	NCP	767
level1	NG_1_031	2009	NCP	1895
level1	NG_1_032	2009	NCP	693
level1	NG_1_033	2009	NCP	565
level1	NG_1_034	2009	NCP	686
level1	NG_1_035	2009	NCP	876
level1	NG_1_036	2009	NCP	120
level1	NG_1_037	2009	NCP	404
level1	NG_1_015	2009	NCP	473
level1	NG_1_001	2009	PDP	368303
level1	NG_1_002	2009	PDP	251664
level1	NG_1_003	2009	PDP	953304
level1	NG_1_004	2009	PDP	660762
level1	NG_1_005	2009	PDP	86085
level1	NG_1_006	2009	PDP	361209
level1	NG_1_007	2009	PDP	303737
level1	NG_1_008	2009	PDP	25640
level1	NG_1_009	2009	PDP	414863
level1	NG_1_010	2009	PDP	1211405
level1	NG_1_011	2009	PDP	323653
level1	NG_1_012	2009	PDP	286869
level1	NG_1_013	2009	PDP	176466
level1	NG_1_014	2009	PDP	553003
level1	NG_1_016	2009	PDP	96873
level1	NG_1_017	2009	PDP	559185
level1	NG_1_018	2009	PDP	142904
level1	NG_1_019	2009	PDP	484085
level1	NG_1_020	2009	PDP	215779
level1	NG_1_021	2009	PDP	98937
level1	NG_1_022	2009	PDP	100972
level1	NG_1_023	2009	PDP	149987
level1	NG_1_024	2009	PDP	132602
level1	NG_1_025	2009	PDP	632327
level1	NG_1_026	2009	PDP	273460
level1	NG_1_027	2009	PDP	149222
level1	NG_1_028	2009	PDP	207950
level1	NG_1_029	2009	PDP	251368
level1	NG_1_030	2009	PDP	249929
level1	NG_1_031	2009	PDP	303376
level1	NG_1_032	2009	PDP	549615
level1	NG_1_033	2009	PDP	1487075
level1	NG_1_034	2009	PDP	152199
level1	NG_1_035	2009	PDP	310800
level1	NG_1_036	2009	PDP	25526
level1	NG_1_037	2009	PDP	144833
level1	NG_1_015	2009	PDP	157195
level1	NG_1_001	2009	PPN	424
level1	NG_1_002	2009	PPN	1163
level1	NG_1_003	2009	PPN	327
level1	NG_1_004	2009	PPN	537
level1	NG_1_005	2009	PPN	128
level1	NG_1_006	2009	PPN	62
level1	NG_1_007	2009	PPN	439
level1	NG_1_008	2009	PPN	143
level1	NG_1_009	2009	PPN	864
level1	NG_1_010	2009	PPN	393
level1	NG_1_011	2009	PPN	1168
level1	NG_1_012	2009	PPN	729
level1	NG_1_013	2009	PPN	388
level1	NG_1_014	2009	PPN	407
level1	NG_1_016	2009	PPN	157
level1	NG_1_017	2009	PPN	414
level1	NG_1_018	2009	PPN	853
level1	NG_1_019	2009	PPN	549
level1	NG_1_020	2009	PPN	485
level1	NG_1_021	2009	PPN	254
level1	NG_1_022	2009	PPN	547
level1	NG_1_023	2009	PPN	476
level1	NG_1_024	2009	PPN	325
level1	NG_1_025	2009	PPN	1041
level1	NG_1_026	2009	PPN	164
level1	NG_1_027	2009	PPN	449
level1	NG_1_028	2009	PPN	4339
level1	NG_1_029	2009	PPN	734
level1	NG_1_030	2009	PPN	599
level1	NG_1_031	2009	PPN	2842
level1	NG_1_032	2009	PPN	554
level1	NG_1_033	2009	PPN	492
level1	NG_1_034	2009	PPN	605
level1	NG_1_035	2009	PPN	680
level1	NG_1_036	2009	PPN	101
level1	NG_1_037	2009	PPN	374
level1	NG_1_015	2009	PPN	269
level1	NG_1_001	2009	UDP	213
level1	NG_1_002	2009	UDP	289
level1	NG_1_003	2009	UDP	224
level1	NG_1_004	2009	UDP	286
level1	NG_1_005	2009	UDP	29
level1	NG_1_006	2009	UDP	20
level1	NG_1_007	2009	UDP	66
level1	NG_1_008	2009	UDP	31
level1	NG_1_009	2009	UDP	289
level1	NG_1_010	2009	UDP	354
level1	NG_1_011	2009	UDP	624
level1	NG_1_012	2009	UDP	160
level1	NG_1_013	2009	UDP	60
level1	NG_1_014	2009	UDP	1623
level1	NG_1_016	2009	UDP	25
level1	NG_1_017	2009	UDP	264
level1	NG_1_018	2009	UDP	338
level1	NG_1_019	2009	UDP	79
level1	NG_1_020	2009	UDP	234
level1	NG_1_021	2009	UDP	117
level1	NG_1_022	2009	UDP	207
level1	NG_1_023	2009	UDP	180
level1	NG_1_024	2009	UDP	81
level1	NG_1_025	2009	UDP	269
level1	NG_1_026	2009	UDP	23
level1	NG_1_027	2009	UDP	116
level1	NG_1_028	2009	UDP	562
level1	NG_1_029	2009	UDP	184
level1	NG_1_030	2009	UDP	124
level1	NG_1_031	2009	UDP	1069
level1	NG_1_032	2009	UDP	54
level1	NG_1_033	2009	UDP	303
level1	NG_1_034	2009	UDP	269
level1	NG_1_035	2009	UDP	224
level1	NG_1_036	2009	UDP	30
level1	NG_1_037	2009	UDP	93
level1	NG_1_015	2009	UDP	95
level1	NG_1_001	2009	UPP	330
level1	NG_1_002	2009	UPP	334
level1	NG_1_003	2009	UPP	144
level1	NG_1_004	2009	UPP	1121
level1	NG_1_005	2009	UPP	37
level1	NG_1_006	2009	UPP	35
level1	NG_1_007	2009	UPP	74
level1	NG_1_008	2009	UPP	41
level1	NG_1_009	2009	UPP	1487
level1	NG_1_010	2009	UPP	261
level1	NG_1_011	2009	UPP	4859
level1	NG_1_012	2009	UPP	72
level1	NG_1_013	2009	UPP	145
level1	NG_1_014	2009	UPP	290
level1	NG_1_016	2009	UPP	37
level1	NG_1_017	2009	UPP	1917
level1	NG_1_018	2009	UPP	197
level1	NG_1_019	2009	UPP	78
level1	NG_1_020	2009	UPP	156
level1	NG_1_021	2009	UPP	72
level1	NG_1_022	2009	UPP	238
level1	NG_1_023	2009	UPP	156
level1	NG_1_024	2009	UPP	102
level1	NG_1_025	2009	UPP	244
level1	NG_1_026	2009	UPP	33
level1	NG_1_027	2009	UPP	118
level1	NG_1_028	2009	UPP	597
level1	NG_1_029	2009	UPP	221
level1	NG_1_030	2009	UPP	159
level1	NG_1_031	2009	UPP	3665
level1	NG_1_032	2009	UPP	29
level1	NG_1_033	2009	UPP	156
level1	NG_1_034	2009	UPP	180
level1	NG_1_035	2009	UPP	439
level1	NG_1_036	2009	UPP	32
level1	NG_1_037	2009	UPP	68
level1	NG_1_015	2009	UPP	96
level1	SN_1_001	2009	Macky Sall	205338
level1	SN_1_002	2009	Macky Sall	61725
level1	SN_1_003	2009	Macky Sall	55839
level1	SN_1_004	2009	Macky Sall	16868
level1	SN_1_005	2009	Macky Sall	33768
level1	SN_1_006	2009	Macky Sall	4656
level1	SN_1_007	2009	Macky Sall	26079
level1	SN_1_008	2009	Macky Sall	55266
level1	SN_1_009	2009	Macky Sall	54954
level1	SN_1_010	2009	Macky Sall	60229
level1	SN_1_011	2009	Macky Sall	14531
level1	SN_1_012	2009	Macky Sall	28768
level1	SN_1_013	2009	Macky Sall	57376
level1	SN_1_014	2009	Macky Sall	17832
level1	SN_1_001	2009	Abdoulaye Wade	189493
level1	SN_1_002	2009	Abdoulaye Wade	98357
level1	SN_1_003	2009	Abdoulaye Wade	36862
level1	SN_1_004	2009	Abdoulaye Wade	42660
level1	SN_1_005	2009	Abdoulaye Wade	48255
level1	SN_1_006	2009	Abdoulaye Wade	13882
level1	SN_1_007	2009	Abdoulaye Wade	51131
level1	SN_1_008	2009	Abdoulaye Wade	76301
level1	SN_1_009	2009	Abdoulaye Wade	41205
level1	SN_1_010	2009	Abdoulaye Wade	85272
level1	SN_1_011	2009	Abdoulaye Wade	50234
level1	SN_1_012	2009	Abdoulaye Wade	45419
level1	SN_1_013	2009	Abdoulaye Wade	97590
level1	SN_1_014	2009	Abdoulaye Wade	42968
level1	SN_1_001	2009	Moustapha Niasse	131444
level1	SN_1_002	2009	Moustapha Niasse	9754
level1	SN_1_003	2009	Moustapha Niasse	17860
level1	SN_1_004	2009	Moustapha Niasse	20980
level1	SN_1_005	2009	Moustapha Niasse	66342
level1	SN_1_006	2009	Moustapha Niasse	1613
level1	SN_1_007	2009	Moustapha Niasse	7764
level1	SN_1_008	2009	Moustapha Niasse	10571
level1	SN_1_009	2009	Moustapha Niasse	5474
level1	SN_1_010	2009	Moustapha Niasse	13233
level1	SN_1_011	2009	Moustapha Niasse	5239
level1	SN_1_012	2009	Moustapha Niasse	8479
level1	SN_1_013	2009	Moustapha Niasse	33079
level1	SN_1_014	2009	Moustapha Niasse	16511
level1	SN_1_001	2009	Ousmane Tanor Dieng	89583
level1	SN_1_002	2009	Ousmane Tanor Dieng	11719
level1	SN_1_003	2009	Ousmane Tanor Dieng	17259
level1	SN_1_004	2009	Ousmane Tanor Dieng	11804
level1	SN_1_005	2009	Ousmane Tanor Dieng	20608
level1	SN_1_006	2009	Ousmane Tanor Dieng	806
level1	SN_1_007	2009	Ousmane Tanor Dieng	9388
level1	SN_1_008	2009	Ousmane Tanor Dieng	23623
level1	SN_1_009	2009	Ousmane Tanor Dieng	2121
level1	SN_1_010	2009	Ousmane Tanor Dieng	24956
level1	SN_1_011	2009	Ousmane Tanor Dieng	5407
level1	SN_1_012	2009	Ousmane Tanor Dieng	8716
level1	SN_1_013	2009	Ousmane Tanor Dieng	72394
level1	SN_1_014	2009	Ousmane Tanor Dieng	3636
level1	SN_1_001	2009	Idrissa Seck	65560
level1	SN_1_002	2009	Idrissa Seck	10278
level1	SN_1_003	2009	Idrissa Seck	3219
level1	SN_1_004	2009	Idrissa Seck	3330
level1	SN_1_005	2009	Idrissa Seck	6712
level1	SN_1_006	2009	Idrissa Seck	590
level1	SN_1_007	2009	Idrissa Seck	5218
level1	SN_1_008	2009	Idrissa Seck	7564
level1	SN_1_009	2009	Idrissa Seck	812
level1	SN_1_010	2009	Idrissa Seck	11922
level1	SN_1_011	2009	Idrissa Seck	2516
level1	SN_1_012	2009	Idrissa Seck	2345
level1	SN_1_013	2009	Idrissa Seck	85404
level1	SN_1_014	2009	Idrissa Seck	3102
level1	SN_1_001	2009	Cheikh Bamba Dieye	25673
level1	SN_1_002	2009	Cheikh Bamba Dieye	2340
level1	SN_1_003	2009	Cheikh Bamba Dieye	896
level1	SN_1_004	2009	Cheikh Bamba Dieye	775
level1	SN_1_005	2009	Cheikh Bamba Dieye	2023
level1	SN_1_006	2009	Cheikh Bamba Dieye	182
level1	SN_1_007	2009	Cheikh Bamba Dieye	584
level1	SN_1_008	2009	Cheikh Bamba Dieye	1831
level1	SN_1_009	2009	Cheikh Bamba Dieye	538
level1	SN_1_010	2009	Cheikh Bamba Dieye	6078
level1	SN_1_011	2009	Cheikh Bamba Dieye	746
level1	SN_1_012	2009	Cheikh Bamba Dieye	712
level1	SN_1_013	2009	Cheikh Bamba Dieye	6462
level1	SN_1_014	2009	Cheikh Bamba Dieye	739
level1	SN_1_001	2009	Ibrahima Fall	27075
level1	SN_1_002	2009	Ibrahima Fall	1861
level1	SN_1_003	2009	Ibrahima Fall	735
level1	SN_1_004	2009	Ibrahima Fall	459
level1	SN_1_005	2009	Ibrahima Fall	1145
level1	SN_1_006	2009	Ibrahima Fall	176
level1	SN_1_007	2009	Ibrahima Fall	460
level1	SN_1_008	2009	Ibrahima Fall	1673
level1	SN_1_009	2009	Ibrahima Fall	393
level1	SN_1_010	2009	Ibrahima Fall	1802
level1	SN_1_011	2009	Ibrahima Fall	338
level1	SN_1_012	2009	Ibrahima Fall	421
level1	SN_1_013	2009	Ibrahima Fall	7524
level1	SN_1_014	2009	Ibrahima Fall	385
level1	SN_1_001	2009	Cheikh Tidiane Gadio	6699
level1	SN_1_002	2009	Cheikh Tidiane Gadio	1358
level1	SN_1_003	2009	Cheikh Tidiane Gadio	1314
level1	SN_1_004	2009	Cheikh Tidiane Gadio	824
level1	SN_1_005	2009	Cheikh Tidiane Gadio	1413
level1	SN_1_006	2009	Cheikh Tidiane Gadio	499
level1	SN_1_007	2009	Cheikh Tidiane Gadio	1920
level1	SN_1_008	2009	Cheikh Tidiane Gadio	1964
level1	SN_1_009	2009	Cheikh Tidiane Gadio	1272
level1	SN_1_010	2009	Cheikh Tidiane Gadio	2079
level1	SN_1_011	2009	Cheikh Tidiane Gadio	994
level1	SN_1_012	2009	Cheikh Tidiane Gadio	1077
level1	SN_1_013	2009	Cheikh Tidiane Gadio	3102
level1	SN_1_014	2009	Cheikh Tidiane Gadio	1194
level1	SN_1_001	2009	Mor Dieng	1572
level1	SN_1_002	2009	Mor Dieng	1617
level1	SN_1_003	2009	Mor Dieng	699
level1	SN_1_004	2009	Mor Dieng	549
level1	SN_1_005	2009	Mor Dieng	823
level1	SN_1_006	2009	Mor Dieng	156
level1	SN_1_007	2009	Mor Dieng	703
level1	SN_1_008	2009	Mor Dieng	980
level1	SN_1_009	2009	Mor Dieng	251
level1	SN_1_010	2009	Mor Dieng	798
level1	SN_1_011	2009	Mor Dieng	476
level1	SN_1_012	2009	Mor Dieng	420
level1	SN_1_013	2009	Mor Dieng	1949
level1	SN_1_014	2009	Mor Dieng	276
level1	SN_1_001	2009	Djibril Ngom	2667
level1	SN_1_002	2009	Djibril Ngom	1035
level1	SN_1_003	2009	Djibril Ngom	628
level1	SN_1_004	2009	Djibril Ngom	366
level1	SN_1_005	2009	Djibril Ngom	896
level1	SN_1_006	2009	Djibril Ngom	188
level1	SN_1_007	2009	Djibril Ngom	409
level1	SN_1_008	2009	Djibril Ngom	700
level1	SN_1_009	2009	Djibril Ngom	296
level1	SN_1_010	2009	Djibril Ngom	673
level1	SN_1_011	2009	Djibril Ngom	281
level1	SN_1_012	2009	Djibril Ngom	383
level1	SN_1_013	2009	Djibril Ngom	1257
level1	SN_1_014	2009	Djibril Ngom	271
level1	SN_1_001	2009	Oumar Khassimou Dia	1128
level1	SN_1_002	2009	Oumar Khassimou Dia	468
level1	SN_1_003	2009	Oumar Khassimou Dia	413
level1	SN_1_004	2009	Oumar Khassimou Dia	205
level1	SN_1_005	2009	Oumar Khassimou Dia	433
level1	SN_1_006	2009	Oumar Khassimou Dia	188
level1	SN_1_007	2009	Oumar Khassimou Dia	373
level1	SN_1_008	2009	Oumar Khassimou Dia	422
level1	SN_1_009	2009	Oumar Khassimou Dia	259
level1	SN_1_010	2009	Oumar Khassimou Dia	553
level1	SN_1_011	2009	Oumar Khassimou Dia	367
level1	SN_1_012	2009	Oumar Khassimou Dia	363
level1	SN_1_013	2009	Oumar Khassimou Dia	990
level1	SN_1_014	2009	Oumar Khassimou Dia	235
level1	SN_1_001	2009	Amsatou Sow Sidibe	1370
level1	SN_1_002	2009	Amsatou Sow Sidibe	298
level1	SN_1_003	2009	Amsatou Sow Sidibe	233
level1	SN_1_004	2009	Amsatou Sow Sidibe	152
level1	SN_1_005	2009	Amsatou Sow Sidibe	309
level1	SN_1_006	2009	Amsatou Sow Sidibe	172
level1	SN_1_007	2009	Amsatou Sow Sidibe	318
level1	SN_1_008	2009	Amsatou Sow Sidibe	279
level1	SN_1_009	2009	Amsatou Sow Sidibe	190
level1	SN_1_010	2009	Amsatou Sow Sidibe	463
level1	SN_1_011	2009	Amsatou Sow Sidibe	285
level1	SN_1_012	2009	Amsatou Sow Sidibe	239
level1	SN_1_013	2009	Amsatou Sow Sidibe	485
level1	SN_1_014	2009	Amsatou Sow Sidibe	201
level1	SN_1_001	2009	Doudou Ndoye	822
level1	SN_1_002	2009	Doudou Ndoye	405
level1	SN_1_003	2009	Doudou Ndoye	323
level1	SN_1_004	2009	Doudou Ndoye	255
level1	SN_1_005	2009	Doudou Ndoye	422
level1	SN_1_006	2009	Doudou Ndoye	87
level1	SN_1_007	2009	Doudou Ndoye	235
level1	SN_1_008	2009	Doudou Ndoye	417
level1	SN_1_009	2009	Doudou Ndoye	145
level1	SN_1_010	2009	Doudou Ndoye	268
level1	SN_1_011	2009	Doudou Ndoye	224
level1	SN_1_012	2009	Doudou Ndoye	243
level1	SN_1_013	2009	Doudou Ndoye	493
level1	SN_1_014	2009	Doudou Ndoye	160
level1	SN_1_001	2009	Diouma Diakhate	721
level1	SN_1_002	2009	Diouma Diakhate	263
level1	SN_1_003	2009	Diouma Diakhate	152
level1	SN_1_004	2009	Diouma Diakhate	124
level1	SN_1_005	2009	Diouma Diakhate	196
level1	SN_1_006	2009	Diouma Diakhate	140
level1	SN_1_007	2009	Diouma Diakhate	252
level1	SN_1_008	2009	Diouma Diakhate	266
level1	SN_1_009	2009	Diouma Diakhate	107
level1	SN_1_010	2009	Diouma Diakhate	233
level1	SN_1_011	2009	Diouma Diakhate	166
level1	SN_1_012	2009	Diouma Diakhate	193
level1	SN_1_013	2009	Diouma Diakhate	323
level1	SN_1_014	2009	Diouma Diakhate	132
country	SN	2009	Macky Sall	693229
country	SN	2009	Abdoulaye Wade	232461
country	SN	2009	Moustapha Niasse	147955
country	SN	2009	Ousmane Tanor Dieng	93219
country	SN	2009	Idrissa Seck	68662
country	SN	2009	Cheikh Bamba Dieye	26412
country	SN	2009	Ibrahima Fall	27460
country	SN	2009	Cheikh Tidiane Gadio	7893
country	SN	2009	Mor Dieng	1848
country	SN	2009	Djibril Ngom	2938
country	SN	2009	Oumar Khassimou Dia	1363
country	SN	2009	Amsatou Sow Sidibe	1571
country	SN	2009	Doudou Ndoye	982
country	SN	2009	Diouma Diakhate	853
country	NG	2009	AA	22125
country	NG	2009	ACPN	40311
country	NG	2009	AD	30673
country	NG	2009	ADC	29666
country	NG	2009	APA	53537
country	NG	2009	APC	15424921
country	NG	2009	CPP	36300
country	NG	2009	HOPE	7435
country	NG	2009	KOWA	13076
country	NG	2009	NCP	24455
country	NG	2009	PDP	12853162
country	NG	2009	PPN	24475
country	NG	2009	UDP	9208
country	NG	2009	UPP	18220
level1	TZ_1_001	2009	Anna E. Mgwihira	1925
level1	TZ_1_001	2009	Chief L. Yemba	996
level1	TZ_1_001	2009	Dkt. John P. Magufuli	206548
level1	TZ_1_001	2009	Edward N. Lowassa	507273
level1	TZ_1_001	2009	Hashim R. Spunda	1628
level1	TZ_1_001	2009	Kasambala J. Malik	150
level1	TZ_1_001	2009	Elifatio M. Lyimo	193
level1	TZ_1_001	2009	Dovutwa F. Nassoro	122
level1	TZ_1_002	2009	Anna E. Mgwihira	4394
level1	TZ_1_002	2009	Chief L. Yemba	3509
level1	TZ_1_002	2009	Dkt. John P. Magufuli	728711
level1	TZ_1_002	2009	Edward N. Lowassa	834759
level1	TZ_1_002	2009	Hashim R. Spunda	4615
level1	TZ_1_002	2009	Kasambala J. Malik	451
level1	TZ_1_002	2009	Elifatio M. Lyimo	320
level1	TZ_1_002	2009	Dovutwa F. Nassoro	283
level1	TZ_1_003	2009	Anna E. Mgwihira	4780
level1	TZ_1_003	2009	Chief L. Yemba	3243
level1	TZ_1_003	2009	Dkt. John P. Magufuli	516317
level1	TZ_1_003	2009	Edward N. Lowassa	157623
level1	TZ_1_003	2009	Hashim R. Spunda	1691
level1	TZ_1_003	2009	Kasambala J. Malik	374
level1	TZ_1_003	2009	Elifatio M. Lyimo	314
level1	TZ_1_003	2009	Dovutwa F. Nassoro	332
level1	TZ_1_004	2009	Anna E. Mgwihira	2984
level1	TZ_1_004	2009	Chief L. Yemba	1663
level1	TZ_1_004	2009	Dkt. John P. Magufuli	377051
level1	TZ_1_004	2009	Edward N. Lowassa	157440
level1	TZ_1_004	2009	Hashim R. Spunda	1384
level1	TZ_1_004	2009	Kasambala J. Malik	182
level1	TZ_1_004	2009	Elifatio M. Lyimo	214
level1	TZ_1_004	2009	Dovutwa F. Nassoro	198
level1	TZ_1_005	2009	Anna E. Mgwihira	2047
level1	TZ_1_005	2009	Chief L. Yemba	1611
level1	TZ_1_005	2009	Dkt. John P. Magufuli	243249
level1	TZ_1_005	2009	Edward N. Lowassa	130149
level1	TZ_1_005	2009	Hashim R. Spunda	1063
level1	TZ_1_005	2009	Kasambala J. Malik	158
level1	TZ_1_005	2009	Elifatio M. Lyimo	152
level1	TZ_1_005	2009	Dovutwa F. Nassoro	160
level1	TZ_1_006	2009	Anna E. Mgwihira	2819
level1	TZ_1_006	2009	Chief L. Yemba	2604
level1	TZ_1_006	2009	Dkt. John P. Magufuli	475910
level1	TZ_1_006	2009	Edward N. Lowassa	287538
level1	TZ_1_006	2009	Hashim R. Spunda	1725
level1	TZ_1_006	2009	Kasambala J. Malik	217
level1	TZ_1_006	2009	Elifatio M. Lyimo	251
level1	TZ_1_006	2009	Dovutwa F. Nassoro	168
level1	TZ_1_007	2009	Anna E. Mgwihira	165
level1	TZ_1_007	2009	Chief L. Yemba	263
level1	TZ_1_007	2009	Dkt. John P. Magufuli	7505
level1	TZ_1_007	2009	Edward N. Lowassa	57038
level1	TZ_1_007	2009	Hashim R. Spunda	766
level1	TZ_1_007	2009	Kasambala J. Malik	195
level1	TZ_1_007	2009	Elifatio M. Lyimo	177
level1	TZ_1_007	2009	Dovutwa F. Nassoro	284
level1	TZ_1_008	2009	Anna E. Mgwihira	302
level1	TZ_1_008	2009	Chief L. Yemba	561
level1	TZ_1_008	2009	Dkt. John P. Magufuli	38105
level1	TZ_1_008	2009	Edward N. Lowassa	24664
level1	TZ_1_008	2009	Hashim R. Spunda	676
level1	TZ_1_008	2009	Kasambala J. Malik	238
level1	TZ_1_008	2009	Elifatio M. Lyimo	258
level1	TZ_1_008	2009	Dovutwa F. Nassoro	239
level1	TZ_1_009	2009	Anna E. Mgwihira	1396
level1	TZ_1_009	2009	Chief L. Yemba	439
level1	TZ_1_009	2009	Dkt. John P. Magufuli	132135
level1	TZ_1_009	2009	Edward N. Lowassa	47278
level1	TZ_1_009	2009	Hashim R. Spunda	318
level1	TZ_1_009	2009	Kasambala J. Malik	59
level1	TZ_1_009	2009	Elifatio M. Lyimo	47
level1	TZ_1_009	2009	Dovutwa F. Nassoro	55
level1	TZ_1_010	2009	Anna E. Mgwihira	18838
level1	TZ_1_010	2009	Chief L. Yemba	3040
level1	TZ_1_010	2009	Dkt. John P. Magufuli	314715
level1	TZ_1_010	2009	Edward N. Lowassa	149031
level1	TZ_1_010	2009	Hashim R. Spunda	2835
level1	TZ_1_010	2009	Kasambala J. Malik	671
level1	TZ_1_010	2009	Elifatio M. Lyimo	453
level1	TZ_1_010	2009	Dovutwa F. Nassoro	586
level1	TZ_1_011	2009	Anna E. Mgwihira	2714
level1	TZ_1_011	2009	Chief L. Yemba	2145
level1	TZ_1_011	2009	Dkt. John P. Magufuli	214973
level1	TZ_1_011	2009	Edward N. Lowassa	343562
level1	TZ_1_011	2009	Hashim R. Spunda	3683
level1	TZ_1_011	2009	Kasambala J. Malik	212
level1	TZ_1_011	2009	Elifatio M. Lyimo	434
level1	TZ_1_011	2009	Dovutwa F. Nassoro	178
level1	TZ_1_012	2009	Anna E. Mgwihira	152
level1	TZ_1_012	2009	Chief L. Yemba	470
level1	TZ_1_012	2009	Dkt. John P. Magufuli	12736
level1	TZ_1_012	2009	Edward N. Lowassa	48334
level1	TZ_1_012	2009	Hashim R. Spunda	602
level1	TZ_1_012	2009	Kasambala J. Malik	204
level1	TZ_1_012	2009	Elifatio M. Lyimo	181
level1	TZ_1_012	2009	Dovutwa F. Nassoro	212
level1	TZ_1_013	2009	Anna E. Mgwihira	134
level1	TZ_1_013	2009	Chief L. Yemba	244
level1	TZ_1_013	2009	Dkt. John P. Magufuli	40376
level1	TZ_1_013	2009	Edward N. Lowassa	10079
level1	TZ_1_013	2009	Hashim R. Spunda	286
level1	TZ_1_013	2009	Kasambala J. Malik	103
level1	TZ_1_013	2009	Elifatio M. Lyimo	86
level1	TZ_1_013	2009	Dovutwa F. Nassoro	83
level1	TZ_1_014	2009	Anna E. Mgwihira	3409
level1	TZ_1_014	2009	Chief L. Yemba	3676
level1	TZ_1_014	2009	Dkt. John P. Magufuli	342285
level1	TZ_1_014	2009	Edward N. Lowassa	477995
level1	TZ_1_014	2009	Hashim R. Spunda	5550
level1	TZ_1_014	2009	Kasambala J. Malik	837
level1	TZ_1_014	2009	Elifatio M. Lyimo	974
level1	TZ_1_014	2009	Dovutwa F. Nassoro	781
level1	TZ_1_015	2009	Anna E. Mgwihira	1803
level1	TZ_1_015	2009	Chief L. Yemba	1262
level1	TZ_1_015	2009	Dkt. John P. Magufuli	273757
level1	TZ_1_015	2009	Edward N. Lowassa	182543
level1	TZ_1_015	2009	Hashim R. Spunda	716
level1	TZ_1_015	2009	Kasambala J. Malik	101
level1	TZ_1_015	2009	Elifatio M. Lyimo	137
level1	TZ_1_015	2009	Dovutwa F. Nassoro	89
level1	TZ_1_016	2009	Anna E. Mgwihira	3830
level1	TZ_1_016	2009	Chief L. Yemba	3082
level1	TZ_1_016	2009	Dkt. John P. Magufuli	364908
level1	TZ_1_016	2009	Edward N. Lowassa	241581
level1	TZ_1_016	2009	Hashim R. Spunda	1676
level1	TZ_1_016	2009	Kasambala J. Malik	283
level1	TZ_1_016	2009	Elifatio M. Lyimo	408
level1	TZ_1_016	2009	Dovutwa F. Nassoro	241
level1	TZ_1_017	2009	Anna E. Mgwihira	5738
level1	TZ_1_017	2009	Chief L. Yemba	4040
level1	TZ_1_017	2009	Dkt. John P. Magufuli	519985
level1	TZ_1_017	2009	Edward N. Lowassa	450796
level1	TZ_1_017	2009	Hashim R. Spunda	2252
level1	TZ_1_017	2009	Kasambala J. Malik	441
level1	TZ_1_017	2009	Elifatio M. Lyimo	371
level1	TZ_1_017	2009	Dovutwa F. Nassoro	329
level1	TZ_1_018	2009	Anna E. Mgwihira	5200
level1	TZ_1_018	2009	Chief L. Yemba	3855
level1	TZ_1_018	2009	Dkt. John P. Magufuli	501814
level1	TZ_1_018	2009	Edward N. Lowassa	306088
level1	TZ_1_018	2009	Hashim R. Spunda	1941
level1	TZ_1_018	2009	Kasambala J. Malik	266
level1	TZ_1_018	2009	Elifatio M. Lyimo	320
level1	TZ_1_018	2009	Dovutwa F. Nassoro	317
level1	TZ_1_019	2009	Anna E. Mgwihira	4330
level1	TZ_1_019	2009	Chief L. Yemba	3441
level1	TZ_1_019	2009	Dkt. John P. Magufuli	304126
level1	TZ_1_019	2009	Edward N. Lowassa	214933
level1	TZ_1_019	2009	Hashim R. Spunda	2525
level1	TZ_1_019	2009	Kasambala J. Malik	546
level1	TZ_1_019	2009	Elifatio M. Lyimo	670
level1	TZ_1_019	2009	Dovutwa F. Nassoro	548
level1	TZ_1_020	2009	Anna E. Mgwihira	4325
level1	TZ_1_020	2009	Chief L. Yemba	2696
level1	TZ_1_020	2009	Dkt. John P. Magufuli	584184
level1	TZ_1_020	2009	Edward N. Lowassa	311532
level1	TZ_1_020	2009	Hashim R. Spunda	2477
level1	TZ_1_020	2009	Kasambala J. Malik	350
level1	TZ_1_020	2009	Elifatio M. Lyimo	429
level1	TZ_1_020	2009	Dovutwa F. Nassoro	522
level1	TZ_1_022	2009	Anna E. Mgwihira	3085
level1	TZ_1_022	2009	Chief L. Yemba	2482
level1	TZ_1_022	2009	Dkt. John P. Magufuli	261395
level1	TZ_1_022	2009	Edward N. Lowassa	170288
level1	TZ_1_022	2009	Hashim R. Spunda	2118
level1	TZ_1_022	2009	Kasambala J. Malik	366
level1	TZ_1_022	2009	Elifatio M. Lyimo	331
level1	TZ_1_022	2009	Dovutwa F. Nassoro	335
level1	TZ_1_023	2009	Anna E. Mgwihira	1936
level1	TZ_1_023	2009	Chief L. Yemba	1284
level1	TZ_1_023	2009	Dkt. John P. Magufuli	178312
level1	TZ_1_023	2009	Edward N. Lowassa	130123
level1	TZ_1_023	2009	Hashim R. Spunda	727
level1	TZ_1_023	2009	Kasambala J. Malik	105
level1	TZ_1_023	2009	Elifatio M. Lyimo	209
level1	TZ_1_023	2009	Dovutwa F. Nassoro	107
level1	TZ_1_024	2009	Anna E. Mgwihira	3895
level1	TZ_1_024	2009	Chief L. Yemba	3006
level1	TZ_1_024	2009	Dkt. John P. Magufuli	319366
level1	TZ_1_024	2009	Edward N. Lowassa	151992
level1	TZ_1_024	2009	Hashim R. Spunda	1502
level1	TZ_1_024	2009	Kasambala J. Malik	247
level1	TZ_1_024	2009	Elifatio M. Lyimo	287
level1	TZ_1_024	2009	Dovutwa F. Nassoro	370
level1	TZ_1_025	2009	Anna E. Mgwihira	2539
level1	TZ_1_025	2009	Chief L. Yemba	2138
level1	TZ_1_025	2009	Dkt. John P. Magufuli	326936
level1	TZ_1_025	2009	Edward N. Lowassa	132180
level1	TZ_1_025	2009	Hashim R. Spunda	1167
level1	TZ_1_025	2009	Kasambala J. Malik	204
level1	TZ_1_025	2009	Elifatio M. Lyimo	181
level1	TZ_1_025	2009	Dovutwa F. Nassoro	170
level1	TZ_1_026	2009	Anna E. Mgwihira	2309
level1	TZ_1_026	2009	Chief L. Yemba	1548
level1	TZ_1_026	2009	Dkt. John P. Magufuli	318358
level1	TZ_1_026	2009	Edward N. Lowassa	183710
level1	TZ_1_026	2009	Hashim R. Spunda	1704
level1	TZ_1_026	2009	Kasambala J. Malik	395
level1	TZ_1_026	2009	Elifatio M. Lyimo	291
level1	TZ_1_026	2009	Dovutwa F. Nassoro	367
level1	TZ_1_027	2009	Anna E. Mgwihira	2435
level1	TZ_1_027	2009	Chief L. Yemba	6056
level1	TZ_1_027	2009	Dkt. John P. Magufuli	290899
level1	TZ_1_027	2009	Edward N. Lowassa	112342
level1	TZ_1_027	2009	Hashim R. Spunda	994
level1	TZ_1_027	2009	Kasambala J. Malik	127
level1	TZ_1_027	2009	Elifatio M. Lyimo	169
level1	TZ_1_027	2009	Dovutwa F. Nassoro	140
level1	TZ_1_028	2009	Anna E. Mgwihira	4375
level1	TZ_1_028	2009	Chief L. Yemba	3900
level1	TZ_1_028	2009	Dkt. John P. Magufuli	439459
level1	TZ_1_028	2009	Edward N. Lowassa	225051
level1	TZ_1_028	2009	Hashim R. Spunda	3422
level1	TZ_1_028	2009	Kasambala J. Malik	280
level1	TZ_1_028	2009	Elifatio M. Lyimo	325
level1	TZ_1_028	2009	Dovutwa F. Nassoro	323
level1	TZ_1_029	2009	Anna E. Mgwihira	5655
level1	TZ_1_029	2009	Chief L. Yemba	2218
level1	TZ_1_029	2009	Dkt. John P. Magufuli	413492
level1	TZ_1_029	2009	Edward N. Lowassa	181213
level1	TZ_1_029	2009	Hashim R. Spunda	1627
level1	TZ_1_029	2009	Kasambala J. Malik	335
level1	TZ_1_029	2009	Elifatio M. Lyimo	293
level1	TZ_1_029	2009	Dovutwa F. Nassoro	328
level1	TZ_1_030	2009	Anna E. Mgwihira	378
level1	TZ_1_030	2009	Chief L. Yemba	717
level1	TZ_1_030	2009	Dkt. John P. Magufuli	95599
level1	TZ_1_030	2009	Edward N. Lowassa	70918
level1	TZ_1_030	2009	Hashim R. Spunda	1033
level1	TZ_1_030	2009	Kasambala J. Malik	332
level1	TZ_1_030	2009	Elifatio M. Lyimo	263
level1	TZ_1_030	2009	Dovutwa F. Nassoro	227
level1	TZ_1_021	2009	Anna E. Mgwihira	2164
level1	TZ_1_021	2009	Chief L. Yemba	1197
level1	TZ_1_021	2009	Dkt. John P. Magufuli	182250
level1	TZ_1_021	2009	Edward N. Lowassa	82289
level1	TZ_1_021	2009	Hashim R. Spunda	575
level1	TZ_1_021	2009	Kasambala J. Malik	86
level1	TZ_1_021	2009	Elifatio M. Lyimo	140
level1	TZ_1_021	2009	Dovutwa F. Nassoro	99
country	TZ	2009	Anna E. Mgwihira	100056
country	TZ	2009	Chief L. Yemba	67386
country	TZ	2009	Dkt. John P. Magufuli	9025456
country	TZ	2009	Dovutwa F. Nassoro	8193
country	TZ	2009	Edward N. Lowassa	6380342
country	TZ	2009	Elifatio M. Lyimo	8878
country	TZ	2009	Hashim R. Spunda	53278
country	TZ	2009	Kasambala J. Malik	8515
\.


--
-- Name: votes_per_candidate pk_votes_per_candidate; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes_per_candidate
    ADD CONSTRAINT pk_votes_per_candidate PRIMARY KEY (geo_level, geo_code, geo_version, candidate);


--
-- PostgreSQL database dump complete
--

