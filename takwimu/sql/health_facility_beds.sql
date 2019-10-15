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

ALTER TABLE IF EXISTS ONLY public.health_facility_beds DROP CONSTRAINT IF EXISTS pk_health_facility_beds;
DROP TABLE IF EXISTS public.health_facility_beds;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: health_facility_beds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.health_facility_beds (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    facility_type character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: health_facility_beds; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.health_facility_beds (geo_level, geo_code, geo_version, facility_type, total) FROM stdin;
level1	KE_1_030	2009	Basic Primary Health Care Facility	246
level1	KE_1_036	2009	Basic Primary Health Care Facility	130
level1	KE_1_039	2009	Basic Primary Health Care Facility	507
level1	KE_1_040	2009	Basic Primary Health Care Facility	433
level1	KE_1_028	2009	Basic Primary Health Care Facility	320
level1	KE_1_014	2009	Basic Primary Health Care Facility	301
level1	KE_1_007	2009	Basic Primary Health Care Facility	118
level1	KE_1_043	2009	Basic Primary Health Care Facility	594
level1	KE_1_011	2009	Basic Primary Health Care Facility	75
level1	KE_1_034	2009	Basic Primary Health Care Facility	479
level1	KE_1_037	2009	Basic Primary Health Care Facility	646
country	KE	2009	Basic Primary Health Care Facility	14249
level1	KE_1_035	2009	Basic Primary Health Care Facility	177
level1	KE_1_022	2009	Basic Primary Health Care Facility	573
level1	KE_1_003	2009	Basic Primary Health Care Facility	190
level1	KE_1_020	2009	Basic Primary Health Care Facility	436
level1	KE_1_045	2009	Basic Primary Health Care Facility	271
level1	KE_1_042	2009	Basic Primary Health Care Facility	453
level1	KE_1_015	2009	Basic Primary Health Care Facility	377
level1	KE_1_002	2009	Basic Primary Health Care Facility	47
level1	KE_1_031	2009	Basic Primary Health Care Facility	167
level1	KE_1_005	2009	Basic Primary Health Care Facility	30
level1	KE_1_016	2009	Basic Primary Health Care Facility	352
level1	KE_1_017	2009	Basic Primary Health Care Facility	339
level1	KE_1_009	2009	Basic Primary Health Care Facility	381
level1	KE_1_010	2009	Basic Primary Health Care Facility	109
level1	KE_1_012	2009	Basic Primary Health Care Facility	321
level1	KE_1_044	2009	Basic Primary Health Care Facility	657
level1	KE_1_001	2009	Basic Primary Health Care Facility	164
level1	KE_1_021	2009	Basic Primary Health Care Facility	50
level1	KE_1_047	2009	Basic Primary Health Care Facility	1187
level1	KE_1_032	2009	Basic Primary Health Care Facility	496
level1	KE_1_029	2009	Basic Primary Health Care Facility	279
level1	KE_1_033	2009	Basic Primary Health Care Facility	446
level1	KE_1_046	2009	Basic Primary Health Care Facility	418
level1	KE_1_018	2009	Basic Primary Health Care Facility	205
level1	KE_1_019	2009	Basic Primary Health Care Facility	350
level1	KE_1_025	2009	Basic Primary Health Care Facility	107
level1	KE_1_041	2009	Basic Primary Health Care Facility	412
level1	KE_1_006	2009	Basic Primary Health Care Facility	90
level1	KE_1_004	2009	Basic Primary Health Care Facility	22
level1	KE_1_013	2009	Basic Primary Health Care Facility	116
level1	KE_1_026	2009	Basic Primary Health Care Facility	110
level1	KE_1_023	2009	Basic Primary Health Care Facility	336
level1	KE_1_027	2009	Basic Primary Health Care Facility	236
level1	KE_1_038	2009	Basic Primary Health Care Facility	329
level1	KE_1_008	2009	Basic Primary Health Care Facility	66
level1	KE_1_024	2009	Basic Primary Health Care Facility	101
level1	KE_1_030	2009	Primary Care Hospitals	419
level1	KE_1_036	2009	Primary Care Hospitals	576
level1	KE_1_039	2009	Primary Care Hospitals	793
level1	KE_1_040	2009	Primary Care Hospitals	562
level1	KE_1_028	2009	Primary Care Hospitals	493
level1	KE_1_014	2009	Primary Care Hospitals	391
level1	KE_1_007	2009	Primary Care Hospitals	405
level1	KE_1_043	2009	Primary Care Hospitals	611
level1	KE_1_011	2009	Primary Care Hospitals	380
level1	KE_1_034	2009	Primary Care Hospitals	571
level1	KE_1_037	2009	Primary Care Hospitals	707
country	KE	2009	Primary Care Hospitals	32314
level1	KE_1_035	2009	Primary Care Hospitals	1436
level1	KE_1_022	2009	Primary Care Hospitals	1942
level1	KE_1_003	2009	Primary Care Hospitals	648
level1	KE_1_020	2009	Primary Care Hospitals	564
level1	KE_1_045	2009	Primary Care Hospitals	1250
level1	KE_1_042	2009	Primary Care Hospitals	1397
level1	KE_1_015	2009	Primary Care Hospitals	827
level1	KE_1_002	2009	Primary Care Hospitals	400
level1	KE_1_031	2009	Primary Care Hospitals	475
level1	KE_1_005	2009	Primary Care Hospitals	165
level1	KE_1_016	2009	Primary Care Hospitals	968
level1	KE_1_017	2009	Primary Care Hospitals	503
level1	KE_1_009	2009	Primary Care Hospitals	257
level1	KE_1_010	2009	Primary Care Hospitals	345
level1	KE_1_012	2009	Primary Care Hospitals	1694
level1	KE_1_044	2009	Primary Care Hospitals	1067
level1	KE_1_001	2009	Primary Care Hospitals	1296
level1	KE_1_021	2009	Primary Care Hospitals	781
level1	KE_1_047	2009	Primary Care Hospitals	2646
level1	KE_1_032	2009	Primary Care Hospitals	1240
level1	KE_1_029	2009	Primary Care Hospitals	251
level1	KE_1_033	2009	Primary Care Hospitals	343
level1	KE_1_046	2009	Primary Care Hospitals	168
level1	KE_1_018	2009	Primary Care Hospitals	363
level1	KE_1_019	2009	Primary Care Hospitals	1032
level1	KE_1_025	2009	Primary Care Hospitals	398
level1	KE_1_041	2009	Primary Care Hospitals	401
level1	KE_1_006	2009	Primary Care Hospitals	347
level1	KE_1_004	2009	Primary Care Hospitals	214
level1	KE_1_013	2009	Primary Care Hospitals	668
level1	KE_1_026	2009	Primary Care Hospitals	534
level1	KE_1_023	2009	Primary Care Hospitals	191
level1	KE_1_027	2009	Primary Care Hospitals	665
level1	KE_1_038	2009	Primary Care Hospitals	344
level1	KE_1_008	2009	Primary Care Hospitals	343
level1	KE_1_024	2009	Primary Care Hospitals	243
level1	KE_1_030	2009	Secondary Care Hospitals	0
level1	KE_1_036	2009	Secondary Care Hospitals	0
level1	KE_1_039	2009	Secondary Care Hospitals	223
level1	KE_1_040	2009	Secondary Care Hospitals	185
level1	KE_1_028	2009	Secondary Care Hospitals	0
level1	KE_1_014	2009	Secondary Care Hospitals	618
level1	KE_1_007	2009	Secondary Care Hospitals	224
level1	KE_1_043	2009	Secondary Care Hospitals	280
level1	KE_1_011	2009	Secondary Care Hospitals	0
level1	KE_1_034	2009	Secondary Care Hospitals	0
level1	KE_1_037	2009	Secondary Care Hospitals	449
country	KE	2009	Secondary Care Hospitals	7161
level1	KE_1_035	2009	Secondary Care Hospitals	0
level1	KE_1_022	2009	Secondary Care Hospitals	530
level1	KE_1_003	2009	Secondary Care Hospitals	0
level1	KE_1_020	2009	Secondary Care Hospitals	0
level1	KE_1_045	2009	Secondary Care Hospitals	670
level1	KE_1_042	2009	Secondary Care Hospitals	457
level1	KE_1_015	2009	Secondary Care Hospitals	0
level1	KE_1_002	2009	Secondary Care Hospitals	0
level1	KE_1_031	2009	Secondary Care Hospitals	0
level1	KE_1_005	2009	Secondary Care Hospitals	0
level1	KE_1_016	2009	Secondary Care Hospitals	375
level1	KE_1_017	2009	Secondary Care Hospitals	126
level1	KE_1_009	2009	Secondary Care Hospitals	128
level1	KE_1_010	2009	Secondary Care Hospitals	89
level1	KE_1_012	2009	Secondary Care Hospitals	0
level1	KE_1_044	2009	Secondary Care Hospitals	0
level1	KE_1_001	2009	Secondary Care Hospitals	0
level1	KE_1_021	2009	Secondary Care Hospitals	0
level1	KE_1_047	2009	Secondary Care Hospitals	767
level1	KE_1_032	2009	Secondary Care Hospitals	588
level1	KE_1_029	2009	Secondary Care Hospitals	200
level1	KE_1_033	2009	Secondary Care Hospitals	155
level1	KE_1_046	2009	Secondary Care Hospitals	203
level1	KE_1_018	2009	Secondary Care Hospitals	0
level1	KE_1_019	2009	Secondary Care Hospitals	323
level1	KE_1_025	2009	Secondary Care Hospitals	0
level1	KE_1_041	2009	Secondary Care Hospitals	200
level1	KE_1_006	2009	Secondary Care Hospitals	0
level1	KE_1_004	2009	Secondary Care Hospitals	0
level1	KE_1_013	2009	Secondary Care Hospitals	0
level1	KE_1_026	2009	Secondary Care Hospitals	0
level1	KE_1_023	2009	Secondary Care Hospitals	211
level1	KE_1_027	2009	Secondary Care Hospitals	0
level1	KE_1_038	2009	Secondary Care Hospitals	0
level1	KE_1_008	2009	Secondary Care Hospitals	0
level1	KE_1_024	2009	Secondary Care Hospitals	160
level1	KE_1_030	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_036	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_039	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_040	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_028	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_014	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_007	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_043	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_011	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_034	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_037	2009	Specialised & Tertiary Referral Hospitals	0
country	KE	2009	Specialised & Tertiary Referral Hospitals	3004
level1	KE_1_035	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_022	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_003	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_020	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_045	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_042	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_015	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_002	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_031	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_005	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_016	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_017	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_009	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_010	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_012	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_044	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_001	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_021	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_047	2009	Specialised & Tertiary Referral Hospitals	2185
level1	KE_1_032	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_029	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_033	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_046	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_018	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_019	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_025	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_041	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_006	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_004	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_013	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_026	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_023	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_027	2009	Specialised & Tertiary Referral Hospitals	819
level1	KE_1_038	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_008	2009	Specialised & Tertiary Referral Hospitals	0
level1	KE_1_024	2009	Specialised & Tertiary Referral Hospitals	0
\.


--
-- Name: health_facility_beds pk_health_facility_beds; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.health_facility_beds
    ADD CONSTRAINT pk_health_facility_beds PRIMARY KEY (geo_level, geo_code, geo_version, facility_type);


--
-- PostgreSQL database dump complete
--
