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

ALTER TABLE IF EXISTS ONLY public.hiv_patients_distribution DROP CONSTRAINT IF EXISTS pk_hiv_patients_distribution;
DROP TABLE IF EXISTS public.hiv_patients_distribution;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hiv_patients_distribution; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hiv_patients_distribution (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    hiv_patients_distribution_year character varying(128) NOT NULL,
    sex character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: hiv_patients_distribution; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.hiv_patients_distribution (geo_level, geo_code, geo_version, hiv_patients_distribution_year, sex, total) FROM stdin;
country	NG	2009	2015	Female	1671220
country	NG	2009	2015	Male	1501820
country	NG	2009	2016	Female	1699219
country	NG	2009	2016	Male	1500879
level1	NG_1_001	2009	2015	Female	33430
level1	NG_1_001	2009	2015	Male	24040
level1	NG_1_001	2009	2016	Female	33344
level1	NG_1_001	2009	2016	Male	23659
level1	NG_1_002	2009	2015	Female	28402
level1	NG_1_002	2009	2015	Male	22182
level1	NG_1_002	2009	2016	Female	33344
level1	NG_1_002	2009	2016	Male	21435
level1	NG_1_003	2009	2015	Female	110852
level1	NG_1_003	2009	2015	Male	108442
level1	NG_1_003	2009	2016	Female	115251
level1	NG_1_003	2009	2016	Male	111777
level1	NG_1_004	2009	2015	Female	24006
level1	NG_1_004	2009	2015	Male	16967
level1	NG_1_004	2009	2016	Female	25051
level1	NG_1_004	2009	2016	Male	17598
level1	NG_1_005	2009	2015	Female	20827
level1	NG_1_005	2009	2015	Male	30389
level1	NG_1_005	2009	2016	Female	20717
level1	NG_1_005	2009	2016	Male	29426
level1	NG_1_006	2009	2015	Female	38026
level1	NG_1_006	2009	2015	Male	28516
level1	NG_1_006	2009	2016	Female	37483
level1	NG_1_006	2009	2016	Male	27929
level1	NG_1_007	2009	2015	Female	100936
level1	NG_1_007	2009	2015	Male	82335
level1	NG_1_007	2009	2016	Female	102403
level1	NG_1_007	2009	2016	Male	82776
level1	NG_1_008	2009	2015	Female	33274
level1	NG_1_008	2009	2015	Male	26915
level1	NG_1_008	2009	2016	Female	32910
level1	NG_1_008	2009	2016	Male	26500
level1	NG_1_009	2009	2015	Female	35121
level1	NG_1_009	2009	2015	Male	40822
level1	NG_1_009	2009	2016	Female	36056
level1	NG_1_009	2009	2016	Male	40727
level1	NG_1_010	2009	2015	Female	19426
level1	NG_1_010	2009	2015	Male	13399
level1	NG_1_010	2009	2016	Female	19759
level1	NG_1_010	2009	2016	Male	13459
level1	NG_1_011	2009	2015	Female	22410
level1	NG_1_011	2009	2015	Male	25222
level1	NG_1_011	2009	2016	Female	22954
level1	NG_1_011	2009	2016	Male	25673
level1	NG_1_012	2009	2015	Female	47929
level1	NG_1_012	2009	2015	Male	90583
level1	NG_1_012	2009	2016	Female	49540
level1	NG_1_012	2009	2016	Male	92045
level1	NG_1_013	2009	2015	Female	2695
level1	NG_1_013	2009	2015	Male	2086
level1	NG_1_013	2009	2016	Female	2852
level1	NG_1_013	2009	2016	Male	2173
level1	NG_1_014	2009	2015	Female	18778
level1	NG_1_014	2009	2015	Male	14679
level1	NG_1_014	2009	2016	Female	19451
level1	NG_1_014	2009	2016	Male	15112
level1	NG_1_015	2009	2015	Female	8421
level1	NG_1_015	2009	2015	Male	6502
level1	NG_1_015	2009	2016	Female	8314
level1	NG_1_015	2009	2016	Male	6334
level1	NG_1_016	2009	2015	Female	58385
level1	NG_1_016	2009	2015	Male	42635
level1	NG_1_016	2009	2016	Female	60239
level1	NG_1_016	2009	2016	Male	42507
level1	NG_1_017	2009	2015	Female	36404
level1	NG_1_017	2009	2015	Male	18482
level1	NG_1_017	2009	2016	Female	36380
level1	NG_1_017	2009	2016	Male	18573
level1	NG_1_018	2009	2015	Female	74202
level1	NG_1_018	2009	2015	Male	31870
level1	NG_1_018	2009	2016	Female	79894
level1	NG_1_018	2009	2016	Male	34265
level1	NG_1_019	2009	2015	Female	20120
level1	NG_1_019	2009	2015	Male	47181
level1	NG_1_019	2009	2016	Female	20395
level1	NG_1_019	2009	2016	Male	47264
level1	NG_1_020	2009	2015	Female	81868
level1	NG_1_020	2009	2015	Male	86976
level1	NG_1_020	2009	2016	Female	79462
level1	NG_1_020	2009	2016	Male	82303
level1	NG_1_021	2009	2015	Female	40915
level1	NG_1_021	2009	2015	Male	64733
level1	NG_1_021	2009	2016	Female	40737
level1	NG_1_021	2009	2016	Male	62461
level1	NG_1_022	2009	2015	Female	15260
level1	NG_1_022	2009	2015	Male	32706
level1	NG_1_022	2009	2016	Female	14930
level1	NG_1_022	2009	2016	Male	29919
level1	NG_1_023	2009	2015	Female	13249
level1	NG_1_023	2009	2015	Male	11142
level1	NG_1_023	2009	2016	Female	12899
level1	NG_1_023	2009	2016	Male	10692
level1	NG_1_024	2009	2015	Female	25024
level1	NG_1_024	2009	2015	Male	24140
level1	NG_1_024	2009	2016	Female	24955
level1	NG_1_024	2009	2016	Male	22789
level1	NG_1_025	2009	2015	Female	16041
level1	NG_1_025	2009	2015	Male	15099
level1	NG_1_025	2009	2016	Female	16541
level1	NG_1_025	2009	2016	Male	15439
level1	NG_1_026	2009	2015	Female	119052
level1	NG_1_026	2009	2015	Male	80194
level1	NG_1_026	2009	2016	Female	125226
level1	NG_1_026	2009	2016	Male	84242
level1	NG_1_027	2009	2015	Female	64329
level1	NG_1_027	2009	2015	Male	39539
level1	NG_1_027	2009	2016	Female	67189
level1	NG_1_027	2009	2016	Male	41132
level1	NG_1_028	2009	2015	Female	43726
level1	NG_1_028	2009	2015	Male	24909
level1	NG_1_028	2009	2016	Female	42960
level1	NG_1_028	2009	2016	Male	24040
level1	NG_1_029	2009	2015	Female	25728
level1	NG_1_029	2009	2015	Male	58788
level1	NG_1_029	2009	2016	Female	25940
level1	NG_1_029	2009	2016	Male	57282
level1	NG_1_030	2009	2015	Female	39717
level1	NG_1_030	2009	2015	Male	43357
level1	NG_1_030	2009	2016	Female	39823
level1	NG_1_030	2009	2016	Male	42868
level1	NG_1_031	2009	2015	Female	35263
level1	NG_1_031	2009	2015	Male	26940
level1	NG_1_031	2009	2016	Female	35873
level1	NG_1_031	2009	2016	Male	27221
level1	NG_1_032	2009	2015	Female	118373
level1	NG_1_032	2009	2015	Male	91284
level1	NG_1_032	2009	2016	Female	120265
level1	NG_1_032	2009	2016	Male	92335
level1	NG_1_033	2009	2015	Female	37733
level1	NG_1_033	2009	2015	Male	27857
level1	NG_1_033	2009	2016	Female	38904
level1	NG_1_033	2009	2016	Male	28560
level1	NG_1_034	2009	2015	Female	65775
level1	NG_1_034	2009	2015	Male	48905
level1	NG_1_034	2009	2016	Female	66722
level1	NG_1_034	2009	2016	Male	49258
level1	NG_1_035	2009	2015	Female	74682
level1	NG_1_035	2009	2015	Male	57683
level1	NG_1_035	2009	2016	Female	73397
level1	NG_1_035	2009	2016	Male	56592
level1	NG_1_036	2009	2015	Female	87802
level1	NG_1_036	2009	2015	Male	68273
level1	NG_1_036	2009	2016	Female	90796
level1	NG_1_036	2009	2016	Male	69707
level1	NG_1_037	2009	2015	Female	33039
level1	NG_1_037	2009	2015	Male	26048
level1	NG_1_037	2009	2016	Female	31619
level1	NG_1_037	2009	2016	Male	24807
\.


--
-- Name: hiv_patients_distribution pk_hiv_patients_distribution; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hiv_patients_distribution
    ADD CONSTRAINT pk_hiv_patients_distribution PRIMARY KEY (geo_level, geo_code, geo_version, hiv_patients_distribution_year, sex);


--
-- PostgreSQL database dump complete
--

