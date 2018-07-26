--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)
-- Dumped by pg_dump version 10.4 (Ubuntu 10.4-0ubuntu0.18.04)

-- Started on 2018-07-26 10:35:47 EAT

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
-- TOC entry 357 (class 1259 OID 26717)
-- Name: population_sex; Type: TABLE; Schema: public; Owner: takwimu
--

CREATE TABLE public.population_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Sex" character varying(128) NOT NULL,
    total integer
);


ALTER TABLE public.population_sex OWNER TO takwimu;

--
-- TOC entry 3373 (class 0 OID 26717)
-- Dependencies: 357
-- Data for Name: population_sex; Type: TABLE DATA; Schema: public; Owner: takwimu
--

COPY public.population_sex (geo_level, geo_code, geo_version, "Population_Sex", total) FROM stdin;
country	TZ	2009	male	21869990
country	TZ	2009	female	23058933
country	NG	2009	male	98630184
country	NG	2009	female	94762333
country	SN	2009	male	6735421
country	SN	2009	female	6773294
level1	TZ_1_001	2009	male	769375
level1	TZ_1_001	2009	female	821541
level1	TZ_1_002	2009	male	2023171
level1	TZ_1_002	2009	female	2134327
level1	TZ_1_003	2009	male	947761
level1	TZ_1_003	2009	female	1002011
level1	TZ_1_004	2009	male	795958
level1	TZ_1_004	2009	female	813427
level1	TZ_1_005	2009	male	424707
level1	TZ_1_005	2009	female	461568
level1	TZ_1_006	2009	male	1121810
level1	TZ_1_006	2009	female	1167431
level1	TZ_1_007	2009	male	95784
level1	TZ_1_007	2009	female	101349
level1	TZ_1_008	2009	male	86525
level1	TZ_1_008	2009	female	89856
level1	TZ_1_009	2009	male	259218
level1	TZ_1_009	2009	female	264075
level1	TZ_1_010	2009	male	954333
level1	TZ_1_010	2009	female	1023563
level1	TZ_1_011	2009	male	748491
level1	TZ_1_011	2009	female	802391
level1	TZ_1_012	2009	male	87151
level1	TZ_1_012	2009	female	94760
level1	TZ_1_013	2009	male	54641
level1	TZ_1_013	2009	female	54618
level1	TZ_1_014	2009	male	390779
level1	TZ_1_014	2009	female	426364
level1	TZ_1_015	2009	male	667130
level1	TZ_1_015	2009	female	659195
level1	TZ_1_016	2009	male	840020
level1	TZ_1_016	2009	female	903810
level1	TZ_1_017	2009	male	1218003
level1	TZ_1_017	2009	female	1328536
level1	TZ_1_018	2009	male	1029174
level1	TZ_1_018	2009	female	1060944
level1	TZ_1_019	2009	male	563600
level1	TZ_1_019	2009	female	635774
level1	TZ_1_020	2009	male	1264188
level1	TZ_1_020	2009	female	1316297
level1	TZ_1_022	2009	male	505684
level1	TZ_1_022	2009	female	529507
level1	TZ_1_023	2009	male	449721
level1	TZ_1_023	2009	female	478744
level1	TZ_1_024	2009	male	628250
level1	TZ_1_024	2009	female	666816
level1	TZ_1_025	2009	male	698080
level1	TZ_1_025	2009	female	731262
level1	TZ_1_026	2009	male	702779
level1	TZ_1_026	2009	female	766997
level1	TZ_1_027	2009	male	632744
level1	TZ_1_027	2009	female	648427
level1	TZ_1_028	2009	male	926743
level1	TZ_1_028	2009	female	987675
level1	TZ_1_029	2009	male	1051197
level1	TZ_1_029	2009	female	1084414
level1	TZ_1_030	2009	male	266935
level1	TZ_1_030	2009	female	293361
level1	TZ_1_021	2009	male	309733
level1	TZ_1_021	2009	female	352927
level1	NG_1_001	2009	male	1900947
level1	NG_1_001	2009	female	1826400
level1	NG_1_002	2009	male	2166702
level1	NG_1_002	2009	female	2081734
level1	NG_1_003	2009	male	2795910
level1	NG_1_003	2009	female	2686267
level1	NG_1_004	2009	male	2819182
level1	NG_1_004	2009	female	2708626
level1	NG_1_005	2009	male	3334030
level1	NG_1_005	2009	female	3203284
level1	NG_1_006	2009	male	1161760
level1	NG_1_006	2009	female	1116201
level1	NG_1_007	2009	male	2928326
level1	NG_1_007	2009	female	2813489
level1	NG_1_008	2009	male	2988693
level1	NG_1_008	2009	female	2871489
level1	NG_1_009	2009	male	1971797
level1	NG_1_009	2009	female	1894472
level1	NG_1_010	2009	male	2888315
level1	NG_1_010	2009	female	2775047
level1	NG_1_011	2009	male	1468996
level1	NG_1_011	2009	female	1411388
level1	NG_1_012	2009	male	2160153
level1	NG_1_012	2009	female	2075441
level1	NG_1_013	2009	male	1668107
level1	NG_1_013	2009	female	1602691
level1	NG_1_014	2009	male	2249670
level1	NG_1_014	2009	female	2161448
level1	NG_1_015	2009	male	1817704
level1	NG_1_015	2009	female	1746422
level1	NG_1_016	2009	male	1661051
level1	NG_1_016	2009	female	1595912
level1	NG_1_017	2009	male	2758466
level1	NG_1_017	2009	female	2650290
level1	NG_1_018	2009	male	2972363
level1	NG_1_018	2009	female	2855800
level1	NG_1_019	2009	male	4208707
level1	NG_1_019	2009	female	4043659
level1	NG_1_020	2009	male	6669215
level1	NG_1_020	2009	female	6407677
level1	NG_1_021	2009	male	3993973
level1	NG_1_021	2009	female	3837346
level1	NG_1_022	2009	male	2264425
level1	NG_1_022	2009	female	2175624
level1	NG_1_023	2009	male	2281480
level1	NG_1_023	2009	female	2192010
level1	NG_1_024	2009	male	1628375
level1	NG_1_024	2009	female	1564517
level1	NG_1_025	2009	male	6400805
level1	NG_1_025	2009	female	6149793
level1	NG_1_026	2009	male	1286931
level1	NG_1_026	2009	female	1236464
level1	NG_1_027	2009	male	2833686
level1	NG_1_027	2009	female	2722561
level1	NG_1_028	2009	male	2661035
level1	NG_1_028	2009	female	2556681
level1	NG_1_029	2009	male	2382565
level1	NG_1_029	2009	female	2289131
level1	NG_1_030	2009	male	2399850
level1	NG_1_030	2009	female	2305739
level1	NG_1_031	2009	male	3998840
level1	NG_1_031	2009	female	3842023
level1	NG_1_032	2009	male	2142225
level1	NG_1_032	2009	female	2058216
level1	NG_1_033	2009	male	3725001
level1	NG_1_033	2009	female	3578923
level1	NG_1_034	2009	male	2549026
level1	NG_1_034	2009	female	2449064
level1	NG_1_035	2009	male	1564085
level1	NG_1_035	2009	female	1502749
level1	NG_1_036	2009	male	1680010
level1	NG_1_036	2009	female	1614127
level1	NG_1_037	2009	male	2302868
level1	NG_1_037	2009	female	2212559
level1	SN_1_001	2009	male	1466748
level1	SN_1_001	2009	female	1460674
level1	SN_1_002	2009	male	748250
level1	SN_1_002	2009	female	813727
level1	SN_1_003	2009	male	428902
level1	SN_1_003	2009	female	432346
level1	SN_1_004	2009	male	316401
level1	SN_1_004	2009	female	321898
level1	SN_1_005	2009	male	445084
level1	SN_1_005	2009	female	465256
level1	SN_1_006	2009	male	72517
level1	SN_1_006	2009	female	76367
level1	SN_1_007	2009	male	347161
level1	SN_1_007	2009	female	344101
level1	SN_1_008	2009	male	482001
level1	SN_1_008	2009	female	499092
level1	SN_1_009	2009	male	300538
level1	SN_1_009	2009	female	320392
level1	SN_1_010	2009	male	503665
level1	SN_1_010	2009	female	521247
level1	SN_1_011	2009	male	244380
level1	SN_1_011	2009	female	249185
level1	SN_1_012	2009	male	372837
level1	SN_1_012	2009	female	373281
level1	SN_1_013	2009	male	945267
level1	SN_1_013	2009	female	943070
level1	SN_1_014	2009	male	403799
level1	SN_1_014	2009	female	405006
\.


--
-- TOC entry 3251 (class 2606 OID 26722)
-- Name: population_sex pk_population_sex; Type: CONSTRAINT; Schema: public; Owner: takwimu
--

ALTER TABLE ONLY public.population_sex
    ADD CONSTRAINT pk_population_sex PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Sex");


-- Completed on 2018-07-26 10:35:48 EAT

--
-- PostgreSQL database dump complete
--

