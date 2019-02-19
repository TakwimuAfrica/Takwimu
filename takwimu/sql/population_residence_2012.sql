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

ALTER TABLE IF EXISTS ONLY public.population_residence_2012 DROP CONSTRAINT IF EXISTS pk_population_residence_2012;
DROP TABLE IF EXISTS public.population_residence_2012;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: population_residence_2012; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.population_residence_2012 (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    "population_residence_2012" character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: population_residence_2012; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.population_residence_2012 (geo_level, geo_code, geo_version, "population_residence_2012", total) FROM stdin;
country	TZ	2009	urban	13305004
country	TZ	2009	rural	31623919
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
\.


--
-- Name: population_residence_2012 pk_population_residence_2012; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.population_residence_2012
    ADD CONSTRAINT pk_population_residence_2012 PRIMARY KEY (geo_level, geo_code, geo_version, "population_residence_2012");


--
-- PostgreSQL database dump complete
--

