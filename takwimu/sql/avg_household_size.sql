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

ALTER TABLE IF EXISTS ONLY public.avg_household_size DROP CONSTRAINT IF EXISTS pk_avg_household_size;
DROP TABLE IF EXISTS public.avg_household_size;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: avg_household_size; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.avg_household_size (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: avg_household_size; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.avg_household_size (geo_level, geo_code, geo_version, year, total) FROM stdin;
level1	KE_1_030	2009	2019	47
level1	KE_1_036	2009	2019	47
level1	KE_1_039	2009	2019	46
level1	KE_1_040	2009	2019	45
level1	KE_1_028	2009	2019	45
level1	KE_1_014	2009	2019	33
level1	KE_1_007	2009	2019	59
level1	KE_1_043	2009	2019	43
level1	KE_1_011	2009	2019	46
level1	KE_1_034	2009	2019	35
level1	KE_1_037	2009	2019	43
country	KE	2009	2019	39
level1	KE_1_035	2009	2019	44
level1	KE_1_022	2009	2019	30
level1	KE_1_003	2009	2019	48
level1	KE_1_020	2009	2019	30
level1	KE_1_045	2009	2019	41
level1	KE_1_042	2009	2019	38
level1	KE_1_015	2009	2019	43
level1	KE_1_002	2009	2019	50
level1	KE_1_031	2009	2019	34
level1	KE_1_005	2009	2019	37
level1	KE_1_016	2009	2019	35
level1	KE_1_017	2009	2019	40
level1	KE_1_009	2009	2019	69
level1	KE_1_010	2009	2019	58
level1	KE_1_012	2009	2019	36
level1	KE_1_044	2009	2019	46
level1	KE_1_001	2009	2019	31
level1	KE_1_021	2009	2019	33
level1	KE_1_047	2009	2019	29
level1	KE_1_032	2009	2019	35
level1	KE_1_029	2009	2019	44
level1	KE_1_033	2009	2019	48
level1	KE_1_046	2009	2019	40
level1	KE_1_018	2009	2019	35
level1	KE_1_019	2009	2019	30
level1	KE_1_025	2009	2019	47
level1	KE_1_041	2009	2019	39
level1	KE_1_006	2009	2019	35
level1	KE_1_004	2009	2019	46
level1	KE_1_013	2009	2019	36
level1	KE_1_026	2009	2019	44
level1	KE_1_023	2009	2019	56
level1	KE_1_027	2009	2019	38
level1	KE_1_038	2009	2019	41
level1	KE_1_008	2009	2019	61
level1	KE_1_024	2009	2019	53
\.


--
-- Name: avg_household_size pk_avg_household_size; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.avg_household_size
    ADD CONSTRAINT pk_avg_household_size PRIMARY KEY (geo_level, geo_code, geo_version, year);


--
-- PostgreSQL database dump complete
--

