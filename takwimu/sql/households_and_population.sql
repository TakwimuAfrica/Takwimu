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

ALTER TABLE IF EXISTS ONLY public.households_and_population DROP CONSTRAINT IF EXISTS pk_households_and_population;
DROP TABLE IF EXISTS public.households_and_population;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: households_and_population; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.households_and_population (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year character varying(128) NOT NULL,
    variable character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: households_and_population; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.households_and_population (geo_level, geo_code, geo_version, year, variable, total) FROM stdin;
level1	KE_1_030	2009	2019	Population	662760
level1	KE_1_036	2009	2019	Population	873023
level1	KE_1_039	2009	2019	Population	1663898
level1	KE_1_040	2009	2019	Population	886856
level1	KE_1_028	2009	2019	Population	453403
level1	KE_1_014	2009	2019	Population	604769
level1	KE_1_007	2009	2019	Population	835482
level1	KE_1_043	2009	2019	Population	1125823
level1	KE_1_011	2009	2019	Population	267997
level1	KE_1_034	2009	2019	Population	1107296
level1	KE_1_037	2009	2019	Population	1861332
country	KE	2009	2019	Population	47213282
level1	KE_1_035	2009	2019	Population	896863
level1	KE_1_022	2009	2019	Population	2402834
level1	KE_1_003	2009	2019	Population	1440958
level1	KE_1_020	2009	2019	Population	605630
level1	KE_1_045	2009	2019	Population	1260509
level1	KE_1_042	2009	2019	Population	1144777
level1	KE_1_015	2009	2019	Population	1130134
level1	KE_1_002	2009	2019	Population	858748
level1	KE_1_031	2009	2019	Population	513879
level1	KE_1_005	2009	2019	Population	141909
level1	KE_1_016	2009	2019	Population	1414022
level1	KE_1_017	2009	2019	Population	977015
level1	KE_1_009	2009	2019	Population	862079
level1	KE_1_010	2009	2019	Population	447150
level1	KE_1_012	2009	2019	Population	1535635
level1	KE_1_044	2009	2019	Population	1108950
level1	KE_1_001	2009	2019	Population	1190987
level1	KE_1_021	2009	2019	Population	1053059
level1	KE_1_047	2009	2019	Population	4337080
level1	KE_1_032	2009	2019	Population	2142667
level1	KE_1_029	2009	2019	Population	883634
level1	KE_1_033	2009	2019	Population	1149379
level1	KE_1_046	2009	2019	Population	603051
level1	KE_1_018	2009	2019	Population	636002
level1	KE_1_019	2009	2019	Population	752695
level1	KE_1_025	2009	2019	Population	307957
level1	KE_1_041	2009	2019	Population	989708
level1	KE_1_006	2009	2019	Population	335747
level1	KE_1_004	2009	2019	Population	314710
level1	KE_1_013	2009	2019	Population	391303
level1	KE_1_026	2009	2019	Population	985333
level1	KE_1_023	2009	2019	Population	922210
level1	KE_1_027	2009	2019	Population	1152671
level1	KE_1_038	2009	2019	Population	587189
level1	KE_1_008	2009	2019	Population	775302
level1	KE_1_024	2009	2019	Population	618867
level1	KE_1_030	2009	2019	Number of Households	142518
level1	KE_1_036	2009	2019	Number of Households	187641
level1	KE_1_039	2009	2019	Number of Households	358796
level1	KE_1_040	2009	2019	Number of Households	198152
level1	KE_1_028	2009	2019	Number of Households	99861
level1	KE_1_014	2009	2019	Number of Households	182743
level1	KE_1_007	2009	2019	Number of Households	141394
level1	KE_1_043	2009	2019	Number of Households	262036
level1	KE_1_011	2009	2019	Number of Households	58072
level1	KE_1_034	2009	2019	Number of Households	316179
level1	KE_1_037	2009	2019	Number of Households	433207
country	KE	2009	2019	Number of Households	12143913
level1	KE_1_035	2009	2019	Number of Households	206036
level1	KE_1_022	2009	2019	Number of Households	795241
level1	KE_1_003	2009	2019	Number of Households	298472
level1	KE_1_020	2009	2019	Number of Households	204188
level1	KE_1_045	2009	2019	Number of Households	308054
level1	KE_1_042	2009	2019	Number of Households	300745
level1	KE_1_015	2009	2019	Number of Households	262942
level1	KE_1_002	2009	2019	Number of Households	173176
level1	KE_1_031	2009	2019	Number of Households	149271
level1	KE_1_005	2009	2019	Number of Households	37963
level1	KE_1_016	2009	2019	Number of Households	402466
level1	KE_1_017	2009	2019	Number of Households	244669
level1	KE_1_009	2009	2019	Number of Households	125763
level1	KE_1_010	2009	2019	Number of Households	77495
level1	KE_1_012	2009	2019	Number of Households	426360
level1	KE_1_044	2009	2019	Number of Households	240168
level1	KE_1_001	2009	2019	Number of Households	378422
level1	KE_1_021	2009	2019	Number of Households	318105
level1	KE_1_047	2009	2019	Number of Households	1506888
level1	KE_1_032	2009	2019	Number of Households	616046
level1	KE_1_029	2009	2019	Number of Households	199426
level1	KE_1_033	2009	2019	Number of Households	241125
level1	KE_1_046	2009	2019	Number of Households	150669
level1	KE_1_018	2009	2019	Number of Households	179686
level1	KE_1_019	2009	2019	Number of Households	248050
level1	KE_1_025	2009	2019	Number of Households	65910
level1	KE_1_041	2009	2019	Number of Households	250698
level1	KE_1_006	2009	2019	Number of Households	96429
level1	KE_1_004	2009	2019	Number of Households	68242
level1	KE_1_013	2009	2019	Number of Households	109860
level1	KE_1_026	2009	2019	Number of Households	223808
level1	KE_1_023	2009	2019	Number of Households	164519
level1	KE_1_027	2009	2019	Number of Households	304943
level1	KE_1_038	2009	2019	Number of Households	143365
level1	KE_1_008	2009	2019	Number of Households	127932
level1	KE_1_024	2009	2019	Number of Households	116182
\.


--
-- Name: households_and_population pk_households_and_population; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.households_and_population
    ADD CONSTRAINT pk_households_and_population PRIMARY KEY (geo_level, geo_code, geo_version, year, variable);


--
-- PostgreSQL database dump complete
--

