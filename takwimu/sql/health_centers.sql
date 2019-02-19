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

ALTER TABLE IF EXISTS ONLY public.health_centers DROP CONSTRAINT IF EXISTS pk_health_centers;
DROP TABLE IF EXISTS public.health_centers;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: health_centers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.health_centers (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    centers character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: health_centers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.health_centers (geo_level, geo_code, geo_version, centers, total) FROM stdin;
level1	TZ_1_001	2009	clinic	0
level1	TZ_1_001	2009	dispensary	270
level1	TZ_1_001	2009	health centers	48
level1	TZ_1_001	2009	hospital	16
level1	TZ_1_003	2009	clinic	92
level1	TZ_1_003	2009	dispensary	417
level1	TZ_1_003	2009	health centers	51
level1	TZ_1_003	2009	hospital	39
level1	TZ_1_002	2009	clinic	4
level1	TZ_1_002	2009	dispensary	321
level1	TZ_1_002	2009	health centers	37
level1	TZ_1_002	2009	hospital	7
level1	TZ_1_004	2009	clinic	0
level1	TZ_1_004	2009	dispensary	121
level1	TZ_1_004	2009	health centers	19
level1	TZ_1_004	2009	hospital	3
level1	TZ_1_005	2009	clinic	3
level1	TZ_1_005	2009	dispensary	207
level1	TZ_1_005	2009	health centers	24
level1	TZ_1_005	2009	hospital	7
level1	TZ_1_006	2009	clinic	4
level1	TZ_1_006	2009	dispensary	249
level1	TZ_1_006	2009	health centers	31
level1	TZ_1_006	2009	hospital	14
level1	TZ_1_009	2009	clinic	0
level1	TZ_1_009	2009	dispensary	63
level1	TZ_1_009	2009	health centers	13
level1	TZ_1_009	2009	hospital	1
level1	TZ_1_010	2009	clinic	0
level1	TZ_1_010	2009	dispensary	228
level1	TZ_1_010	2009	health centers	27
level1	TZ_1_010	2009	hospital	6
level1	TZ_1_011	2009	clinic	4
level1	TZ_1_011	2009	dispensary	319
level1	TZ_1_011	2009	health centers	47
level1	TZ_1_011	2009	hospital	18
level1	TZ_1_014	2009	clinic	0
level1	TZ_1_014	2009	dispensary	196
level1	TZ_1_014	2009	health centers	17
level1	TZ_1_014	2009	hospital	9
level1	TZ_1_015	2009	clinic	2
level1	TZ_1_015	2009	dispensary	156
level1	TZ_1_015	2009	health centers	22
level1	TZ_1_015	2009	hospital	10
level1	TZ_1_016	2009	clinic	10
level1	TZ_1_016	2009	dispensary	219
level1	TZ_1_016	2009	health centers	36
level1	TZ_1_016	2009	hospital	10
level1	TZ_1_017	2009	clinic	20
level1	TZ_1_017	2009	dispensary	396
level1	TZ_1_017	2009	health centers	35
level1	TZ_1_017	2009	hospital	20
level1	TZ_1_018	2009	clinic	3
level1	TZ_1_018	2009	dispensary	298
level1	TZ_1_018	2009	health centers	44
level1	TZ_1_018	2009	hospital	12
level1	TZ_1_019	2009	clinic	0
level1	TZ_1_019	2009	dispensary	193
level1	TZ_1_019	2009	health centers	20
level1	TZ_1_019	2009	hospital	6
level1	TZ_1_020	2009	clinic	13
level1	TZ_1_020	2009	dispensary	288
level1	TZ_1_020	2009	health centers	45
level1	TZ_1_020	2009	hospital	16
level1	TZ_1_021	2009	clinic	0
level1	TZ_1_021	2009	dispensary	205
level1	TZ_1_021	2009	health centers	21
level1	TZ_1_021	2009	hospital	12
level1	TZ_1_022	2009	clinic	6
level1	TZ_1_022	2009	dispensary	250
level1	TZ_1_022	2009	health centers	24
level1	TZ_1_022	2009	hospital	6
level1	TZ_1_023	2009	clinic	2
level1	TZ_1_023	2009	dispensary	179
level1	TZ_1_023	2009	health centers	21
level1	TZ_1_023	2009	hospital	3
level1	TZ_1_024	2009	clinic	2
level1	TZ_1_024	2009	dispensary	236
level1	TZ_1_024	2009	health centers	27
level1	TZ_1_024	2009	hospital	10
level1	TZ_1_025	2009	clinic	2
level1	TZ_1_025	2009	dispensary	175
level1	TZ_1_025	2009	health centers	17
level1	TZ_1_025	2009	hospital	5
level1	TZ_1_026	2009	clinic	3
level1	TZ_1_026	2009	dispensary	182
level1	TZ_1_026	2009	health centers	14
level1	TZ_1_026	2009	hospital	5
level1	TZ_1_027	2009	clinic	2
level1	TZ_1_027	2009	dispensary	181
level1	TZ_1_027	2009	health centers	18
level1	TZ_1_027	2009	hospital	9
level1	TZ_1_029	2009	clinic	1
level1	TZ_1_029	2009	dispensary	258
level1	TZ_1_029	2009	health centers	19
level1	TZ_1_029	2009	hospital	8
level1	TZ_1_028	2009	clinic	3
level1	TZ_1_028	2009	dispensary	308
level1	TZ_1_028	2009	health centers	40
level1	TZ_1_028	2009	hospital	11
country	TZ	2009	clinic	176
country	TZ	2009	dispensary	5915
country	TZ	2009	health centers	717
country	TZ	2009	hospital	263
country	KE	2009	Dispensaries	3911
country	KE	2009	Health centres	932
country	KE	2009	Medical clinics	2267
country	KE	2009	Maternity homes	40
country	KE	2009	Nursing homes	166
country	KE	2009	County hospitals	463
country	KE	2009	National hospitals	16
\.


--
-- Name: health_centers pk_health_centers; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_centers
    ADD CONSTRAINT pk_health_centers PRIMARY KEY (geo_level, geo_code, geo_version, centers);


--
-- PostgreSQL database dump complete
--

