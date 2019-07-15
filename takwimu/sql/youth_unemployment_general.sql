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

ALTER TABLE IF EXISTS ONLY public.youth_unemployment_general DROP CONSTRAINT IF EXISTS pk_youth_unemployment_general;
DROP TABLE IF EXISTS public.youth_unemployment_general;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: youth_unemployment_general; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.youth_unemployment_general (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    youth_unemployment_period character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: youth_unemployment_general; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.youth_unemployment_general (geo_level, geo_code, geo_version, youth_unemployment_period, total) FROM stdin;
country	NG	2009	Q1	34.8
country	NG	2009	Q3	40
country	NG	2009	Q2	37.2
level1	NG_1_001	2009	Q3	45.3
level1	NG_1_001	2009	Q1	38.1
level1	NG_1_001	2009	Q2	41.2
level1	NG_1_002	2009	Q3	34.6
level1	NG_1_002	2009	Q1	32
level1	NG_1_002	2009	Q2	33.5
level1	NG_1_003	2009	Q3	54.8
level1	NG_1_003	2009	Q1	45.6
level1	NG_1_003	2009	Q2	49.6
level1	NG_1_004	2009	Q3	29.5
level1	NG_1_004	2009	Q1	25.8
level1	NG_1_004	2009	Q2	27.5
level1	NG_1_005	2009	Q1	35.6
level1	NG_1_005	2009	Q2	37.3
level1	NG_1_005	2009	Q3	38.8
level1	NG_1_006	2009	Q2	43.5
level1	NG_1_006	2009	Q3	47.8
level1	NG_1_006	2009	Q1	40.1
level1	NG_1_007	2009	Q2	33
level1	NG_1_007	2009	Q3	34.6
level1	NG_1_007	2009	Q1	31.2
level1	NG_1_008	2009	Q2	47.7
level1	NG_1_008	2009	Q3	51.2
level1	NG_1_008	2009	Q1	44.7
level1	NG_1_009	2009	Q2	37.6
level1	NG_1_009	2009	Q1	35
level1	NG_1_009	2009	Q3	40.5
level1	NG_1_010	2009	Q1	33
level1	NG_1_010	2009	Q2	35.3
level1	NG_1_010	2009	Q3	38
level1	NG_1_011	2009	Q1	30.6
level1	NG_1_011	2009	Q2	32.8
level1	NG_1_011	2009	Q3	35.5
level1	NG_1_012	2009	Q2	37.1
level1	NG_1_012	2009	Q3	40
level1	NG_1_012	2009	Q1	34.6
level1	NG_1_013	2009	Q1	24.4
level1	NG_1_013	2009	Q2	26.2
level1	NG_1_013	2009	Q3	28.3
level1	NG_1_014	2009	Q2	34.7
level1	NG_1_014	2009	Q3	37.6
level1	NG_1_014	2009	Q1	32.2
level1	NG_1_015	2009	Q2	30.3
level1	NG_1_015	2009	Q1	28.3
level1	NG_1_015	2009	Q3	32.5
level1	NG_1_016	2009	Q2	47.6
level1	NG_1_016	2009	Q3	49.3
level1	NG_1_016	2009	Q1	45.3
level1	NG_1_017	2009	Q1	39
level1	NG_1_017	2009	Q2	42.3
level1	NG_1_017	2009	Q3	46.5
level1	NG_1_018	2009	Q3	62.4
level1	NG_1_018	2009	Q2	59.5
level1	NG_1_018	2009	Q1	56.3
level1	NG_1_019	2009	Q1	50.8
level1	NG_1_019	2009	Q3	58.6
level1	NG_1_019	2009	Q2	54.4
level1	NG_1_020	2009	Q1	45.5
level1	NG_1_020	2009	Q2	48.3
level1	NG_1_020	2009	Q3	51.2
level1	NG_1_021	2009	Q2	48.7
level1	NG_1_021	2009	Q3	49.4
level1	NG_1_021	2009	Q1	46.9
level1	NG_1_022	2009	Q1	28.8
level1	NG_1_022	2009	Q3	31.5
level1	NG_1_022	2009	Q2	30.3
level1	NG_1_023	2009	Q1	37.2
level1	NG_1_023	2009	Q3	43
level1	NG_1_023	2009	Q2	39.8
level1	NG_1_024	2009	Q1	27.5
level1	NG_1_024	2009	Q2	29.3
level1	NG_1_024	2009	Q3	31.3
level1	NG_1_025	2009	Q1	28
level1	NG_1_025	2009	Q2	30.2
level1	NG_1_025	2009	Q3	32.7
level1	NG_1_026	2009	Q2	49.2
level1	NG_1_026	2009	Q3	53.4
level1	NG_1_026	2009	Q1	45.7
level1	NG_1_027	2009	Q3	40.4
level1	NG_1_027	2009	Q1	36.8
level1	NG_1_027	2009	Q2	38.8
level1	NG_1_028	2009	Q3	21
level1	NG_1_028	2009	Q1	18.4
level1	NG_1_028	2009	Q2	19.6
level1	NG_1_029	2009	Q3	34.5
level1	NG_1_029	2009	Q1	30.2
level1	NG_1_029	2009	Q2	32.2
level1	NG_1_030	2009	Q3	19
level1	NG_1_030	2009	Q1	17.2
level1	NG_1_030	2009	Q2	18.2
level1	NG_1_031	2009	Q3	23
level1	NG_1_031	2009	Q1	20.4
level1	NG_1_031	2009	Q2	21.7
level1	NG_1_032	2009	Q1	41.4
level1	NG_1_032	2009	Q3	48.1
level1	NG_1_032	2009	Q2	44.5
level1	NG_1_033	2009	Q2	55.4
level1	NG_1_033	2009	Q1	50.9
level1	NG_1_033	2009	Q3	61.4
level1	NG_1_034	2009	Q2	44.6
level1	NG_1_034	2009	Q3	47.4
level1	NG_1_034	2009	Q1	42
level1	NG_1_035	2009	Q2	12.4
level1	NG_1_035	2009	Q3	13.4
level1	NG_1_035	2009	Q1	11.5
level1	NG_1_036	2009	Q2	54.9
level1	NG_1_036	2009	Q3	58.1
level1	NG_1_036	2009	Q1	51.7
level1	NG_1_037	2009	Q2	32.7
level1	NG_1_037	2009	Q3	34
level1	NG_1_037	2009	Q1	31.2
\.


--
-- Name: youth_unemployment_general pk_youth_unemployment_general; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.youth_unemployment_general
    ADD CONSTRAINT pk_youth_unemployment_general PRIMARY KEY (geo_level, geo_code, geo_version, youth_unemployment_period);


--
-- PostgreSQL database dump complete
--
