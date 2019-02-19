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

ALTER TABLE IF EXISTS ONLY public.population_residence_2009 DROP CONSTRAINT IF EXISTS pk_population_residence_2009;
DROP TABLE IF EXISTS public.population_residence_2009;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_residence_2009; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_residence_2009 (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "population_residence_2009" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_residence_2009; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_residence_2009 (geo_level, geo_code, geo_version, "population_residence_2009", total) FROM stdin;
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
-- Name: population_residence_2009 pk_population_residence_2009; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_residence_2009
    ADD CONSTRAINT pk_population_residence_2009 PRIMARY KEY (geo_level, geo_code, geo_version, "population_residence_2009");


--
-- PostgreSQL database dump complete
--

