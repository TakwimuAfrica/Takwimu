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

ALTER TABLE IF EXISTS ONLY public.child_births_by_size DROP CONSTRAINT IF EXISTS pk_child_births_by_size;
DROP TABLE IF EXISTS public.child_births_by_size;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: child_births_by_size; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.child_births_by_size (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    size character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: child_births_by_size; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.child_births_by_size (geo_level, geo_code, geo_version, size, total) FROM stdin;
level1	NG_1_001	2009	Very Small	1
level1	NG_1_001	2009	Smaller than Average	7
level1	NG_1_001	2009	Average	85
level1	NG_1_001	2009	Missing	6
level1	NG_1_002	2009	Very Small	4
level1	NG_1_002	2009	Smaller than Average	8
level1	NG_1_002	2009	Average	86
level1	NG_1_002	2009	Missing	2
level1	NG_1_003	2009	Very Small	4
level1	NG_1_003	2009	Smaller than Average	6
level1	NG_1_003	2009	Average	87
level1	NG_1_003	2009	Missing	3
level1	NG_1_004	2009	Very Small	6
level1	NG_1_004	2009	Smaller than Average	3
level1	NG_1_004	2009	Average	86
level1	NG_1_004	2009	Missing	5
level1	NG_1_005	2009	Very Small	4
level1	NG_1_005	2009	Smaller than Average	18
level1	NG_1_005	2009	Average	76
level1	NG_1_005	2009	Missing	2
level1	NG_1_006	2009	Very Small	5
level1	NG_1_006	2009	Smaller than Average	11
level1	NG_1_006	2009	Average	83
level1	NG_1_006	2009	Missing	1
level1	NG_1_007	2009	Very Small	3
level1	NG_1_007	2009	Smaller than Average	7
level1	NG_1_007	2009	Average	90
level1	NG_1_007	2009	Missing	0
level1	NG_1_008	2009	Very Small	17
level1	NG_1_008	2009	Smaller than Average	14
level1	NG_1_008	2009	Average	68
level1	NG_1_008	2009	Missing	2
level1	NG_1_009	2009	Very Small	1
level1	NG_1_009	2009	Smaller than Average	11
level1	NG_1_009	2009	Average	87
level1	NG_1_009	2009	Missing	0
level1	NG_1_010	2009	Very Small	1
level1	NG_1_010	2009	Smaller than Average	5
level1	NG_1_010	2009	Average	91
level1	NG_1_010	2009	Missing	3
level1	NG_1_011	2009	Very Small	2
level1	NG_1_011	2009	Smaller than Average	12
level1	NG_1_011	2009	Average	86
level1	NG_1_011	2009	Missing	0
level1	NG_1_012	2009	Very Small	3
level1	NG_1_012	2009	Smaller than Average	12
level1	NG_1_012	2009	Average	85
level1	NG_1_012	2009	Missing	1
level1	NG_1_013	2009	Very Small	1
level1	NG_1_013	2009	Smaller than Average	5
level1	NG_1_013	2009	Average	91
level1	NG_1_013	2009	Missing	3
level1	NG_1_014	2009	Very Small	3
level1	NG_1_014	2009	Smaller than Average	12
level1	NG_1_014	2009	Average	84
level1	NG_1_014	2009	Missing	1
level1	NG_1_015	2009	Very Small	5
level1	NG_1_015	2009	Smaller than Average	15
level1	NG_1_015	2009	Average	75
level1	NG_1_015	2009	Missing	6
level1	NG_1_016	2009	Very Small	3
level1	NG_1_016	2009	Smaller than Average	11
level1	NG_1_016	2009	Average	85
level1	NG_1_016	2009	Missing	1
level1	NG_1_017	2009	Very Small	1
level1	NG_1_017	2009	Smaller than Average	9
level1	NG_1_017	2009	Average	88
level1	NG_1_017	2009	Missing	2
level1	NG_1_018	2009	Very Small	5
level1	NG_1_018	2009	Smaller than Average	13
level1	NG_1_018	2009	Average	78
level1	NG_1_018	2009	Missing	4
level1	NG_1_019	2009	Very Small	3
level1	NG_1_019	2009	Smaller than Average	15
level1	NG_1_019	2009	Average	81
level1	NG_1_019	2009	Missing	1
level1	NG_1_020	2009	Very Small	10
level1	NG_1_020	2009	Smaller than Average	10
level1	NG_1_020	2009	Average	78
level1	NG_1_020	2009	Missing	2
level1	NG_1_021	2009	Very Small	2
level1	NG_1_021	2009	Smaller than Average	9
level1	NG_1_021	2009	Average	87
level1	NG_1_021	2009	Missing	3
level1	NG_1_022	2009	Very Small	11
level1	NG_1_022	2009	Smaller than Average	25
level1	NG_1_022	2009	Average	63
level1	NG_1_022	2009	Missing	1
level1	NG_1_023	2009	Very Small	2
level1	NG_1_023	2009	Smaller than Average	5
level1	NG_1_023	2009	Average	91
level1	NG_1_023	2009	Missing	3
level1	NG_1_024	2009	Very Small	0
level1	NG_1_024	2009	Smaller than Average	9
level1	NG_1_024	2009	Average	90
level1	NG_1_024	2009	Missing	1
level1	NG_1_025	2009	Very Small	1
level1	NG_1_025	2009	Smaller than Average	6
level1	NG_1_025	2009	Average	91
level1	NG_1_025	2009	Missing	2
level1	NG_1_026	2009	Very Small	5
level1	NG_1_026	2009	Smaller than Average	10
level1	NG_1_026	2009	Average	85
level1	NG_1_026	2009	Missing	0
level1	NG_1_027	2009	Very Small	1
level1	NG_1_027	2009	Smaller than Average	2
level1	NG_1_027	2009	Average	95
level1	NG_1_027	2009	Missing	3
level1	NG_1_028	2009	Very Small	2
level1	NG_1_028	2009	Smaller than Average	6
level1	NG_1_028	2009	Average	91
level1	NG_1_028	2009	Missing	1
level1	NG_1_029	2009	Very Small	2
level1	NG_1_029	2009	Smaller than Average	7
level1	NG_1_029	2009	Average	90
level1	NG_1_029	2009	Missing	1
level1	NG_1_030	2009	Very Small	1
level1	NG_1_030	2009	Smaller than Average	3
level1	NG_1_030	2009	Average	96
level1	NG_1_030	2009	Missing	1
level1	NG_1_031	2009	Very Small	2
level1	NG_1_031	2009	Smaller than Average	16
level1	NG_1_031	2009	Average	81
level1	NG_1_031	2009	Missing	1
level1	NG_1_032	2009	Very Small	9
level1	NG_1_032	2009	Smaller than Average	13
level1	NG_1_032	2009	Average	77
level1	NG_1_032	2009	Missing	2
level1	NG_1_033	2009	Very Small	3
level1	NG_1_033	2009	Smaller than Average	12
level1	NG_1_033	2009	Average	83
level1	NG_1_033	2009	Missing	2
level1	NG_1_034	2009	Very Small	0
level1	NG_1_034	2009	Smaller than Average	2
level1	NG_1_034	2009	Average	95
level1	NG_1_034	2009	Missing	3
level1	NG_1_035	2009	Very Small	4
level1	NG_1_035	2009	Smaller than Average	17
level1	NG_1_035	2009	Average	78
level1	NG_1_035	2009	Missing	1
level1	NG_1_036	2009	Very Small	14
level1	NG_1_036	2009	Smaller than Average	8
level1	NG_1_036	2009	Average	75
level1	NG_1_036	2009	Missing	3
level1	NG_1_037	2009	Very Small	3
level1	NG_1_037	2009	Smaller than Average	11
level1	NG_1_037	2009	Average	84
level1	NG_1_037	2009	Missing	1
country	NG	2009	Very Small	4
country	NG	2009	Smaller than Average	11
country	NG	2009	Average	83
country	NG	2009	Missing	2
\.


--
-- Name: child_births_by_size pk_child_births_by_size; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.child_births_by_size
    ADD CONSTRAINT pk_child_births_by_size PRIMARY KEY (geo_level, geo_code, geo_version, size);


--
-- PostgreSQL database dump complete
--

