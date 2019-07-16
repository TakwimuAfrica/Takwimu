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

ALTER TABLE IF EXISTS ONLY public.junior_secondary_school_enrollment DROP CONSTRAINT IF EXISTS pk_junior_secondary_school_enrollment;
DROP TABLE IF EXISTS public.junior_secondary_school_enrollment;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: junior_secondary_school_enrollment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.junior_secondary_school_enrollment (
    geo_level character varying(15) NOT NULL,
    geo_code character varying(10) NOT NULL,
    geo_version character varying(100) DEFAULT ''::character varying NOT NULL,
    sex character varying(128) NOT NULL,
    junior_secondary_school_enrollment_year character varying(128) NOT NULL,
    total integer
);


--
-- Data for Name: junior_secondary_school_enrollment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.junior_secondary_school_enrollment (geo_level, geo_code, geo_version, sex, junior_secondary_school_enrollment_year, total) FROM stdin;
country	NG	2009	Female	2015	2920182
country	NG	2009	Male	2015	3260109
country	NG	2009	Female	2016	2786332
country	NG	2009	Male	2016	3181810
level1	NG_1_001	2009	Female	2015	35347
level1	NG_1_001	2009	Male	2015	31755
level1	NG_1_001	2009	Female	2016	19633
level1	NG_1_001	2009	Male	2016	15709
level1	NG_1_002	2009	Female	2015	46664
level1	NG_1_002	2009	Male	2015	55127
level1	NG_1_002	2009	Female	2016	47614
level1	NG_1_002	2009	Male	2016	56286
level1	NG_1_003	2009	Female	2015	190263
level1	NG_1_003	2009	Male	2015	177488
level1	NG_1_003	2009	Female	2016	92432
level1	NG_1_003	2009	Male	2016	88500
level1	NG_1_004	2009	Female	2015	68637
level1	NG_1_004	2009	Male	2015	61269
level1	NG_1_004	2009	Female	2016	48548
level1	NG_1_004	2009	Male	2016	46064
level1	NG_1_005	2009	Female	2015	70142
level1	NG_1_005	2009	Male	2015	99089
level1	NG_1_005	2009	Female	2016	82239
level1	NG_1_005	2009	Male	2016	112110
level1	NG_1_006	2009	Female	2015	20674
level1	NG_1_006	2009	Male	2015	21514
level1	NG_1_006	2009	Female	2016	17472
level1	NG_1_006	2009	Male	2016	17879
level1	NG_1_007	2009	Female	2015	183168
level1	NG_1_007	2009	Male	2015	234728
level1	NG_1_007	2009	Female	2016	71648
level1	NG_1_007	2009	Male	2016	83618
level1	NG_1_008	2009	Female	2016	55018
level1	NG_1_008	2009	Male	2016	66238
level1	NG_1_009	2009	Female	2015	88609
level1	NG_1_009	2009	Male	2015	87120
level1	NG_1_009	2009	Female	2016	31237
level1	NG_1_009	2009	Male	2016	33075
level1	NG_1_010	2009	Female	2015	110994
level1	NG_1_010	2009	Male	2015	108651
level1	NG_1_010	2009	Female	2016	75388
level1	NG_1_010	2009	Male	2016	79740
level1	NG_1_011	2009	Female	2015	40427
level1	NG_1_011	2009	Male	2015	36570
level1	NG_1_011	2009	Female	2016	50741
level1	NG_1_011	2009	Male	2016	45849
level1	NG_1_012	2009	Female	2015	86814
level1	NG_1_012	2009	Male	2015	85949
level1	NG_1_012	2009	Female	2016	71370
level1	NG_1_012	2009	Male	2016	71213
level1	NG_1_013	2009	Female	2015	28972
level1	NG_1_013	2009	Male	2015	29017
level1	NG_1_013	2009	Female	2016	29604
level1	NG_1_013	2009	Male	2016	29073
level1	NG_1_014	2009	Female	2015	70857
level1	NG_1_014	2009	Male	2015	59619
level1	NG_1_014	2009	Female	2016	66259
level1	NG_1_014	2009	Male	2016	55548
level1	NG_1_015	2009	Female	2015	71190
level1	NG_1_015	2009	Male	2015	68217
level1	NG_1_015	2009	Female	2016	46122
level1	NG_1_015	2009	Male	2016	45205
level1	NG_1_016	2009	Female	2015	38853
level1	NG_1_016	2009	Male	2015	49097
level1	NG_1_016	2009	Female	2016	41000
level1	NG_1_016	2009	Male	2016	51228
level1	NG_1_017	2009	Female	2015	238163
level1	NG_1_017	2009	Male	2015	237404
level1	NG_1_017	2009	Female	2016	208780
level1	NG_1_017	2009	Male	2016	208537
level1	NG_1_018	2009	Female	2015	44392
level1	NG_1_018	2009	Male	2015	63443
level1	NG_1_018	2009	Female	2016	59849
level1	NG_1_018	2009	Male	2016	85958
level1	NG_1_019	2009	Female	2015	44514
level1	NG_1_019	2009	Male	2015	47493
level1	NG_1_019	2009	Female	2016	138047
level1	NG_1_019	2009	Male	2016	167595
level1	NG_1_020	2009	Female	2015	194125
level1	NG_1_020	2009	Male	2015	242369
level1	NG_1_020	2009	Female	2016	199237
level1	NG_1_020	2009	Male	2016	242398
level1	NG_1_021	2009	Female	2015	102746
level1	NG_1_021	2009	Male	2015	144755
level1	NG_1_021	2009	Female	2016	111514
level1	NG_1_021	2009	Male	2016	154668
level1	NG_1_022	2009	Female	2015	46882
level1	NG_1_022	2009	Male	2015	99032
level1	NG_1_022	2009	Female	2016	47804
level1	NG_1_022	2009	Male	2016	95598
level1	NG_1_023	2009	Female	2015	42549
level1	NG_1_023	2009	Male	2015	44101
level1	NG_1_023	2009	Female	2016	31933
level1	NG_1_023	2009	Male	2016	33520
level1	NG_1_024	2009	Female	2015	16842
level1	NG_1_024	2009	Male	2015	17896
level1	NG_1_024	2009	Female	2016	63188
level1	NG_1_024	2009	Male	2016	65939
level1	NG_1_025	2009	Female	2015	238263
level1	NG_1_025	2009	Male	2015	223337
level1	NG_1_025	2009	Female	2016	239663
level1	NG_1_025	2009	Male	2016	232384
level1	NG_1_026	2009	Female	2015	38687
level1	NG_1_026	2009	Male	2015	48968
level1	NG_1_026	2009	Female	2016	46433
level1	NG_1_026	2009	Male	2016	53689
level1	NG_1_027	2009	Female	2015	71654
level1	NG_1_027	2009	Male	2015	107474
level1	NG_1_027	2009	Female	2016	93121
level1	NG_1_027	2009	Male	2016	124255
level1	NG_1_028	2009	Female	2015	146109
level1	NG_1_028	2009	Male	2015	146721
level1	NG_1_028	2009	Female	2016	133614
level1	NG_1_028	2009	Male	2016	135093
level1	NG_1_029	2009	Female	2015	105718
level1	NG_1_029	2009	Male	2015	110753
level1	NG_1_029	2009	Female	2016	60632
level1	NG_1_029	2009	Male	2016	59274
level1	NG_1_030	2009	Female	2015	13281
level1	NG_1_030	2009	Male	2015	12398
level1	NG_1_030	2009	Female	2016	62490
level1	NG_1_030	2009	Male	2016	63876
level1	NG_1_031	2009	Female	2015	165096
level1	NG_1_031	2009	Male	2015	166199
level1	NG_1_031	2009	Female	2016	148830
level1	NG_1_031	2009	Male	2016	146750
level1	NG_1_032	2009	Female	2015	54771
level1	NG_1_032	2009	Male	2015	61491
level1	NG_1_032	2009	Female	2016	47848
level1	NG_1_032	2009	Male	2016	52347
level1	NG_1_033	2009	Female	2015	78108
level1	NG_1_033	2009	Male	2015	72143
level1	NG_1_033	2009	Female	2016	59692
level1	NG_1_033	2009	Male	2016	55633
level1	NG_1_034	2009	Female	2015	32337
level1	NG_1_034	2009	Male	2015	58732
level1	NG_1_034	2009	Female	2016	71132
level1	NG_1_034	2009	Male	2016	128906
level1	NG_1_035	2009	Female	2015	31007
level1	NG_1_035	2009	Male	2015	40638
level1	NG_1_035	2009	Female	2016	49218
level1	NG_1_035	2009	Male	2016	67371
level1	NG_1_036	2009	Female	2015	29227
level1	NG_1_036	2009	Male	2015	46716
level1	NG_1_036	2009	Female	2016	32009
level1	NG_1_036	2009	Male	2016	42643
level1	NG_1_037	2009	Female	2015	34100
level1	NG_1_037	2009	Male	2015	62836
level1	NG_1_037	2009	Female	2016	34973
level1	NG_1_037	2009	Male	2016	68041
\.


--
-- Name: junior_secondary_school_enrollment pk_junior_secondary_school_enrollment; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.junior_secondary_school_enrollment
    ADD CONSTRAINT pk_junior_secondary_school_enrollment PRIMARY KEY (geo_level, geo_code, geo_version, sex, junior_secondary_school_enrollment_year);


--
-- PostgreSQL database dump complete
--
