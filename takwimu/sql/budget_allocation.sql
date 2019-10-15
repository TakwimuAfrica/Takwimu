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

ALTER TABLE IF EXISTS ONLY public.budget_allocation DROP CONSTRAINT IF EXISTS pk_budget_allocation;
DROP TABLE IF EXISTS public.budget_allocation;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: budget_allocation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.budget_allocation (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    financial_year character varying(128) NOT NULL,
    allocation character varying(128) NOT NULL,
    total numeric
);


--
-- Data for Name: budget_allocation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.budget_allocation (geo_level, geo_code, geo_version, financial_year, allocation, total) FROM stdin;
level1	KE_1_030	2009	FY 2017/18	Development	2659.28
level1	KE_1_036	2009	FY 2017/18	Development	1812.64
level1	KE_1_039	2009	FY 2017/18	Development	3497.29
level1	KE_1_040	2009	FY 2017/18	Development	1986.96
level1	KE_1_028	2009	FY 2017/18	Development	1361.26
level1	KE_1_014	2009	FY 2017/18	Development	1895.45
level1	KE_1_007	2009	FY 2017/18	Development	2464.05
level1	KE_1_043	2009	FY 2017/18	Development	2211
level1	KE_1_011	2009	FY 2017/18	Development	1561.34
level1	KE_1_034	2009	FY 2017/18	Development	1871.12
level1	KE_1_037	2009	FY 2017/18	Development	6325.77
country	KE	2009	FY 2017/18	Development	134780.81
level1	KE_1_035	2009	FY 2017/18	Development	1828.12
level1	KE_1_022	2009	FY 2017/18	Development	3996.58
level1	KE_1_003	2009	FY 2017/18	Development	3923.36
level1	KE_1_020	2009	FY 2017/18	Development	1431.19
level1	KE_1_045	2009	FY 2017/18	Development	3408.9
level1	KE_1_042	2009	FY 2017/18	Development	3037.1
level1	KE_1_015	2009	FY 2017/18	Development	3623.01
level1	KE_1_002	2009	FY 2017/18	Development	4789.37
level1	KE_1_031	2009	FY 2017/18	Development	2079.66
level1	KE_1_005	2009	FY 2017/18	Development	819.1
level1	KE_1_016	2009	FY 2017/18	Development	2988.25
level1	KE_1_017	2009	FY 2017/18	Development	2689.84
level1	KE_1_009	2009	FY 2017/18	Development	6459.75
level1	KE_1_010	2009	FY 2017/18	Development	3549.94
level1	KE_1_012	2009	FY 2017/18	Development	2922.13
level1	KE_1_044	2009	FY 2017/18	Development	2876.18
level1	KE_1_001	2009	FY 2017/18	Development	3962.57
level1	KE_1_021	2009	FY 2017/18	Development	3234.87
level1	KE_1_047	2009	FY 2017/18	Development	5893.66
level1	KE_1_032	2009	FY 2017/18	Development	5898.68
level1	KE_1_029	2009	FY 2017/18	Development	2535.24
level1	KE_1_033	2009	FY 2017/18	Development	4837.35
level1	KE_1_046	2009	FY 2017/18	Development	1718.91
level1	KE_1_018	2009	FY 2017/18	Development	1846.18
level1	KE_1_019	2009	FY 2017/18	Development	2222.36
level1	KE_1_025	2009	FY 2017/18	Development	1463.16
level1	KE_1_041	2009	FY 2017/18	Development	1979.53
level1	KE_1_006	2009	FY 2017/18	Development	3247.49
level1	KE_1_004	2009	FY 2017/18	Development	2458.32
level1	KE_1_013	2009	FY 2017/18	Development	1481.48
level1	KE_1_026	2009	FY 2017/18	Development	2393.48
level1	KE_1_023	2009	FY 2017/18	Development	3975.67
level1	KE_1_027	2009	FY 2017/18	Development	2384.17
level1	KE_1_038	2009	FY 2017/18	Development	1444.58
level1	KE_1_008	2009	FY 2017/18	Development	2095.61
level1	KE_1_024	2009	FY 2017/18	Development	1638.87
level1	KE_1_030	2009	FY 2017/18	Recurrent	3982.98
level1	KE_1_036	2009	FY 2017/18	Recurrent	4083.28
level1	KE_1_039	2009	FY 2017/18	Recurrent	6530.86
level1	KE_1_040	2009	FY 2017/18	Recurrent	4992.35
level1	KE_1_028	2009	FY 2017/18	Recurrent	2635.78
level1	KE_1_014	2009	FY 2017/18	Recurrent	3822.74
level1	KE_1_007	2009	FY 2017/18	Recurrent	5387.05
level1	KE_1_043	2009	FY 2017/18	Recurrent	4980.16
level1	KE_1_011	2009	FY 2017/18	Recurrent	2721.38
level1	KE_1_034	2009	FY 2017/18	Recurrent	4363.04
level1	KE_1_037	2009	FY 2017/18	Recurrent	6844.19
country	KE	2009	FY 2017/18	Recurrent	239904.15
level1	KE_1_035	2009	FY 2017/18	Recurrent	4452.18
level1	KE_1_022	2009	FY 2017/18	Recurrent	9417.66
level1	KE_1_003	2009	FY 2017/18	Recurrent	7971.82
level1	KE_1_020	2009	FY 2017/18	Recurrent	3339.44
level1	KE_1_045	2009	FY 2017/18	Recurrent	6619.78
level1	KE_1_042	2009	FY 2017/18	Recurrent	6621.01
level1	KE_1_015	2009	FY 2017/18	Recurrent	6250.4
level1	KE_1_002	2009	FY 2017/18	Recurrent	4921.33
level1	KE_1_031	2009	FY 2017/18	Recurrent	3471.79
level1	KE_1_005	2009	FY 2017/18	Recurrent	1879.96
level1	KE_1_016	2009	FY 2017/18	Recurrent	7001.93
level1	KE_1_017	2009	FY 2017/18	Recurrent	5203.8
level1	KE_1_009	2009	FY 2017/18	Recurrent	6120.07
level1	KE_1_010	2009	FY 2017/18	Recurrent	4079.39
level1	KE_1_012	2009	FY 2017/18	Recurrent	6807.16
level1	KE_1_044	2009	FY 2017/18	Recurrent	4904.44
level1	KE_1_001	2009	FY 2017/18	Recurrent	8571.88
level1	KE_1_021	2009	FY 2017/18	Recurrent	5382.31
level1	KE_1_047	2009	FY 2017/18	Recurrent	12060.02
level1	KE_1_032	2009	FY 2017/18	Recurrent	9765.68
level1	KE_1_029	2009	FY 2017/18	Recurrent	4505.99
level1	KE_1_033	2009	FY 2017/18	Recurrent	6118.65
level1	KE_1_046	2009	FY 2017/18	Recurrent	4155.17
level1	KE_1_018	2009	FY 2017/18	Recurrent	3841.6
level1	KE_1_019	2009	FY 2017/18	Recurrent	4610.36
level1	KE_1_025	2009	FY 2017/18	Recurrent	3062.23
level1	KE_1_041	2009	FY 2017/18	Recurrent	4618.91
level1	KE_1_006	2009	FY 2017/18	Recurrent	1399.96
level1	KE_1_004	2009	FY 2017/18	Recurrent	3336.71
level1	KE_1_013	2009	FY 2017/18	Recurrent	3024.66
level1	KE_1_026	2009	FY 2017/18	Recurrent	4429.65
level1	KE_1_023	2009	FY 2017/18	Recurrent	7232.46
level1	KE_1_027	2009	FY 2017/18	Recurrent	5041.72
level1	KE_1_038	2009	FY 2017/18	Recurrent	3346.29
level1	KE_1_008	2009	FY 2017/18	Recurrent	2525.35
level1	KE_1_024	2009	FY 2017/18	Recurrent	3468.59
\.


--
-- Name: budget_allocation pk_budget_allocation; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.budget_allocation
    ADD CONSTRAINT pk_budget_allocation PRIMARY KEY (geo_level, geo_code, geo_version, financial_year, allocation);


--
-- PostgreSQL database dump complete
--
