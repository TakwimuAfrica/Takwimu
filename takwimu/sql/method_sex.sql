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

ALTER TABLE IF EXISTS ONLY public.method_sex DROP CONSTRAINT IF EXISTS pk_method_sex;
DROP TABLE IF EXISTS public.method_sex;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: method_sex; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.method_sex (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    method character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: method_sex; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.method_sex (geo_level, geo_code, geo_version, method, sex, total) FROM stdin;
level1	KE_1_001	2009	using condoms	female	85
level1	KE_1_001	2009	using condoms	male	97
level1	KE_1_001	2009	being faithful	female	94
level1	KE_1_001	2009	being faithful	male	99
level1	KE_1_001	2009	both	female	83
level1	KE_1_001	2009	both	male	96
level1	KE_1_002	2009	using condoms	female	62
level1	KE_1_002	2009	using condoms	male	71
level1	KE_1_002	2009	being faithful	female	65
level1	KE_1_002	2009	being faithful	male	90
level1	KE_1_002	2009	both	female	56
level1	KE_1_002	2009	both	male	67
level1	KE_1_003	2009	using condoms	female	76
level1	KE_1_003	2009	using condoms	male	54
level1	KE_1_003	2009	being faithful	female	93
level1	KE_1_003	2009	being faithful	male	75
level1	KE_1_003	2009	both	female	73
level1	KE_1_003	2009	both	male	44
level1	KE_1_004	2009	using condoms	female	60
level1	KE_1_004	2009	using condoms	male	74
level1	KE_1_004	2009	being faithful	female	85
level1	KE_1_004	2009	being faithful	male	92
level1	KE_1_004	2009	both	female	58
level1	KE_1_004	2009	both	male	71
level1	KE_1_005	2009	using condoms	female	70
level1	KE_1_005	2009	using condoms	male	88
level1	KE_1_005	2009	being faithful	female	93
level1	KE_1_005	2009	being faithful	male	95
level1	KE_1_005	2009	both	female	68
level1	KE_1_005	2009	both	male	84
level1	KE_1_006	2009	using condoms	female	84
level1	KE_1_006	2009	using condoms	male	88
level1	KE_1_006	2009	being faithful	female	96
level1	KE_1_006	2009	being faithful	male	94
level1	KE_1_006	2009	both	female	83
level1	KE_1_006	2009	both	male	85
level1	KE_1_007	2009	using condoms	female	43
level1	KE_1_007	2009	using condoms	male	70
level1	KE_1_007	2009	being faithful	female	60
level1	KE_1_007	2009	being faithful	male	94
level1	KE_1_007	2009	both	female	31
level1	KE_1_007	2009	both	male	69
level1	KE_1_008	2009	using condoms	female	19
level1	KE_1_008	2009	using condoms	male	38
level1	KE_1_008	2009	being faithful	female	52
level1	KE_1_008	2009	being faithful	male	34
level1	KE_1_008	2009	both	female	15
level1	KE_1_008	2009	both	male	11
level1	KE_1_009	2009	using condoms	female	14
level1	KE_1_009	2009	using condoms	male	60
level1	KE_1_009	2009	being faithful	female	54
level1	KE_1_009	2009	being faithful	male	69
level1	KE_1_009	2009	both	female	13
level1	KE_1_009	2009	both	male	58
level1	KE_1_010	2009	using condoms	female	54
level1	KE_1_010	2009	using condoms	male	97
level1	KE_1_010	2009	being faithful	female	64
level1	KE_1_010	2009	being faithful	male	96
level1	KE_1_010	2009	both	female	45
level1	KE_1_010	2009	both	male	95
level1	KE_1_011	2009	using condoms	female	76
level1	KE_1_011	2009	using condoms	male	71
level1	KE_1_011	2009	being faithful	female	91
level1	KE_1_011	2009	being faithful	male	98
level1	KE_1_011	2009	both	female	74
level1	KE_1_011	2009	both	male	71
level1	KE_1_012	2009	using condoms	female	81
level1	KE_1_012	2009	using condoms	male	87
level1	KE_1_012	2009	being faithful	female	95
level1	KE_1_012	2009	being faithful	male	99
level1	KE_1_012	2009	both	female	79
level1	KE_1_012	2009	both	male	86
level1	KE_1_013	2009	using condoms	female	76
level1	KE_1_013	2009	using condoms	male	82
level1	KE_1_013	2009	being faithful	female	94
level1	KE_1_013	2009	being faithful	male	98
level1	KE_1_013	2009	both	female	74
level1	KE_1_013	2009	both	male	81
level1	KE_1_014	2009	using condoms	female	80
level1	KE_1_014	2009	using condoms	male	72
level1	KE_1_014	2009	being faithful	female	95
level1	KE_1_014	2009	being faithful	male	82
level1	KE_1_014	2009	both	female	78
level1	KE_1_014	2009	both	male	63
level1	KE_1_015	2009	using condoms	female	52
level1	KE_1_015	2009	using condoms	male	83
level1	KE_1_015	2009	being faithful	female	94
level1	KE_1_015	2009	being faithful	male	98
level1	KE_1_015	2009	both	female	50
level1	KE_1_015	2009	both	male	82
level1	KE_1_016	2009	using condoms	female	77
level1	KE_1_016	2009	using condoms	male	88
level1	KE_1_016	2009	being faithful	female	97
level1	KE_1_016	2009	being faithful	male	91
level1	KE_1_016	2009	both	female	75
level1	KE_1_016	2009	both	male	83
level1	KE_1_017	2009	using condoms	female	79
level1	KE_1_017	2009	using condoms	male	93
level1	KE_1_017	2009	being faithful	female	96
level1	KE_1_017	2009	being faithful	male	98
level1	KE_1_017	2009	both	female	77
level1	KE_1_017	2009	both	male	92
level1	KE_1_018	2009	using condoms	female	83
level1	KE_1_018	2009	using condoms	male	92
level1	KE_1_018	2009	being faithful	female	91
level1	KE_1_018	2009	being faithful	male	91
level1	KE_1_018	2009	both	female	80
level1	KE_1_018	2009	both	male	85
level1	KE_1_019	2009	using condoms	female	81
level1	KE_1_019	2009	using condoms	male	86
level1	KE_1_019	2009	being faithful	female	93
level1	KE_1_019	2009	being faithful	male	97
level1	KE_1_019	2009	both	female	77
level1	KE_1_019	2009	both	male	85
level1	KE_1_020	2009	using condoms	female	92
level1	KE_1_020	2009	using condoms	male	88
level1	KE_1_020	2009	being faithful	female	98
level1	KE_1_020	2009	being faithful	male	97
level1	KE_1_020	2009	both	female	91
level1	KE_1_020	2009	both	male	86
level1	KE_1_021	2009	using condoms	female	56
level1	KE_1_021	2009	using condoms	male	80
level1	KE_1_021	2009	being faithful	female	74
level1	KE_1_021	2009	being faithful	male	98
level1	KE_1_021	2009	both	female	54
level1	KE_1_021	2009	both	male	78
level1	KE_1_022	2009	using condoms	female	81
level1	KE_1_022	2009	using condoms	male	95
level1	KE_1_022	2009	being faithful	female	92
level1	KE_1_022	2009	being faithful	male	98
level1	KE_1_022	2009	both	female	76
level1	KE_1_022	2009	both	male	94
level1	KE_1_023	2009	using condoms	female	51
level1	KE_1_023	2009	using condoms	male	8
level1	KE_1_023	2009	being faithful	female	91
level1	KE_1_023	2009	being faithful	male	31
level1	KE_1_023	2009	both	female	49
level1	KE_1_023	2009	both	male	2
level1	KE_1_024	2009	using condoms	female	54
level1	KE_1_024	2009	using condoms	male	79
level1	KE_1_024	2009	being faithful	female	77
level1	KE_1_024	2009	being faithful	male	95
level1	KE_1_024	2009	both	female	48
level1	KE_1_024	2009	both	male	77
level1	KE_1_025	2009	using condoms	female	78
level1	KE_1_025	2009	using condoms	male	83
level1	KE_1_025	2009	being faithful	female	97
level1	KE_1_025	2009	being faithful	male	96
level1	KE_1_025	2009	both	female	78
level1	KE_1_025	2009	both	male	79
level1	KE_1_026	2009	using condoms	female	86
level1	KE_1_026	2009	using condoms	male	85
level1	KE_1_026	2009	being faithful	female	97
level1	KE_1_026	2009	being faithful	male	92
level1	KE_1_026	2009	both	female	85
level1	KE_1_026	2009	both	male	80
level1	KE_1_027	2009	using condoms	female	86
level1	KE_1_027	2009	using condoms	male	87
level1	KE_1_027	2009	being faithful	female	95
level1	KE_1_027	2009	being faithful	male	93
level1	KE_1_027	2009	both	female	83
level1	KE_1_027	2009	both	male	83
level1	KE_1_028	2009	using condoms	female	86
level1	KE_1_028	2009	using condoms	male	97
level1	KE_1_028	2009	being faithful	female	98
level1	KE_1_028	2009	being faithful	male	99
level1	KE_1_028	2009	both	female	85
level1	KE_1_028	2009	both	male	97
level1	KE_1_029	2009	using condoms	female	92
level1	KE_1_029	2009	using condoms	male	99
level1	KE_1_029	2009	being faithful	female	97
level1	KE_1_029	2009	being faithful	male	99
level1	KE_1_029	2009	both	female	91
level1	KE_1_029	2009	both	male	98
level1	KE_1_030	2009	using condoms	female	75
level1	KE_1_030	2009	using condoms	male	92
level1	KE_1_030	2009	being faithful	female	90
level1	KE_1_030	2009	being faithful	male	96
level1	KE_1_030	2009	both	female	73
level1	KE_1_030	2009	both	male	90
level1	KE_1_031	2009	using condoms	female	86
level1	KE_1_031	2009	using condoms	male	78
level1	KE_1_031	2009	being faithful	female	97
level1	KE_1_031	2009	being faithful	male	90
level1	KE_1_031	2009	both	female	85
level1	KE_1_031	2009	both	male	72
level1	KE_1_032	2009	using condoms	female	84
level1	KE_1_032	2009	using condoms	male	93
level1	KE_1_032	2009	being faithful	female	94
level1	KE_1_032	2009	being faithful	male	97
level1	KE_1_032	2009	both	female	81
level1	KE_1_032	2009	both	male	91
level1	KE_1_033	2009	using condoms	female	68
level1	KE_1_033	2009	using condoms	male	81
level1	KE_1_033	2009	being faithful	female	85
level1	KE_1_033	2009	being faithful	male	93
level1	KE_1_033	2009	both	female	62
level1	KE_1_033	2009	both	male	78
level1	KE_1_034	2009	using condoms	female	78
level1	KE_1_034	2009	using condoms	male	87
level1	KE_1_034	2009	being faithful	female	92
level1	KE_1_034	2009	being faithful	male	97
level1	KE_1_034	2009	both	female	76
level1	KE_1_034	2009	both	male	85
level1	KE_1_035	2009	using condoms	female	77
level1	KE_1_035	2009	using condoms	male	94
level1	KE_1_035	2009	being faithful	female	87
level1	KE_1_035	2009	being faithful	male	95
level1	KE_1_035	2009	both	female	73
level1	KE_1_035	2009	both	male	90
level1	KE_1_036	2009	using condoms	female	88
level1	KE_1_036	2009	using condoms	male	92
level1	KE_1_036	2009	being faithful	female	96
level1	KE_1_036	2009	being faithful	male	97
level1	KE_1_036	2009	both	female	86
level1	KE_1_036	2009	both	male	90
level1	KE_1_037	2009	using condoms	female	86
level1	KE_1_037	2009	using condoms	male	87
level1	KE_1_037	2009	being faithful	female	92
level1	KE_1_037	2009	being faithful	male	93
level1	KE_1_037	2009	both	female	82
level1	KE_1_037	2009	both	male	83
level1	KE_1_038	2009	using condoms	female	81
level1	KE_1_038	2009	using condoms	male	83
level1	KE_1_038	2009	being faithful	female	91
level1	KE_1_038	2009	being faithful	male	83
level1	KE_1_038	2009	both	female	78
level1	KE_1_038	2009	both	male	72
level1	KE_1_039	2009	using condoms	female	89
level1	KE_1_039	2009	using condoms	male	92
level1	KE_1_039	2009	being faithful	female	91
level1	KE_1_039	2009	being faithful	male	100
level1	KE_1_039	2009	both	female	84
level1	KE_1_039	2009	both	male	92
level1	KE_1_040	2009	using condoms	female	82
level1	KE_1_040	2009	using condoms	male	96
level1	KE_1_040	2009	being faithful	female	90
level1	KE_1_040	2009	being faithful	male	99
level1	KE_1_040	2009	both	female	76
level1	KE_1_040	2009	both	male	95
level1	KE_1_041	2009	using condoms	female	89
level1	KE_1_041	2009	using condoms	male	97
level1	KE_1_041	2009	being faithful	female	97
level1	KE_1_041	2009	being faithful	male	99
level1	KE_1_041	2009	both	female	87
level1	KE_1_041	2009	both	male	96
level1	KE_1_042	2009	using condoms	female	89
level1	KE_1_042	2009	using condoms	male	99
level1	KE_1_042	2009	being faithful	female	93
level1	KE_1_042	2009	being faithful	male	99
level1	KE_1_042	2009	both	female	84
level1	KE_1_042	2009	both	male	98
level1	KE_1_043	2009	using condoms	female	92
level1	KE_1_043	2009	using condoms	male	97
level1	KE_1_043	2009	being faithful	female	94
level1	KE_1_043	2009	being faithful	male	99
level1	KE_1_043	2009	both	female	88
level1	KE_1_043	2009	both	male	97
level1	KE_1_044	2009	using condoms	female	85
level1	KE_1_044	2009	using condoms	male	87
level1	KE_1_044	2009	being faithful	female	90
level1	KE_1_044	2009	being faithful	male	90
level1	KE_1_044	2009	both	female	80
level1	KE_1_044	2009	both	male	80
level1	KE_1_045	2009	using condoms	female	82
level1	KE_1_045	2009	using condoms	male	90
level1	KE_1_045	2009	being faithful	female	97
level1	KE_1_045	2009	being faithful	male	97
level1	KE_1_045	2009	both	female	80
level1	KE_1_045	2009	both	male	89
level1	KE_1_046	2009	using condoms	female	98
level1	KE_1_046	2009	using condoms	male	98
level1	KE_1_046	2009	being faithful	female	100
level1	KE_1_046	2009	being faithful	male	99
level1	KE_1_046	2009	both	female	98
level1	KE_1_046	2009	both	male	98
level1	KE_1_047	2009	using condoms	female	87
level1	KE_1_047	2009	using condoms	male	93
level1	KE_1_047	2009	being faithful	female	95
level1	KE_1_047	2009	being faithful	male	96
level1	KE_1_047	2009	both	female	84
level1	KE_1_047	2009	both	male	90
country	KE	2009	using condoms	female	80
country	KE	2009	using condoms	male	88
country	KE	2009	being faithful	female	92
country	KE	2009	being faithful	male	94
country	KE	2009	both	female	77
country	KE	2009	both	male	85
\.


--
-- Name: method_sex pk_method_sex; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.method_sex
    ADD CONSTRAINT pk_method_sex PRIMARY KEY (geo_level, geo_code, geo_version, method, sex);


--
-- PostgreSQL database dump complete
--

