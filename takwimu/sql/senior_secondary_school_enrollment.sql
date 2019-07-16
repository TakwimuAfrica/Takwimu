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

ALTER TABLE IF EXISTS ONLY public.senior_secondary_school_enrollment DROP CONSTRAINT IF EXISTS pk_senior_secondary_school_enrollment;
DROP TABLE IF EXISTS public.senior_secondary_school_enrollment;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: senior_secondary_school_enrollment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.senior_secondary_school_enrollment (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    sex character varying(128) NOT NULL,
    senior_secondary_school_enrollment_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: senior_secondary_school_enrollment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.senior_secondary_school_enrollment (geo_level, geo_code, geo_version, sex, senior_secondary_school_enrollment_year, total) FROM stdin;
country	NG	2009	Female	2015	2281418
country	NG	2009	Male	2015	2629526
country	NG	2009	Female	2016	2058117
country	NG	2009	Male	2016	2417192
level1	NG_1_001	2009	Female	2015	21263
level1	NG_1_001	2009	Male	2015	20768
level1	NG_1_001	2009	Female	2016	15917
level1	NG_1_001	2009	Male	2016	12580
level1	NG_1_002	2009	Female	2015	34300
level1	NG_1_002	2009	Male	2015	44636
level1	NG_1_002	2009	Female	2016	34999
level1	NG_1_002	2009	Male	2016	45546
level1	NG_1_003	2009	Female	2015	155368
level1	NG_1_003	2009	Male	2015	154729
level1	NG_1_003	2009	Female	2016	79775
level1	NG_1_003	2009	Male	2016	130116
level1	NG_1_004	2009	Female	2015	29939
level1	NG_1_004	2009	Male	2015	27000
level1	NG_1_004	2009	Female	2016	31606
level1	NG_1_004	2009	Male	2016	27167
level1	NG_1_005	2009	Female	2015	40402
level1	NG_1_005	2009	Male	2015	65721
level1	NG_1_005	2009	Female	2016	47416
level1	NG_1_005	2009	Male	2016	75130
level1	NG_1_006	2009	Female	2015	21597
level1	NG_1_006	2009	Male	2015	24259
level1	NG_1_006	2009	Female	2016	15462
level1	NG_1_006	2009	Male	2016	16986
level1	NG_1_007	2009	Female	2015	188753
level1	NG_1_007	2009	Male	2015	245468
level1	NG_1_007	2009	Female	2016	44421
level1	NG_1_007	2009	Male	2016	53788
level1	NG_1_008	2009	Female	2016	28810
level1	NG_1_008	2009	Male	2016	39726
level1	NG_1_009	2009	Female	2015	69579
level1	NG_1_009	2009	Male	2015	67092
level1	NG_1_009	2009	Female	2016	25244
level1	NG_1_009	2009	Male	2016	25953
level1	NG_1_010	2009	Female	2015	52281
level1	NG_1_010	2009	Male	2015	54200
level1	NG_1_010	2009	Female	2016	61847
level1	NG_1_010	2009	Male	2016	62726
level1	NG_1_011	2009	Female	2015	34886
level1	NG_1_011	2009	Male	2015	31190
level1	NG_1_011	2009	Female	2016	40304
level1	NG_1_011	2009	Male	2016	35808
level1	NG_1_012	2009	Female	2015	48385
level1	NG_1_012	2009	Male	2015	48550
level1	NG_1_012	2009	Female	2016	62744
level1	NG_1_012	2009	Male	2016	59787
level1	NG_1_013	2009	Female	2015	27891
level1	NG_1_013	2009	Male	2015	28283
level1	NG_1_013	2009	Female	2016	25006
level1	NG_1_013	2009	Male	2016	25179
level1	NG_1_014	2009	Female	2015	66113
level1	NG_1_014	2009	Male	2015	53120
level1	NG_1_014	2009	Female	2016	60996
level1	NG_1_014	2009	Male	2016	48796
level1	NG_1_015	2009	Female	2015	36105
level1	NG_1_015	2009	Male	2015	31858
level1	NG_1_015	2009	Female	2016	29672
level1	NG_1_015	2009	Male	2016	27966
level1	NG_1_016	2009	Female	2015	24994
level1	NG_1_016	2009	Male	2015	38742
level1	NG_1_016	2009	Female	2016	27155
level1	NG_1_016	2009	Male	2016	38081
level1	NG_1_017	2009	Female	2015	245488
level1	NG_1_017	2009	Male	2015	232477
level1	NG_1_017	2009	Female	2016	205016
level1	NG_1_017	2009	Male	2016	179880
level1	NG_1_018	2009	Female	2015	25864
level1	NG_1_018	2009	Male	2015	52722
level1	NG_1_018	2009	Female	2016	31371
level1	NG_1_018	2009	Male	2016	55006
level1	NG_1_019	2009	Female	2015	61788
level1	NG_1_019	2009	Male	2015	74464
level1	NG_1_019	2009	Female	2016	76358
level1	NG_1_019	2009	Male	2016	89908
level1	NG_1_020	2009	Female	2015	120731
level1	NG_1_020	2009	Male	2015	177467
level1	NG_1_020	2009	Female	2016	111502
level1	NG_1_020	2009	Male	2016	161304
level1	NG_1_021	2009	Female	2015	52279
level1	NG_1_021	2009	Male	2015	103954
level1	NG_1_021	2009	Female	2016	62457
level1	NG_1_021	2009	Male	2016	106949
level1	NG_1_022	2009	Female	2016	23125
level1	NG_1_022	2009	Male	2016	55369
level1	NG_1_023	2009	Female	2015	35601
level1	NG_1_023	2009	Male	2015	40681
level1	NG_1_023	2009	Female	2016	26917
level1	NG_1_023	2009	Male	2016	29454
level1	NG_1_024	2009	Female	2015	47019
level1	NG_1_024	2009	Male	2015	52519
level1	NG_1_024	2009	Female	2016	48695
level1	NG_1_024	2009	Male	2016	54752
level1	NG_1_025	2009	Female	2015	191285
level1	NG_1_025	2009	Male	2015	183671
level1	NG_1_025	2009	Female	2016	185379
level1	NG_1_025	2009	Male	2016	175485
level1	NG_1_026	2009	Female	2015	37640
level1	NG_1_026	2009	Male	2015	50454
level1	NG_1_026	2009	Female	2016	37813
level1	NG_1_026	2009	Male	2016	49305
level1	NG_1_027	2009	Female	2015	63101
level1	NG_1_027	2009	Male	2015	91850
level1	NG_1_027	2009	Female	2016	69493
level1	NG_1_027	2009	Male	2016	93565
level1	NG_1_028	2009	Female	2015	125979
level1	NG_1_028	2009	Male	2015	125064
level1	NG_1_028	2009	Female	2016	119309
level1	NG_1_028	2009	Male	2016	113185
level1	NG_1_029	2009	Female	2015	71899
level1	NG_1_029	2009	Male	2015	75259
level1	NG_1_029	2009	Female	2016	53841
level1	NG_1_029	2009	Male	2016	53854
level1	NG_1_030	2009	Female	2015	68605
level1	NG_1_030	2009	Male	2015	70065
level1	NG_1_030	2009	Female	2016	40974
level1	NG_1_030	2009	Male	2016	44190
level1	NG_1_031	2009	Female	2015	147412
level1	NG_1_031	2009	Male	2015	140755
level1	NG_1_031	2009	Female	2016	123603
level1	NG_1_031	2009	Male	2016	119528
level1	NG_1_032	2009	Female	2015	47524
level1	NG_1_032	2009	Male	2015	55501
level1	NG_1_032	2009	Female	2016	38930
level1	NG_1_032	2009	Male	2016	44582
level1	NG_1_033	2009	Female	2016	62424
level1	NG_1_033	2009	Male	2016	51085
level1	NG_1_034	2009	Female	2015	20610
level1	NG_1_034	2009	Male	2015	39411
level1	NG_1_034	2009	Female	2016	27848
level1	NG_1_034	2009	Male	2016	50240
level1	NG_1_035	2009	Female	2015	20717
level1	NG_1_035	2009	Male	2015	26588
level1	NG_1_035	2009	Female	2016	21955
level1	NG_1_035	2009	Male	2016	29375
level1	NG_1_036	2009	Female	2015	26373
level1	NG_1_036	2009	Male	2015	49469
level1	NG_1_036	2009	Female	2016	15063
level1	NG_1_036	2009	Male	2016	28517
level1	NG_1_037	2009	Female	2015	19647
level1	NG_1_037	2009	Male	2015	51539
level1	NG_1_037	2009	Female	2016	44670
level1	NG_1_037	2009	Male	2016	106324
\.


--
-- Name: senior_secondary_school_enrollment pk_senior_secondary_school_enrollment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.senior_secondary_school_enrollment
    ADD CONSTRAINT pk_senior_secondary_school_enrollment PRIMARY KEY (geo_level, geo_code, geo_version, sex, senior_secondary_school_enrollment_year);


--
-- PostgreSQL database dump complete
--
