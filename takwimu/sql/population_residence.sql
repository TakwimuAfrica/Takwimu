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
country	NG	2009	urban	0
country	NG	2009	rural	0
country	SN	2009	urban	6102800
country	SN	2009	rural	7405915
level1	TZ_1_001	2009	urban	530630
level1	TZ_1_001	2009	rural	1060286
level1	TZ_1_002	2009	urban	4157498
level1	TZ_1_002	2009	rural	0
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
level1	NG_1_001	2009	urban	0
level1	NG_1_001	2009	rural	0
level1	NG_1_002	2009	urban	0
level1	NG_1_002	2009	rural	0
level1	NG_1_003	2009	urban	0
level1	NG_1_003	2009	rural	0
level1	NG_1_004	2009	urban	0
level1	NG_1_004	2009	rural	0
level1	NG_1_005	2009	urban	0
level1	NG_1_005	2009	rural	0
level1	NG_1_006	2009	urban	0
level1	NG_1_006	2009	rural	0
level1	NG_1_007	2009	urban	0
level1	NG_1_007	2009	rural	0
level1	NG_1_008	2009	urban	0
level1	NG_1_008	2009	rural	0
level1	NG_1_009	2009	urban	0
level1	NG_1_009	2009	rural	0
level1	NG_1_010	2009	urban	0
level1	NG_1_010	2009	rural	0
level1	NG_1_011	2009	urban	0
level1	NG_1_011	2009	rural	0
level1	NG_1_012	2009	urban	0
level1	NG_1_012	2009	rural	0
level1	NG_1_013	2009	urban	0
level1	NG_1_013	2009	rural	0
level1	NG_1_014	2009	urban	0
level1	NG_1_014	2009	rural	0
level1	NG_1_015	2009	urban	0
level1	NG_1_015	2009	rural	0
level1	NG_1_016	2009	urban	0
level1	NG_1_016	2009	rural	0
level1	NG_1_017	2009	urban	0
level1	NG_1_017	2009	rural	0
level1	NG_1_018	2009	urban	0
level1	NG_1_018	2009	rural	0
level1	NG_1_019	2009	urban	0
level1	NG_1_019	2009	rural	0
level1	NG_1_020	2009	urban	0
level1	NG_1_020	2009	rural	0
level1	NG_1_021	2009	urban	0
level1	NG_1_021	2009	rural	0
level1	NG_1_022	2009	urban	0
level1	NG_1_022	2009	rural	0
level1	NG_1_023	2009	urban	0
level1	NG_1_023	2009	rural	0
level1	NG_1_024	2009	urban	0
level1	NG_1_024	2009	rural	0
level1	NG_1_025	2009	urban	0
level1	NG_1_025	2009	rural	0
level1	NG_1_026	2009	urban	0
level1	NG_1_026	2009	rural	0
level1	NG_1_027	2009	urban	0
level1	NG_1_027	2009	rural	0
level1	NG_1_028	2009	urban	0
level1	NG_1_028	2009	rural	0
level1	NG_1_029	2009	urban	0
level1	NG_1_029	2009	rural	0
level1	NG_1_030	2009	urban	0
level1	NG_1_030	2009	rural	0
level1	NG_1_031	2009	urban	0
level1	NG_1_031	2009	rural	0
level1	NG_1_032	2009	urban	0
level1	NG_1_032	2009	rural	0
level1	NG_1_033	2009	urban	0
level1	NG_1_033	2009	rural	0
level1	NG_1_034	2009	urban	0
level1	NG_1_034	2009	rural	0
level1	NG_1_035	2009	urban	0
level1	NG_1_035	2009	rural	0
level1	NG_1_036	2009	urban	0
level1	NG_1_036	2009	rural	0
level1	NG_1_037	2009	urban	0
level1	NG_1_037	2009	rural	0
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
\.


--
-- Name: population_residence pk_population_residence; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_residence
    ADD CONSTRAINT pk_population_residence PRIMARY KEY (geo_level, geo_code, geo_version, "Population_Residence");


--
-- PostgreSQL database dump complete
--

