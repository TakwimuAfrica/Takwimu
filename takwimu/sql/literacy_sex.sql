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

ALTER TABLE IF EXISTS ONLY public.literacy_sex DROP CONSTRAINT IF EXISTS pk_literacy_sex;
DROP TABLE IF EXISTS public.literacy_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: literacy_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.literacy_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    sex character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: literacy_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.literacy_sex (geo_level, geo_code, geo_version, sex, total) FROM stdin;
country	NG	2009	Female	59.3
country	NG	2009	Male	70.9
level1	NG_1_001	2009	Female	98.2
level1	NG_1_001	2009	Male	94.2
level1	NG_1_002	2009	Female	50.6
level1	NG_1_002	2009	Male	74.3
level1	NG_1_003	2009	Female	94.6
level1	NG_1_003	2009	Male	92.7
level1	NG_1_004	2009	Female	98.1
level1	NG_1_004	2009	Male	95.1
level1	NG_1_005	2009	Female	25.6
level1	NG_1_005	2009	Male	39.8
level1	NG_1_006	2009	Female	95.8
level1	NG_1_006	2009	Male	98.3
level1	NG_1_007	2009	Female	69.9
level1	NG_1_007	2009	Male	90.5
level1	NG_1_008	2009	Female	56.4
level1	NG_1_008	2009	Male	60.3
level1	NG_1_009	2009	Female	94.3
level1	NG_1_009	2009	Male	95
level1	NG_1_010	2009	Female	91
level1	NG_1_010	2009	Male	95.3
level1	NG_1_011	2009	Female	83.4
level1	NG_1_011	2009	Male	81.9
level1	NG_1_012	2009	Female	94.9
level1	NG_1_012	2009	Male	98.3
level1	NG_1_013	2009	Female	96.7
level1	NG_1_013	2009	Male	99
level1	NG_1_014	2009	Female	97.9
level1	NG_1_014	2009	Male	96.8
level1	NG_1_015	2009	Female	81.3
level1	NG_1_015	2009	Male	90.1
level1	NG_1_016	2009	Female	37.5
level1	NG_1_016	2009	Male	47.5
level1	NG_1_017	2009	Female	98.2
level1	NG_1_017	2009	Male	98.9
level1	NG_1_018	2009	Female	24.8
level1	NG_1_018	2009	Male	32.3
level1	NG_1_019	2009	Female	54.4
level1	NG_1_019	2009	Male	65.2
level1	NG_1_020	2009	Female	46.1
level1	NG_1_020	2009	Male	72.5
level1	NG_1_021	2009	Female	32.6
level1	NG_1_021	2009	Male	62.6
level1	NG_1_022	2009	Female	30.9
level1	NG_1_022	2009	Male	41.8
level1	NG_1_023	2009	Female	86.3
level1	NG_1_023	2009	Male	92.4
level1	NG_1_024	2009	Female	73.5
level1	NG_1_024	2009	Male	81
level1	NG_1_025	2009	Female	93.1
level1	NG_1_025	2009	Male	98.3
level1	NG_1_026	2009	Female	56
level1	NG_1_026	2009	Male	78.1
level1	NG_1_027	2009	Female	37.6
level1	NG_1_027	2009	Male	58.9
level1	NG_1_028	2009	Female	90.7
level1	NG_1_028	2009	Male	89
level1	NG_1_029	2009	Female	91.4
level1	NG_1_029	2009	Male	93.4
level1	NG_1_030	2009	Female	94.7
level1	NG_1_030	2009	Male	94.8
level1	NG_1_031	2009	Female	90.7
level1	NG_1_031	2009	Male	88.3
level1	NG_1_032	2009	Female	65.1
level1	NG_1_032	2009	Male	69.6
level1	NG_1_033	2009	Female	98.1
level1	NG_1_033	2009	Male	94.7
level1	NG_1_034	2009	Female	20.1
level1	NG_1_034	2009	Male	47.4
level1	NG_1_035	2009	Female	53.1
level1	NG_1_035	2009	Male	70.6
level1	NG_1_036	2009	Female	28.3
level1	NG_1_036	2009	Male	42.7
level1	NG_1_037	2009	Female	31
level1	NG_1_037	2009	Male	53
\.


--
-- Name: literacy_sex pk_literacy_sex; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.literacy_sex
    ADD CONSTRAINT pk_literacy_sex PRIMARY KEY (geo_level, geo_code, geo_version, sex);


--
-- PostgreSQL database dump complete
--

