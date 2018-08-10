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

ALTER TABLE IF EXISTS ONLY public.registered_accredited_voters DROP CONSTRAINT IF EXISTS pk_registered_accredited_voters;
DROP TABLE IF EXISTS public.registered_accredited_voters;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: registered_accredited_voters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registered_accredited_voters (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    voters character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: registered_accredited_voters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registered_accredited_voters (geo_level, geo_code, geo_version, voters, total) FROM stdin;
country	TZ	2009	Total Registered Voters	23161440
level1	TZ_1_001	2009	Total Registered Voters	1004562
level1	TZ_1_002	2009	Total Registered Voters	2807408
level1	TZ_1_003	2009	Total Registered Voters	1065849
level1	TZ_1_004	2009	Total Registered Voters	880366
level1	TZ_1_005	2009	Total Registered Voters	523345
level1	TZ_1_006	2009	Total Registered Voters	1046935
level1	TZ_1_007	2009	Total Registered Voters	81205
level1	TZ_1_008	2009	Total Registered Voters	85975
level1	TZ_1_009	2009	Total Registered Voters	321475
level1	TZ_1_010	2009	Total Registered Voters	789392
level1	TZ_1_011	2009	Total Registered Voters	796328
level1	TZ_1_012	2009	Total Registered Voters	83545
level1	TZ_1_013	2009	Total Registered Voters	64802
level1	TZ_1_014	2009	Total Registered Voters	1142120
level1	TZ_1_015	2009	Total Registered Voters	671249
level1	TZ_1_016	2009	Total Registered Voters	889474
level1	TZ_1_017	2009	Total Registered Voters	1390213
level1	TZ_1_018	2009	Total Registered Voters	1252525
level1	TZ_1_019	2009	Total Registered Voters	725620
level1	TZ_1_020	2009	Total Registered Voters	1446687
level1	TZ_1_022	2009	Total Registered Voters	697283
level1	TZ_1_023	2009	Total Registered Voters	463251
level1	TZ_1_024	2009	Total Registered Voters	735606
level1	TZ_1_025	2009	Total Registered Voters	769906
level1	TZ_1_026	2009	Total Registered Voters	713169
level1	TZ_1_027	2009	Total Registered Voters	642349
level1	TZ_1_028	2009	Total Registered Voters	1000377
level1	TZ_1_029	2009	Total Registered Voters	1093088
level1	TZ_1_030	2009	Total Registered Voters	229584
level1	TZ_1_021	2009	Total Registered Voters	378614
country	NG	2009	Total Registered Voters	67422005
level1	NG_1_001	2009	Total Registered Voters	1349134
level1	NG_1_002	2009	Total Registered Voters	1518123
level1	NG_1_003	2009	Total Registered Voters	1644481
level1	NG_1_004	2009	Total Registered Voters	1963427
level1	NG_1_005	2009	Total Registered Voters	2053484
level1	NG_1_006	2009	Total Registered Voters	605637
level1	NG_1_007	2009	Total Registered Voters	1893596
level1	NG_1_008	2009	Total Registered Voters	1799669
level1	NG_1_009	2009	Total Registered Voters	1144288
level1	NG_1_010	2009	Total Registered Voters	2044372
level1	NG_1_011	2009	Total Registered Voters	1071226
level1	NG_1_012	2009	Total Registered Voters	1650552
level1	NG_1_013	2009	Total Registered Voters	723255
level1	NG_1_014	2009	Total Registered Voters	1381563
level1	NG_1_015	2009	Total Registered Voters	886573
level1	NG_1_016	2009	Total Registered Voters	1110105
level1	NG_1_017	2009	Total Registered Voters	1747681
level1	NG_1_018	2009	Total Registered Voters	1815839
level1	NG_1_019	2009	Total Registered Voters	3361793
level1	NG_1_020	2009	Total Registered Voters	4943862
level1	NG_1_021	2009	Total Registered Voters	2842741
level1	NG_1_022	2009	Total Registered Voters	1457763
level1	NG_1_023	2009	Total Registered Voters	1350883
level1	NG_1_024	2009	Total Registered Voters	1181032
level1	NG_1_025	2009	Total Registered Voters	5827846
level1	NG_1_026	2009	Total Registered Voters	1222054
level1	NG_1_027	2009	Total Registered Voters	1995679
level1	NG_1_028	2009	Total Registered Voters	1709409
level1	NG_1_029	2009	Total Registered Voters	1501549
level1	NG_1_030	2009	Total Registered Voters	1378113
level1	NG_1_031	2009	Total Registered Voters	2344448
level1	NG_1_032	2009	Total Registered Voters	1977211
level1	NG_1_033	2009	Total Registered Voters	2324300
level1	NG_1_034	2009	Total Registered Voters	1663127
level1	NG_1_035	2009	Total Registered Voters	1374307
level1	NG_1_036	2009	Total Registered Voters	1077942
level1	NG_1_037	2009	Total Registered Voters	1484941
country	SN	2009	Total Registered Voters	5301648
level1	SN_1_001	2009	Total Registered Voters	1558350
level1	SN_1_002	2009	Total Registered Voters	448135
level1	SN_1_003	2009	Total Registered Voters	231749
level1	SN_1_004	2009	Total Registered Voters	172091
level1	SN_1_005	2009	Total Registered Voters	339486
level1	SN_1_006	2009	Total Registered Voters	43936
level1	SN_1_007	2009	Total Registered Voters	190027
level1	SN_1_008	2009	Total Registered Voters	326161
level1	SN_1_009	2009	Total Registered Voters	186965
level1	SN_1_010	2009	Total Registered Voters	382554
level1	SN_1_011	2009	Total Registered Voters	153238
level1	SN_1_012	2009	Total Registered Voters	188174
level1	SN_1_013	2009	Total Registered Voters	672048
level1	SN_1_014	2009	Total Registered Voters	219522
country	TZ	2009	Total Votes Cast	15596110
level1	TZ_1_001	2009	Total Votes Cast	729975
level1	TZ_1_002	2009	Total Votes Cast	1634451
level1	TZ_1_003	2009	Total Votes Cast	709890
level1	TZ_1_004	2009	Total Votes Cast	562221
level1	TZ_1_005	2009	Total Votes Cast	384615
level1	TZ_1_006	2009	Total Votes Cast	786998
level1	TZ_1_007	2009	Total Votes Cast	67913
level1	TZ_1_008	2009	Total Votes Cast	67292
level1	TZ_1_009	2009	Total Votes Cast	186143
level1	TZ_1_010	2009	Total Votes Cast	518478
level1	TZ_1_011	2009	Total Votes Cast	576110
level1	TZ_1_012	2009	Total Votes Cast	64753
level1	TZ_1_013	2009	Total Votes Cast	52624
level1	TZ_1_014	2009	Total Votes Cast	849846
level1	TZ_1_015	2009	Total Votes Cast	510845
level1	TZ_1_016	2009	Total Votes Cast	629900
level1	TZ_1_017	2009	Total Votes Cast	1003364
level1	TZ_1_018	2009	Total Votes Cast	835805
level1	TZ_1_019	2009	Total Votes Cast	543028
level1	TZ_1_020	2009	Total Votes Cast	947400
level1	TZ_1_022	2009	Total Votes Cast	449630
level1	TZ_1_023	2009	Total Votes Cast	319983
level1	TZ_1_024	2009	Total Votes Cast	491507
level1	TZ_1_025	2009	Total Votes Cast	480251
level1	TZ_1_026	2009	Total Votes Cast	523160
level1	TZ_1_027	2009	Total Votes Cast	423988
level1	TZ_1_028	2009	Total Votes Cast	642392
level1	TZ_1_029	2009	Total Votes Cast	624312
level1	TZ_1_030	2009	Total Votes Cast	173713
level1	TZ_1_021	2009	Total Votes Cast	272967
country	NG	2009	Total Votes Cast	31746490
level1	NG_1_001	2009	Total Votes Cast	442538
level1	NG_1_002	2009	Total Votes Cast	709993
level1	NG_1_003	2009	Total Votes Cast	1074070
level1	NG_1_004	2009	Total Votes Cast	774430
level1	NG_1_005	2009	Total Votes Cast	1094069
level1	NG_1_006	2009	Total Votes Cast	384789
level1	NG_1_007	2009	Total Votes Cast	754634
level1	NG_1_008	2009	Total Votes Cast	544759
level1	NG_1_009	2009	Total Votes Cast	500577
level1	NG_1_010	2009	Total Votes Cast	1350914
level1	NG_1_011	2009	Total Votes Cast	425301
level1	NG_1_012	2009	Total Votes Cast	599166
level1	NG_1_013	2009	Total Votes Cast	323739
level1	NG_1_014	2009	Total Votes Cast	616112
level1	NG_1_015	2009	Total Votes Cast	344056
level1	NG_1_016	2009	Total Votes Cast	515828
level1	NG_1_017	2009	Total Votes Cast	801712
level1	NG_1_018	2009	Total Votes Cast	1153428
level1	NG_1_019	2009	Total Votes Cast	1746031
level1	NG_1_020	2009	Total Votes Cast	2364434
level1	NG_1_021	2009	Total Votes Cast	1578646
level1	NG_1_022	2009	Total Votes Cast	792817
level1	NG_1_023	2009	Total Votes Cast	476839
level1	NG_1_024	2009	Total Votes Cast	489360
level1	NG_1_025	2009	Total Votes Cast	1678754
level1	NG_1_026	2009	Total Votes Cast	562959
level1	NG_1_027	2009	Total Votes Cast	933607
level1	NG_1_028	2009	Total Votes Cast	594975
level1	NG_1_029	2009	Total Votes Cast	618040
level1	NG_1_030	2009	Total Votes Cast	683169
level1	NG_1_031	2009	Total Votes Cast	1073849
level1	NG_1_032	2009	Total Votes Cast	1076833
level1	NG_1_033	2009	Total Votes Cast	1643409
level1	NG_1_034	2009	Total Votes Cast	988899
level1	NG_1_035	2009	Total Votes Cast	638578
level1	NG_1_036	2009	Total Votes Cast	520127
level1	NG_1_037	2009	Total Votes Cast	875049
country	SN	2009	Total Votes Cast	2915893
level1	SN_1_001	2009	Total Votes Cast	754151
level1	SN_1_002	2009	Total Votes Cast	204021
level1	SN_1_003	2009	Total Votes Cast	137928
level1	SN_1_004	2009	Total Votes Cast	101021
level1	SN_1_005	2009	Total Votes Cast	185330
level1	SN_1_006	2009	Total Votes Cast	23769
level1	SN_1_007	2009	Total Votes Cast	106757
level1	SN_1_008	2009	Total Votes Cast	183882
level1	SN_1_009	2009	Total Votes Cast	109561
level1	SN_1_010	2009	Total Votes Cast	210642
level1	SN_1_011	2009	Total Votes Cast	83210
level1	SN_1_012	2009	Total Votes Cast	99359
level1	SN_1_013	2009	Total Votes Cast	371655
level1	SN_1_014	2009	Total Votes Cast	88488
\.


--
-- Name: registered_accredited_voters pk_registered_accredited_voters; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registered_accredited_voters
    ADD CONSTRAINT pk_registered_accredited_voters PRIMARY KEY (geo_level, geo_code, geo_version, voters);


--
-- PostgreSQL database dump complete
--

