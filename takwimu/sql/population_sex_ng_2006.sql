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

ALTER TABLE IF EXISTS ONLY public.population_sex_ng_2006 DROP CONSTRAINT IF EXISTS pk_population_sex_ng_2006;
DROP TABLE IF EXISTS public.population_sex_ng_2006;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_sex_ng_2006 (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "Population_Sex" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: ppopulation_sex_ng_2006; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_sex_ng_2006 (geo_level, geo_code, geo_version, "Population_Sex", total) FROM stdin;
country	NG	2009	male	98630184
country	NG	2009	female	94762333
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
\.


--
-- Name: population_sex pk_population_sex_ng_2006; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_sex_ng_2006
    ADD CONSTRAINT pk_population_sex_ng_2006 PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Sex");


--
-- PostgreSQL database dump complete
--

