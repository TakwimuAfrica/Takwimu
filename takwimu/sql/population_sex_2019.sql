--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

ALTER TABLE IF EXISTS ONLY public.population_sex_2019 DROP CONSTRAINT IF EXISTS pk_population_sex_2019;
DROP TABLE IF EXISTS public.population_sex_2019;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_sex_2019; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_sex_2019 (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    population_sex_2019 character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_sex_2019; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_sex_2019 (geo_level, geo_code, geo_version, population_sex_2019, total) FROM stdin;
level1	KE_1_001	2009	Female	598046
level1	KE_1_001	2009	Intersex	30
level1	KE_1_001	2009	Male	610257
level1	KE_1_002	2009	Female	441681
level1	KE_1_002	2009	Intersex	18
level1	KE_1_002	2009	Male	425121
level1	KE_1_003	2009	Female	749673
level1	KE_1_003	2009	Intersex	25
level1	KE_1_003	2009	Male	704089
level1	KE_1_004	2009	Female	157391
level1	KE_1_004	2009	Intersex	2
level1	KE_1_004	2009	Male	158550
level1	KE_1_005	2009	Female	67813
level1	KE_1_005	2009	Intersex	4
level1	KE_1_005	2009	Male	76103
level1	KE_1_006	2009	Female	167327
level1	KE_1_006	2009	Intersex	7
level1	KE_1_006	2009	Male	173337
level1	KE_1_007	2009	Female	382344
level1	KE_1_007	2009	Intersex	34
level1	KE_1_007	2009	Male	458975
level1	KE_1_008	2009	Female	365840
level1	KE_1_008	2009	Intersex	49
level1	KE_1_008	2009	Male	415374
level1	KE_1_009	2009	Female	432444
level1	KE_1_009	2009	Intersex	37
level1	KE_1_009	2009	Male	434976
level1	KE_1_010	2009	Female	216219
level1	KE_1_010	2009	Intersex	18
level1	KE_1_010	2009	Male	243548
level1	KE_1_011	2009	Female	128483
level1	KE_1_011	2009	Intersex	9
level1	KE_1_011	2009	Male	139510
level1	KE_1_012	2009	Female	777975
level1	KE_1_012	2009	Intersex	41
level1	KE_1_012	2009	Male	767698
level1	KE_1_013	2009	Female	199406
level1	KE_1_013	2009	Intersex	7
level1	KE_1_013	2009	Male	193764
level1	KE_1_014	2009	Female	304367
level1	KE_1_014	2009	Intersex	24
level1	KE_1_014	2009	Male	304208
level1	KE_1_015	2009	Female	587151
level1	KE_1_015	2009	Intersex	33
level1	KE_1_015	2009	Male	549003
level1	KE_1_016	2009	Female	711191
level1	KE_1_016	2009	Intersex	34
level1	KE_1_016	2009	Male	710707
level1	KE_1_017	2009	Female	497942
level1	KE_1_017	2009	Intersex	20
level1	KE_1_017	2009	Male	489691
level1	KE_1_018	2009	Female	323247
level1	KE_1_018	2009	Intersex	20
level1	KE_1_018	2009	Male	315022
level1	KE_1_019	2009	Female	384845
level1	KE_1_019	2009	Intersex	31
level1	KE_1_019	2009	Male	374288
level1	KE_1_020	2009	Female	308369
level1	KE_1_020	2009	Intersex	31
level1	KE_1_020	2009	Male	302011
level1	KE_1_021	2009	Female	532669
level1	KE_1_021	2009	Intersex	31
level1	KE_1_021	2009	Male	523940
level1	KE_1_022	2009	Female	1230454
level1	KE_1_022	2009	Intersex	135
level1	KE_1_022	2009	Male	1187146
level1	KE_1_023	2009	Female	448868
level1	KE_1_023	2009	Intersex	21
level1	KE_1_023	2009	Male	478087
level1	KE_1_024	2009	Female	314213
level1	KE_1_024	2009	Intersex	15
level1	KE_1_024	2009	Male	307013
level1	KE_1_025	2009	Female	153546
level1	KE_1_025	2009	Intersex	7
level1	KE_1_025	2009	Male	156774
level1	KE_1_026	2009	Female	501206
level1	KE_1_026	2009	Intersex	28
level1	KE_1_026	2009	Male	489107
level1	KE_1_027	2009	Female	582889
level1	KE_1_027	2009	Intersex	28
level1	KE_1_027	2009	Male	580269
level1	KE_1_028	2009	Female	227151
level1	KE_1_028	2009	Intersex	12
level1	KE_1_028	2009	Male	227317
level1	KE_1_029	2009	Female	444430
level1	KE_1_029	2009	Intersex	22
level1	KE_1_029	2009	Male	441259
level1	KE_1_030	2009	Female	330428
level1	KE_1_030	2009	Intersex	13
level1	KE_1_030	2009	Male	336322
level1	KE_1_031	2009	Female	259102
level1	KE_1_031	2009	Intersex	18
level1	KE_1_031	2009	Male	259440
level1	KE_1_032	2009	Female	1084835
level1	KE_1_032	2009	Intersex	95
level1	KE_1_032	2009	Male	1077272
level1	KE_1_033	2009	Female	578805
level1	KE_1_033	2009	Intersex	26
level1	KE_1_033	2009	Male	579042
level1	KE_1_034	2009	Female	560704
level1	KE_1_034	2009	Intersex	38
level1	KE_1_034	2009	Male	557098
level1	KE_1_035	2009	Female	451008
level1	KE_1_035	2009	Intersex	28
level1	KE_1_035	2009	Male	450741
level1	KE_1_036	2009	Female	441379
level1	KE_1_036	2009	Intersex	23
level1	KE_1_036	2009	Male	434287
level1	KE_1_037	2009	Female	970406
level1	KE_1_037	2009	Intersex	40
level1	KE_1_037	2009	Male	897133
level1	KE_1_038	2009	Female	306323
level1	KE_1_038	2009	Intersex	12
level1	KE_1_038	2009	Male	283678
level1	KE_1_039	2009	Female	858389
level1	KE_1_039	2009	Intersex	35
level1	KE_1_039	2009	Male	812146
level1	KE_1_040	2009	Female	467401
level1	KE_1_040	2009	Intersex	28
level1	KE_1_040	2009	Male	426252
level1	KE_1_041	2009	Female	521496
level1	KE_1_041	2009	Intersex	18
level1	KE_1_041	2009	Male	471669
level1	KE_1_042	2009	Female	594609
level1	KE_1_042	2009	Intersex	23
level1	KE_1_042	2009	Male	560942
level1	KE_1_043	2009	Female	592367
level1	KE_1_043	2009	Intersex	23
level1	KE_1_043	2009	Male	539560
level1	KE_1_044	2009	Female	580214
level1	KE_1_044	2009	Intersex	35
level1	KE_1_044	2009	Male	536187
level1	KE_1_045	2009	Female	661038
level1	KE_1_045	2009	Intersex	38
level1	KE_1_045	2009	Male	605784
level1	KE_1_046	2009	Female	314656
level1	KE_1_046	2009	Intersex	13
level1	KE_1_046	2009	Male	290907
level1	KE_1_047	2009	Female	2204376
level1	KE_1_047	2009	Intersex	245
level1	KE_1_047	2009	Male	2192452
country	KE	2009	Female	24014716
country	KE	2009	Intersex	1524
country	KE	2009	Male	23548056
\.


--
-- Name: population_sex_2019 pk_population_sex_2019; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_sex_2019
    ADD CONSTRAINT pk_population_sex_2019 PRIMARY KEY (geo_level, geo_code, geo_version, population_sex_2019);


--
-- PostgreSQL database dump complete
--

