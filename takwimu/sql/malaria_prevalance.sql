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

ALTER TABLE IF EXISTS ONLY public.malaria_prevalence DROP CONSTRAINT IF EXISTS pk_malaria_prevalence;
DROP TABLE IF EXISTS public.malaria_prevalence;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: malaria_prevalence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.malaria_prevalence (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    malaria_prevalence_test character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: malaria_prevalence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.malaria_prevalence (geo_level, geo_code, geo_version, malaria_prevalence_test, total) FROM stdin;
country	NG	2009	According to RDT	164
country	NG	2009	According to microscopy	155
level1	NG_1_001	2009	According to RDT	64
level1	NG_1_001	2009	According to microscopy	64
level1	NG_1_002	2009	According to RDT	139
level1	NG_1_002	2009	According to microscopy	135
level1	NG_1_003	2009	According to RDT	106
level1	NG_1_003	2009	According to microscopy	95
level1	NG_1_004	2009	According to RDT	127
level1	NG_1_004	2009	According to microscopy	134
level1	NG_1_005	2009	According to RDT	253
level1	NG_1_005	2009	According to microscopy	238
level1	NG_1_006	2009	According to RDT	109
level1	NG_1_006	2009	According to microscopy	102
level1	NG_1_007	2009	According to RDT	246
level1	NG_1_007	2009	According to microscopy	230
level1	NG_1_008	2009	According to RDT	20
level1	NG_1_008	2009	According to microscopy	32
level1	NG_1_009	2009	According to RDT	90
level1	NG_1_009	2009	According to microscopy	82
level1	NG_1_010	2009	According to RDT	116
level1	NG_1_010	2009	According to microscopy	111
level1	NG_1_011	2009	According to RDT	131
level1	NG_1_011	2009	According to microscopy	120
level1	NG_1_012	2009	According to RDT	60
level1	NG_1_012	2009	According to microscopy	56
level1	NG_1_013	2009	According to RDT	75
level1	NG_1_013	2009	According to microscopy	75
level1	NG_1_014	2009	According to RDT	89
level1	NG_1_014	2009	According to microscopy	84
level1	NG_1_015	2009	According to RDT	26
level1	NG_1_015	2009	According to microscopy	25
level1	NG_1_016	2009	According to RDT	105
level1	NG_1_016	2009	According to microscopy	105
level1	NG_1_017	2009	According to RDT	105
level1	NG_1_017	2009	According to microscopy	98
level1	NG_1_018	2009	According to RDT	336
level1	NG_1_018	2009	According to microscopy	308
level1	NG_1_019	2009	According to RDT	250
level1	NG_1_019	2009	According to microscopy	233
level1	NG_1_020	2009	According to RDT	376
level1	NG_1_020	2009	According to microscopy	368
level1	NG_1_021	2009	According to RDT	463
level1	NG_1_021	2009	According to microscopy	445
level1	NG_1_022	2009	According to RDT	167
level1	NG_1_022	2009	According to microscopy	157
level1	NG_1_023	2009	According to RDT	143
level1	NG_1_023	2009	According to microscopy	131
level1	NG_1_024	2009	According to RDT	122
level1	NG_1_024	2009	According to microscopy	121
level1	NG_1_025	2009	According to RDT	270
level1	NG_1_025	2009	According to microscopy	246
level1	NG_1_026	2009	According to RDT	108
level1	NG_1_026	2009	According to microscopy	99
level1	NG_1_027	2009	According to RDT	265
level1	NG_1_027	2009	According to microscopy	258
level1	NG_1_028	2009	According to RDT	101
level1	NG_1_028	2009	According to microscopy	94
level1	NG_1_029	2009	According to RDT	129
level1	NG_1_029	2009	According to microscopy	121
level1	NG_1_030	2009	According to RDT	138
level1	NG_1_030	2009	According to microscopy	133
level1	NG_1_031	2009	According to RDT	244
level1	NG_1_031	2009	According to microscopy	220
level1	NG_1_032	2009	According to RDT	224
level1	NG_1_032	2009	According to microscopy	210
level1	NG_1_033	2009	According to RDT	187
level1	NG_1_033	2009	According to microscopy	184
level1	NG_1_034	2009	According to RDT	154
level1	NG_1_034	2009	According to microscopy	157
level1	NG_1_035	2009	According to RDT	130
level1	NG_1_035	2009	According to microscopy	119
level1	NG_1_036	2009	According to RDT	178
level1	NG_1_036	2009	According to microscopy	160
level1	NG_1_037	2009	According to RDT	206
level1	NG_1_037	2009	According to microscopy	185
\.


--
-- Name: malaria_prevalence pk_malaria_prevalence; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.malaria_prevalence
    ADD CONSTRAINT pk_malaria_prevalence PRIMARY KEY (geo_level, geo_code, geo_version, malaria_prevalence_test);


--
-- PostgreSQL database dump complete
--

