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

ALTER TABLE IF EXISTS ONLY public.population_residence DROP CONSTRAINT IF EXISTS pk_population_residence;
DROP TABLE IF EXISTS public.population_residence;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_residence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_residence (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Residence" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_residence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_residence (geo_level, geo_code, geo_version, "Population_Residence", total) FROM stdin;
country	TZ	2009	urban	13305004
country	TZ	2009	rural	31623919
country	SN	2009	urban	6102800
country	SN	2009	rural	7405915
level1	TZ_1_001	2009	urban	530630
level1	TZ_1_001	2009	rural	1060286
level1	TZ_1_002	2009	urban	4157498
level1	TZ_1_003	2009	urban	304766
level1	TZ_1_003	2009	rural	1645006
level1	TZ_1_004	2009	urban	259260
level1	TZ_1_004	2009	rural	1350125
level1	TZ_1_005	2009	urban	243259
level1	TZ_1_005	2009	rural	643016
level1	TZ_1_006	2009	urban	213482
level1	TZ_1_006	2009	rural	2075759
level1	TZ_1_007	2009	urban	36799
level1	TZ_1_007	2009	rural	160334
level1	TZ_1_008	2009	urban	15802
level1	TZ_1_008	2009	rural	160579
level1	TZ_1_009	2009	urban	146884
level1	TZ_1_009	2009	rural	376409
level1	TZ_1_010	2009	urban	342857
level1	TZ_1_010	2009	rural	1635039
level1	TZ_1_011	2009	urban	376335
level1	TZ_1_011	2009	rural	1174547
level1	TZ_1_012	2009	urban	36802
level1	TZ_1_012	2009	rural	145109
level1	TZ_1_013	2009	urban	6714
level1	TZ_1_013	2009	rural	102545
level1	TZ_1_014	2009	urban	154079
level1	TZ_1_014	2009	rural	663064
level1	TZ_1_015	2009	urban	181929
level1	TZ_1_015	2009	rural	1144396
level1	TZ_1_016	2009	urban	303412
level1	TZ_1_016	2009	rural	1440418
level1	TZ_1_017	2009	urban	848387
level1	TZ_1_017	2009	rural	1698152
level1	TZ_1_018	2009	urban	603789
level1	TZ_1_018	2009	rural	1486329
level1	TZ_1_019	2009	urban	276452
level1	TZ_1_019	2009	rural	922922
level1	TZ_1_020	2009	urban	866739
level1	TZ_1_020	2009	rural	1713746
level1	TZ_1_022	2009	urban	341292
level1	TZ_1_022	2009	rural	693899
level1	TZ_1_023	2009	urban	220531
level1	TZ_1_023	2009	rural	707934
level1	TZ_1_024	2009	urban	319238
level1	TZ_1_024	2009	rural	975828
level1	TZ_1_025	2009	urban	240130
level1	TZ_1_025	2009	rural	1189212
level1	TZ_1_026	2009	urban	103704
level1	TZ_1_026	2009	rural	1366072
level1	TZ_1_027	2009	urban	161371
level1	TZ_1_027	2009	rural	1119800
level1	TZ_1_028	2009	urban	417131
level1	TZ_1_028	2009	rural	1497287
level1	TZ_1_029	2009	urban	271452
level1	TZ_1_029	2009	rural	1864159
level1	TZ_1_030	2009	urban	473956
level1	TZ_1_030	2009	rural	86340
level1	TZ_1_021	2009	urban	157264
level1	TZ_1_021	2009	rural	505396
level1	SN_1_001	2009	urban	2845954
level1	SN_1_001	2009	rural	81468
level1	SN_1_002	2009	urban	241416
level1	SN_1_002	2009	rural	1320561
level1	SN_1_003	2009	urban	113130
level1	SN_1_003	2009	rural	748118
level1	SN_1_004	2009	urban	76183
level1	SN_1_004	2009	rural	562116
level1	SN_1_005	2009	urban	288289
level1	SN_1_005	2009	rural	622051
level1	SN_1_006	2009	urban	24407
level1	SN_1_006	2009	rural	124477
level1	SN_1_007	2009	urban	145120
level1	SN_1_007	2009	rural	546142
level1	SN_1_008	2009	urban	181072
level1	SN_1_008	2009	rural	800021
level1	SN_1_009	2009	urban	105066
level1	SN_1_009	2009	rural	515864
level1	SN_1_010	2009	urban	105066
level1	SN_1_010	2009	rural	515864
level1	SN_1_011	2009	urban	76841
level1	SN_1_011	2009	rural	416724
level1	SN_1_012	2009	urban	155388
level1	SN_1_012	2009	rural	590730
level1	SN_1_013	2009	urban	834185
level1	SN_1_013	2009	rural	1054152
level1	SN_1_014	2009	urban	381420
level1	SN_1_014	2009	rural	427385
level1	KE_1_030	2009	urban	61551
level1	KE_1_036	2009	urban	132255
level1	KE_1_039	2009	urban	298696
level1	KE_1_040	2009	urban	122190
level1	KE_1_028	2009	urban	53186
level1	KE_1_014	2009	urban	82921
level1	KE_1_007	2009	urban	146668
level1	KE_1_043	2009	urban	138051
level1	KE_1_011	2009	urban	62374
level1	KE_1_034	2009	urban	284862
level1	KE_1_037	2009	urban	252611
country	KE	2009	urban	12487375
level1	KE_1_035	2009	urban	228318
level1	KE_1_022	2009	urban	1017476
level1	KE_1_003	2009	urban	285482
level1	KE_1_020	2009	urban	83404
level1	KE_1_045	2009	urban	271719
level1	KE_1_042	2009	urban	507720
level1	KE_1_015	2009	urban	139909
level1	KE_1_002	2009	urban	117676
level1	KE_1_031	2009	urban	99117
level1	KE_1_005	2009	urban	20238
level1	KE_1_016	2009	urban	571355
level1	KE_1_017	2009	urban	104297
level1	KE_1_009	2009	urban	185568
level1	KE_1_010	2009	urban	64009
level1	KE_1_012	2009	urban	190497
level1	KE_1_044	2009	urban	311512
level1	KE_1_001	2009	urban	939370
level1	KE_1_021	2009	urban	145202
level1	KE_1_047	2009	urban	3138369
level1	KE_1_032	2009	urban	735025
level1	KE_1_029	2009	urban	102281
level1	KE_1_033	2009	urban	58494
level1	KE_1_046	2009	urban	68303
level1	KE_1_018	2009	urban	110518
level1	KE_1_019	2009	urban	169617
level1	KE_1_025	2009	urban	38664
level1	KE_1_041	2009	urban	90627
level1	KE_1_006	2009	urban	64289
level1	KE_1_004	2009	urban	36065
level1	KE_1_013	2009	urban	8535
level1	KE_1_026	2009	urban	167420
level1	KE_1_023	2009	urban	121719
level1	KE_1_027	2009	urban	345559
level1	KE_1_038	2009	urban	174105
level1	KE_1_008	2009	urban	96855
level1	KE_1_024	2009	urban	42696
level1	KE_1_030	2009	rural	494010
level1	KE_1_036	2009	rural	759580
level1	KE_1_039	2009	rural	1076367
level1	KE_1_040	2009	rural	621756
level1	KE_1_028	2009	rural	316812
level1	KE_1_014	2009	rural	433291
level1	KE_1_007	2009	rural	476392
level1	KE_1_043	2009	rural	825743
level1	KE_1_011	2009	rural	80920
level1	KE_1_034	2009	rural	402450
level1	KE_1_037	2009	rural	1408040
country	KE	2009	rural	26122722
level1	KE_1_035	2009	rural	362372
level1	KE_1_022	2009	rural	656309
level1	KE_1_003	2009	rural	824253
level1	KE_1_020	2009	rural	444650
level1	KE_1_045	2009	rural	991840
level1	KE_1_042	2009	rural	461189
level1	KE_1_015	2009	rural	872800
level1	KE_1_002	2009	rural	532255
level1	KE_1_031	2009	rural	300110
level1	KE_1_005	2009	rural	81301
level1	KE_1_016	2009	rural	527229
level1	KE_1_017	2009	rural	780230
level1	KE_1_009	2009	rural	840188
level1	KE_1_010	2009	rural	227157
level1	KE_1_012	2009	rural	1401036
level1	KE_1_044	2009	rural	605658
level1	KE_1_001	2009	rural	0
level1	KE_1_021	2009	rural	746876
level1	KE_1_047	2009	rural	0
level1	KE_1_032	2009	rural	868300
level1	KE_1_029	2009	rural	650684
level1	KE_1_033	2009	rural	792426
level1	KE_1_046	2009	rural	418672
level1	KE_1_018	2009	rural	485750
level1	KE_1_019	2009	rural	523941
level1	KE_1_025	2009	rural	185283
level1	KE_1_041	2009	rural	751677
level1	KE_1_006	2009	rural	220368
level1	KE_1_004	2009	rural	204010
level1	KE_1_013	2009	rural	121563
level1	KE_1_026	2009	rural	651337
level1	KE_1_023	2009	rural	733680
level1	KE_1_027	2009	rural	548620
level1	KE_1_038	2009	rural	380517
level1	KE_1_008	2009	rural	565086
level1	KE_1_024	2009	rural	469994
\.


--
-- Name: population_residence pk_population_residence; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_residence
    ADD CONSTRAINT pk_population_residence PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Residence");


--
-- PostgreSQL database dump complete
--

