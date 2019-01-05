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

ALTER TABLE IF EXISTS ONLY public.population_sex DROP CONSTRAINT IF EXISTS pk_population_sex;
DROP TABLE IF EXISTS public.population_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Sex" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_sex (geo_level, geo_code, geo_version, "Population_Sex", total) FROM stdin;
country	TZ	2009	male	21869990
country	TZ	2009	female	23058933
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
\.


--
-- Name: population_sex pk_population_sex; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_sex
    ADD CONSTRAINT pk_population_sex PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Sex");


--
-- PostgreSQL database dump complete
--

