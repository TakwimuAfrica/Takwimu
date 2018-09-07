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

ALTER TABLE IF EXISTS ONLY public.health_workers DROP CONSTRAINT IF EXISTS pk_health_workers;
DROP TABLE IF EXISTS public.health_workers;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: health_workers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.health_workers (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    workers character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: health_workers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.health_workers (geo_level, geo_code, geo_version, workers, total) FROM stdin;
level1	TZ_1_001	2009	assistant medical oficer	67
level1	TZ_1_001	2009	assistant nursing officer	258
level1	TZ_1_001	2009	clinical assistant	35
level1	TZ_1_001	2009	clinical officer	326
level1	TZ_1_001	2009	medical attendant	944
level1	TZ_1_001	2009	medical officers	82
level1	TZ_1_001	2009	nurses	693
level1	TZ_1_001	2009	nursing officer	98
level1	TZ_1_001	2009	nutrition officer	3
level1	TZ_1_001	2009	MO and AMO per 10000	1
level1	TZ_1_001	2009	nurses and midwives per 10000	4
level1	TZ_1_001	2009	pharmacists per 10000	0
level1	TZ_1_001	2009	clinicians per 10000	3
level1	TZ_1_001	2009	HRH patient ratio	7
level1	TZ_1_003	2009	assistant medical oficer	217
level1	TZ_1_003	2009	assistant nursing officer	1352
level1	TZ_1_003	2009	clinical assistant	48
level1	TZ_1_003	2009	clinical officer	653
level1	TZ_1_003	2009	medical attendant	1640
level1	TZ_1_003	2009	medical officers	541
level1	TZ_1_003	2009	nurses	1546
level1	TZ_1_003	2009	nursing officer	604
level1	TZ_1_003	2009	nutrition officer	15
level1	TZ_1_003	2009	MO and AMO per 10000	2
level1	TZ_1_003	2009	nurses and midwives per 10000	3
level1	TZ_1_003	2009	pharmacists per 10000	0
level1	TZ_1_003	2009	clinicians per 10000	4
level1	TZ_1_003	2009	HRH patient ratio	7
level1	TZ_1_002	2009	assistant medical oficer	72
level1	TZ_1_002	2009	assistant nursing officer	201
level1	TZ_1_002	2009	clinical assistant	50
level1	TZ_1_002	2009	clinical officer	298
level1	TZ_1_002	2009	medical attendant	748
level1	TZ_1_002	2009	medical officers	98
level1	TZ_1_002	2009	nurses	704
level1	TZ_1_002	2009	nursing officer	88
level1	TZ_1_002	2009	nutrition officer	3
level1	TZ_1_002	2009	MO and AMO per 10000	1
level1	TZ_1_002	2009	nurses and midwives per 10000	3
level1	TZ_1_002	2009	pharmacists per 10000	0
level1	TZ_1_002	2009	clinicians per 10000	2
level1	TZ_1_002	2009	HRH patient ratio	6
level1	TZ_1_004	2009	assistant medical oficer	37
level1	TZ_1_004	2009	assistant nursing officer	115
level1	TZ_1_004	2009	clinical assistant	44
level1	TZ_1_004	2009	clinical officer	134
level1	TZ_1_004	2009	medical attendant	340
level1	TZ_1_004	2009	medical officers	15
level1	TZ_1_004	2009	nurses	283
level1	TZ_1_004	2009	nursing officer	6
level1	TZ_1_004	2009	nutrition officer	0
level1	TZ_1_004	2009	MO and AMO per 10000	0
level1	TZ_1_004	2009	nurses and midwives per 10000	2
level1	TZ_1_004	2009	pharmacists per 10000	0
level1	TZ_1_004	2009	clinicians per 10000	1
level1	TZ_1_004	2009	HRH patient ratio	3
level1	TZ_1_005	2009	assistant medical oficer	53
level1	TZ_1_005	2009	assistant nursing officer	90
level1	TZ_1_005	2009	clinical assistant	51
level1	TZ_1_005	2009	clinical officer	241
level1	TZ_1_005	2009	medical attendant	509
level1	TZ_1_005	2009	medical officers	51
level1	TZ_1_005	2009	nurses	617
level1	TZ_1_005	2009	nursing officer	26
level1	TZ_1_005	2009	nutrition officer	4
level1	TZ_1_005	2009	MO and AMO per 10000	1
level1	TZ_1_005	2009	nurses and midwives per 10000	6
level1	TZ_1_005	2009	pharmacists per 10000	0
level1	TZ_1_005	2009	clinicians per 10000	4
level1	TZ_1_005	2009	HRH patient ratio	11
level1	TZ_1_006	2009	assistant medical oficer	64
level1	TZ_1_006	2009	assistant nursing officer	281
level1	TZ_1_006	2009	clinical assistant	31
level1	TZ_1_006	2009	clinical officer	203
level1	TZ_1_006	2009	medical attendant	1002
level1	TZ_1_006	2009	medical officers	31
level1	TZ_1_006	2009	nurses	745
level1	TZ_1_006	2009	nursing officer	56
level1	TZ_1_006	2009	nutrition officer	2
level1	TZ_1_006	2009	MO and AMO per 10000	0
level1	TZ_1_006	2009	nurses and midwives per 10000	3
level1	TZ_1_006	2009	pharmacists per 10000	0
level1	TZ_1_006	2009	clinicians per 10000	1
level1	TZ_1_006	2009	HRH patient ratio	4
level1	TZ_1_009	2009	assistant medical oficer	18
level1	TZ_1_009	2009	assistant nursing officer	20
level1	TZ_1_009	2009	clinical assistant	9
level1	TZ_1_009	2009	clinical officer	31
level1	TZ_1_009	2009	medical attendant	140
level1	TZ_1_009	2009	medical officers	7
level1	TZ_1_009	2009	nurses	66
level1	TZ_1_009	2009	nursing officer	4
level1	TZ_1_009	2009	nutrition officer	0
level1	TZ_1_009	2009	MO and AMO per 10000	0
level1	TZ_1_009	2009	nurses and midwives per 10000	1
level1	TZ_1_009	2009	pharmacists per 10000	0
level1	TZ_1_009	2009	clinicians per 10000	1
level1	TZ_1_009	2009	HRH patient ratio	2
level1	TZ_1_010	2009	assistant medical oficer	61
level1	TZ_1_010	2009	assistant nursing officer	107
level1	TZ_1_010	2009	clinical assistant	52
level1	TZ_1_010	2009	clinical officer	124
level1	TZ_1_010	2009	medical attendant	612
level1	TZ_1_010	2009	medical officers	13
level1	TZ_1_010	2009	nurses	409
level1	TZ_1_010	2009	nursing officer	23
level1	TZ_1_010	2009	nutrition officer	0
level1	TZ_1_010	2009	MO and AMO per 10000	0
level1	TZ_1_010	2009	nurses and midwives per 10000	2
level1	TZ_1_010	2009	pharmacists per 10000	0
level1	TZ_1_010	2009	clinicians per 10000	1
level1	TZ_1_010	2009	HRH patient ratio	3
level1	TZ_1_011	2009	assistant medical oficer	151
level1	TZ_1_011	2009	assistant nursing officer	505
level1	TZ_1_011	2009	clinical assistant	60
level1	TZ_1_011	2009	clinical officer	488
level1	TZ_1_011	2009	medical attendant	1927
level1	TZ_1_011	2009	medical officers	100
level1	TZ_1_011	2009	nurses	1074
level1	TZ_1_011	2009	nursing officer	164
level1	TZ_1_011	2009	nutrition officer	4
level1	TZ_1_011	2009	MO and AMO per 10000	1
level1	TZ_1_011	2009	nurses and midwives per 10000	6
level1	TZ_1_011	2009	pharmacists per 10000	0
level1	TZ_1_011	2009	clinicians per 10000	5
level1	TZ_1_011	2009	HRH patient ratio	11
level1	TZ_1_014	2009	assistant medical oficer	57
level1	TZ_1_014	2009	assistant nursing officer	150
level1	TZ_1_014	2009	clinical assistant	28
level1	TZ_1_014	2009	clinical officer	166
level1	TZ_1_014	2009	medical attendant	647
level1	TZ_1_014	2009	medical officers	27
level1	TZ_1_014	2009	nurses	333
level1	TZ_1_014	2009	nursing officer	8
level1	TZ_1_014	2009	nutrition officer	0
level1	TZ_1_014	2009	MO and AMO per 10000	1
level1	TZ_1_014	2009	nurses and midwives per 10000	4
level1	TZ_1_014	2009	pharmacists per 10000	0
level1	TZ_1_014	2009	clinicians per 10000	3
level1	TZ_1_014	2009	HRH patient ratio	7
level1	TZ_1_015	2009	assistant medical oficer	51
level1	TZ_1_015	2009	assistant nursing officer	354
level1	TZ_1_015	2009	clinical assistant	41
level1	TZ_1_015	2009	clinical officer	176
level1	TZ_1_015	2009	medical attendant	729
level1	TZ_1_015	2009	medical officers	37
level1	TZ_1_015	2009	nurses	459
level1	TZ_1_015	2009	nursing officer	41
level1	TZ_1_015	2009	nutrition officer	2
level1	TZ_1_015	2009	MO and AMO per 10000	1
level1	TZ_1_015	2009	nurses and midwives per 10000	3
level1	TZ_1_015	2009	pharmacists per 10000	0
level1	TZ_1_015	2009	clinicians per 10000	2
level1	TZ_1_015	2009	HRH patient ratio	5
level1	TZ_1_016	2009	assistant medical oficer	49
level1	TZ_1_016	2009	assistant nursing officer	136
level1	TZ_1_016	2009	clinical assistant	55
level1	TZ_1_016	2009	clinical officer	201
level1	TZ_1_016	2009	medical attendant	622
level1	TZ_1_016	2009	medical officers	33
level1	TZ_1_016	2009	nurses	640
level1	TZ_1_016	2009	nursing officer	50
level1	TZ_1_016	2009	nutrition officer	2
level1	TZ_1_016	2009	MO and AMO per 10000	0
level1	TZ_1_016	2009	nurses and midwives per 10000	3
level1	TZ_1_016	2009	pharmacists per 10000	0
level1	TZ_1_016	2009	clinicians per 10000	2
level1	TZ_1_016	2009	HRH patient ratio	5
level1	TZ_1_017	2009	assistant medical oficer	126
level1	TZ_1_017	2009	assistant nursing officer	379
level1	TZ_1_017	2009	clinical assistant	124
level1	TZ_1_017	2009	clinical officer	384
level1	TZ_1_017	2009	medical attendant	1846
level1	TZ_1_017	2009	medical officers	200
level1	TZ_1_017	2009	nurses	1332
level1	TZ_1_017	2009	nursing officer	193
level1	TZ_1_017	2009	nutrition officer	9
level1	TZ_1_017	2009	MO and AMO per 10000	1
level1	TZ_1_017	2009	nurses and midwives per 10000	5
level1	TZ_1_017	2009	pharmacists per 10000	0
level1	TZ_1_017	2009	clinicians per 10000	3
level1	TZ_1_017	2009	HRH patient ratio	8
level1	TZ_1_018	2009	assistant medical oficer	134
level1	TZ_1_018	2009	assistant nursing officer	233
level1	TZ_1_018	2009	clinical assistant	68
level1	TZ_1_018	2009	clinical officer	529
level1	TZ_1_018	2009	medical attendant	1032
level1	TZ_1_018	2009	medical officers	75
level1	TZ_1_018	2009	nurses	793
level1	TZ_1_018	2009	nursing officer	167
level1	TZ_1_018	2009	nutrition officer	1
level1	TZ_1_018	2009	MO and AMO per 10000	1
level1	TZ_1_018	2009	nurses and midwives per 10000	3
level1	TZ_1_018	2009	pharmacists per 10000	0
level1	TZ_1_018	2009	clinicians per 10000	4
level1	TZ_1_018	2009	HRH patient ratio	7
level1	TZ_1_019	2009	assistant medical oficer	54
level1	TZ_1_019	2009	assistant nursing officer	212
level1	TZ_1_019	2009	clinical assistant	29
level1	TZ_1_019	2009	clinical officer	157
level1	TZ_1_019	2009	medical attendant	567
level1	TZ_1_019	2009	medical officers	42
level1	TZ_1_019	2009	nurses	370
level1	TZ_1_019	2009	nursing officer	17
level1	TZ_1_019	2009	nutrition officer	1
level1	TZ_1_019	2009	MO and AMO per 10000	1
level1	TZ_1_019	2009	nurses and midwives per 10000	3
level1	TZ_1_019	2009	pharmacists per 10000	0
level1	TZ_1_019	2009	clinicians per 10000	2
level1	TZ_1_019	2009	HRH patient ratio	5
level1	TZ_1_020	2009	assistant medical oficer	66
level1	TZ_1_020	2009	assistant nursing officer	381
level1	TZ_1_020	2009	clinical assistant	72
level1	TZ_1_020	2009	clinical officer	280
level1	TZ_1_020	2009	medical attendant	1177
level1	TZ_1_020	2009	medical officers	117
level1	TZ_1_020	2009	nurses	985
level1	TZ_1_020	2009	nursing officer	72
level1	TZ_1_020	2009	nutrition officer	1
level1	TZ_1_020	2009	MO and AMO per 10000	1
level1	TZ_1_020	2009	nurses and midwives per 10000	3
level1	TZ_1_020	2009	pharmacists per 10000	0
level1	TZ_1_020	2009	clinicians per 10000	2
level1	TZ_1_020	2009	HRH patient ratio	5
level1	TZ_1_021	2009	assistant medical oficer	33
level1	TZ_1_021	2009	assistant nursing officer	126
level1	TZ_1_021	2009	clinical assistant	52
level1	TZ_1_021	2009	clinical officer	108
level1	TZ_1_021	2009	medical attendant	600
level1	TZ_1_021	2009	medical officers	22
level1	TZ_1_021	2009	nurses	531
level1	TZ_1_021	2009	nursing officer	28
level1	TZ_1_021	2009	nutrition officer	0
level1	TZ_1_021	2009	MO and AMO per 10000	1
level1	TZ_1_021	2009	nurses and midwives per 10000	7
level1	TZ_1_021	2009	pharmacists per 10000	0
level1	TZ_1_021	2009	clinicians per 10000	3
level1	TZ_1_021	2009	HRH patient ratio	11
level1	TZ_1_022	2009	assistant medical oficer	74
level1	TZ_1_022	2009	assistant nursing officer	114
level1	TZ_1_022	2009	clinical assistant	31
level1	TZ_1_022	2009	clinical officer	406
level1	TZ_1_022	2009	medical attendant	621
level1	TZ_1_022	2009	medical officers	59
level1	TZ_1_022	2009	nurses	469
level1	TZ_1_022	2009	nursing officer	126
level1	TZ_1_022	2009	nutrition officer	1
level1	TZ_1_022	2009	MO and AMO per 10000	1
level1	TZ_1_022	2009	nurses and midwives per 10000	4
level1	TZ_1_022	2009	pharmacists per 10000	0
level1	TZ_1_022	2009	clinicians per 10000	5
level1	TZ_1_022	2009	HRH patient ratio	9
level1	TZ_1_023	2009	assistant medical oficer	26
level1	TZ_1_023	2009	assistant nursing officer	72
level1	TZ_1_023	2009	clinical assistant	33
level1	TZ_1_023	2009	clinical officer	102
level1	TZ_1_023	2009	medical attendant	516
level1	TZ_1_023	2009	medical officers	25
level1	TZ_1_023	2009	nurses	276
level1	TZ_1_023	2009	nursing officer	12
level1	TZ_1_023	2009	nutrition officer	0
level1	TZ_1_023	2009	MO and AMO per 10000	0
level1	TZ_1_023	2009	nurses and midwives per 10000	3
level1	TZ_1_023	2009	pharmacists per 10000	0
level1	TZ_1_023	2009	clinicians per 10000	2
level1	TZ_1_023	2009	HRH patient ratio	4
level1	TZ_1_024	2009	assistant medical oficer	66
level1	TZ_1_024	2009	assistant nursing officer	116
level1	TZ_1_024	2009	clinical assistant	66
level1	TZ_1_024	2009	clinical officer	181
level1	TZ_1_024	2009	medical attendant	925
level1	TZ_1_024	2009	medical officers	25
level1	TZ_1_024	2009	nurses	602
level1	TZ_1_024	2009	nursing officer	32
level1	TZ_1_024	2009	nutrition officer	5
level1	TZ_1_024	2009	MO and AMO per 10000	1
level1	TZ_1_024	2009	nurses and midwives per 10000	4
level1	TZ_1_024	2009	pharmacists per 10000	0
level1	TZ_1_024	2009	clinicians per 10000	2
level1	TZ_1_024	2009	HRH patient ratio	7
level1	TZ_1_025	2009	assistant medical oficer	39
level1	TZ_1_025	2009	assistant nursing officer	162
level1	TZ_1_025	2009	clinical assistant	53
level1	TZ_1_025	2009	clinical officer	162
level1	TZ_1_025	2009	medical attendant	650
level1	TZ_1_025	2009	medical officers	15
level1	TZ_1_025	2009	nurses	431
level1	TZ_1_025	2009	nursing officer	18
level1	TZ_1_025	2009	nutrition officer	1
level1	TZ_1_025	2009	MO and AMO per 10000	0
level1	TZ_1_025	2009	nurses and midwives per 10000	3
level1	TZ_1_025	2009	pharmacists per 10000	0
level1	TZ_1_025	2009	clinicians per 10000	2
level1	TZ_1_025	2009	HRH patient ratio	4
level1	TZ_1_026	2009	assistant medical oficer	23
level1	TZ_1_026	2009	assistant nursing officer	70
level1	TZ_1_026	2009	clinical assistant	53
level1	TZ_1_026	2009	clinical officer	104
level1	TZ_1_026	2009	medical attendant	415
level1	TZ_1_026	2009	medical officers	11
level1	TZ_1_026	2009	nurses	223
level1	TZ_1_026	2009	nursing officer	1
level1	TZ_1_026	2009	nutrition officer	0
level1	TZ_1_026	2009	MO and AMO per 10000	0
level1	TZ_1_026	2009	nurses and midwives per 10000	1
level1	TZ_1_026	2009	pharmacists per 10000	0
level1	TZ_1_026	2009	clinicians per 10000	1
level1	TZ_1_026	2009	HRH patient ratio	3
level1	TZ_1_027	2009	assistant medical oficer	44
level1	TZ_1_027	2009	assistant nursing officer	113
level1	TZ_1_027	2009	clinical assistant	24
level1	TZ_1_027	2009	clinical officer	125
level1	TZ_1_027	2009	medical attendant	655
level1	TZ_1_027	2009	medical officers	14
level1	TZ_1_027	2009	nurses	460
level1	TZ_1_027	2009	nursing officer	53
level1	TZ_1_027	2009	nutrition officer	3
level1	TZ_1_027	2009	MO and AMO per 10000	0
level1	TZ_1_027	2009	nurses and midwives per 10000	3
level1	TZ_1_027	2009	pharmacists per 10000	0
level1	TZ_1_027	2009	clinicians per 10000	1
level1	TZ_1_027	2009	HRH patient ratio	5
level1	TZ_1_029	2009	assistant medical oficer	47
level1	TZ_1_029	2009	assistant nursing officer	155
level1	TZ_1_029	2009	clinical assistant	45
level1	TZ_1_029	2009	clinical officer	139
level1	TZ_1_029	2009	medical attendant	548
level1	TZ_1_029	2009	medical officers	11
level1	TZ_1_029	2009	nurses	372
level1	TZ_1_029	2009	nursing officer	18
level1	TZ_1_029	2009	nutrition officer	0
level1	TZ_1_029	2009	MO and AMO per 10000	0
level1	TZ_1_029	2009	nurses and midwives per 10000	2
level1	TZ_1_029	2009	pharmacists per 10000	0
level1	TZ_1_029	2009	clinicians per 10000	1
level1	TZ_1_029	2009	HRH patient ratio	3
level1	TZ_1_028	2009	assistant medical oficer	108
level1	TZ_1_028	2009	assistant nursing officer	199
level1	TZ_1_028	2009	clinical assistant	62
level1	TZ_1_028	2009	clinical officer	446
level1	TZ_1_028	2009	medical attendant	1210
level1	TZ_1_028	2009	medical officers	58
level1	TZ_1_028	2009	nurses	667
level1	TZ_1_028	2009	nursing officer	56
level1	TZ_1_028	2009	nutrition officer	3
level1	TZ_1_028	2009	MO and AMO per 10000	1
level1	TZ_1_028	2009	nurses and midwives per 10000	3
level1	TZ_1_028	2009	pharmacists per 10000	0
level1	TZ_1_028	2009	clinicians per 10000	3
level1	TZ_1_028	2009	HRH patient ratio	6
country	TZ	2009	assistant medical oficer	1737
country	TZ	2009	assistant nursing officer	5901
country	TZ	2009	clinical assistant	1216
country	TZ	2009	clinical officer	6164
country	TZ	2009	medical attendant	20622
country	TZ	2009	medical officers	1709
country	TZ	2009	nurses	15080
country	TZ	2009	nursing officer	1961
country	TZ	2009	nutrition officer	60
country	TZ	2009	MO and AMO per 10000	1
country	TZ	2009	nurses and midwives per 10000	3
country	TZ	2009	pharmacists per 10000	0
country	TZ	2009	clinicians per 10000	2
country	TZ	2009	HRH patient ratio	6
\.


--
-- Name: health_workers pk_health_workers; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_workers
    ADD CONSTRAINT pk_health_workers PRIMARY KEY (geo_level, geo_code, geo_version, workers);


--
-- PostgreSQL database dump complete
--

