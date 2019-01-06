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

ALTER TABLE IF EXISTS ONLY public.population_sex_ke_2009 DROP CONSTRAINT IF EXISTS pk_population_sex_ke_2009;
DROP TABLE IF EXISTS public.population_sex_ke_2009;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_sex_ke_2009; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_sex_ke_2009 (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Sex" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_sex_ke_2009; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_sex_ke_2009 (geo_level, geo_code, geo_version, "Population_Sex", total) FROM stdin;
level1	KE_1_030	2009	female	276480
level1	KE_1_036	2009	female	449005
level1	KE_1_039	2009	female	703515
level1	KE_1_040	2009	female	387824
level1	KE_1_028	2009	female	186260
level1	KE_1_014	2009	female	261909
level1	KE_1_007	2009	female	288121
level1	KE_1_043	2009	female	501340
level1	KE_1_011	2009	female	69600
level1	KE_1_034	2009	female	342166
level1	KE_1_037	2009	female	859662
country	KE	2009	female	19417639
level1	KE_1_035	2009	female	291813
level1	KE_1_022	2009	female	845985
level1	KE_1_003	2009	female	574209
level1	KE_1_020	2009	female	267424
level1	KE_1_045	2009	female	660612
level1	KE_1_042	2009	female	494149
level1	KE_1_015	2009	female	531427
level1	KE_1_002	2009	female	333934
level1	KE_1_031	2009	female	200602
level1	KE_1_005	2009	female	48494
level1	KE_1_016	2009	female	555445
level1	KE_1_017	2009	female	453817
level1	KE_1_009	2009	female	465813
level1	KE_1_010	2009	female	140054
level1	KE_1_012	2009	female	805313
level1	KE_1_044	2009	female	472814
level1	KE_1_001	2009	female	452446
level1	KE_1_021	2009	female	459405
level1	KE_1_047	2009	female	1533139
level1	KE_1_032	2009	female	798743
level1	KE_1_029	2009	female	376477
level1	KE_1_033	2009	female	421894
level1	KE_1_046	2009	female	252410
level1	KE_1_018	2009	female	304113
level1	KE_1_019	2009	female	353833
level1	KE_1_025	2009	female	111940
level1	KE_1_041	2009	female	443652
level1	KE_1_006	2009	female	139323
level1	KE_1_004	2009	female	120222
level1	KE_1_013	2009	female	67211
level1	KE_1_026	2009	female	411585
level1	KE_1_023	2009	female	410330
level1	KE_1_027	2009	female	445185
level1	KE_1_038	2009	female	291906
level1	KE_1_008	2009	female	298175
level1	KE_1_024	2009	female	257863
level1	KE_1_030	2009	male	279081
level1	KE_1_036	2009	male	442830
level1	KE_1_039	2009	male	671548
level1	KE_1_040	2009	male	356122
level1	KE_1_028	2009	male	183738
level1	KE_1_014	2009	male	254303
level1	KE_1_007	2009	male	334939
level1	KE_1_043	2009	male	462454
level1	KE_1_011	2009	male	73694
level1	KE_1_034	2009	male	345146
level1	KE_1_037	2009	male	800989
country	KE	2009	male	19192458
level1	KE_1_035	2009	male	298877
level1	KE_1_022	2009	male	827800
level1	KE_1_003	2009	male	535526
level1	KE_1_020	2009	male	260630
level1	KE_1_045	2009	male	602947
level1	KE_1_042	2009	male	474760
level1	KE_1_015	2009	male	481282
level1	KE_1_002	2009	male	315997
level1	KE_1_031	2009	male	198625
level1	KE_1_005	2009	male	53045
level1	KE_1_016	2009	male	543139
level1	KE_1_017	2009	male	430710
level1	KE_1_009	2009	male	559943
level1	KE_1_010	2009	male	151112
level1	KE_1_012	2009	male	786220
level1	KE_1_044	2009	male	444356
level1	KE_1_001	2009	male	486924
level1	KE_1_021	2009	male	432673
level1	KE_1_047	2009	male	1605230
level1	KE_1_032	2009	male	804582
level1	KE_1_029	2009	male	376488
level1	KE_1_033	2009	male	429026
level1	KE_1_046	2009	male	234565
level1	KE_1_018	2009	male	292155
level1	KE_1_019	2009	male	339725
level1	KE_1_025	2009	male	112007
level1	KE_1_041	2009	male	398652
level1	KE_1_006	2009	male	145334
level1	KE_1_004	2009	male	119853
level1	KE_1_013	2009	male	62887
level1	KE_1_026	2009	male	407172
level1	KE_1_023	2009	male	445069
level1	KE_1_027	2009	male	448994
level1	KE_1_038	2009	male	262716
level1	KE_1_008	2009	male	363766
level1	KE_1_024	2009	male	254827
\.


--
-- Name: population_sex_ke_2009 pk_population_sex_ke_2009; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_sex_ke_2009
    ADD CONSTRAINT pk_population_sex_ke_2009 PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Sex");


--
-- PostgreSQL database dump complete
--

